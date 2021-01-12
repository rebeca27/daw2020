using daw_webapi.Constants;
using daw_webapi.Contracts.Requests;
using daw_webapi.Data;
using daw_webapi.Models;
using daw_webapi.Options;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public class IdentityService : IIdentityService
    {
        private readonly UserManager<IdentityUser<long>> _userManager;
        private readonly RoleManager<IdentityRole<long>> _roleManager;
        private readonly JwtSettings _jwtSettings;
        private readonly TokenValidationParameters _tokenValidationParameters;
        private readonly DataContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public IdentityService(UserManager<IdentityUser<long>> userManager, 
            JwtSettings jwtSettings, TokenValidationParameters tokenValidationParameters, DataContext context, 
            RoleManager<IdentityRole<long>> roleManager, IHttpContextAccessor httpContextAccessor)
        {
            _userManager = userManager;
            _jwtSettings = jwtSettings;
            _tokenValidationParameters = tokenValidationParameters;
            _context = context;
            _roleManager = roleManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IdentityUser<long>> GetCurrentUser()
        {
            var currentUserId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.Email);

            if (currentUserId == null)
            {
                return null;
            }
            return await _userManager.FindByEmailAsync(currentUserId.Value);
        }

        public async Task<AuthenticationResult> RegisterAsync(UserRegistrationRequest userToAdd)
        {
            var existingUser = await _userManager.FindByEmailAsync(userToAdd.Email);

            if (existingUser != null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { "User with this email address already exists" }
                };
            }

            using var transaction = _context.Database.BeginTransaction();
            try
            {
                var newUser = new IdentityUser<long>
                {
                    Email = userToAdd.Email,
                    UserName = userToAdd.Email
                };

                var createdUser = await _userManager.CreateAsync(newUser, userToAdd.Password);

                if (!createdUser.Succeeded)
                {
                    return new AuthenticationResult
                    {
                        Errors = createdUser.Errors.Select(x => x.Description)
                    };
                }

                await _userManager.AddToRoleAsync(newUser, RoleConstants.User);

                var person = new Person
                {
                    FirstName = userToAdd.FirstName,
                    LastName = userToAdd.LastName,
                    UserId = newUser.Id
                };

                await _context.AddAsync(person);

                await _context.SaveChangesAsync();

                // Commit transaction if all commands succeed, transaction will auto-rollback
                // when disposed if either commands fails
                await transaction.CommitAsync();
                return await GenerateAuthenticationResultForUserAsync(newUser);
            }
            catch (Exception e)
            {
                await transaction.RollbackAsync();

                throw new Exception(e.ToString());
            }
        }

        public async Task<AuthenticationResult> LoginAsync(string email, string password)
        {
            var user = await _userManager.FindByEmailAsync(email);

            if (user == null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { "User does not exist" }
                };
            }

            var userHasValidPassword = await _userManager.CheckPasswordAsync(user, password);

            if (!userHasValidPassword)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { "User/password combination is wrong" }
                };
            }

            var person = await GetPersonByUserId(user.Id);
            
            if (person == null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { "User has no valid person" }
                };
            }

            return await GenerateAuthenticationResultForUserAsync(user);
        }

        public async Task<AuthenticationResult> RefreshTokenAsync(string token, string refreshToken)
        {
            var validatedToken = GetPrincipalFromToken(token);

            if (validatedToken == null)
            {
                return new AuthenticationResult { Errors = new[] { "Invalid Token" } };
            }

            var expiryDateUnix =
                long.Parse(validatedToken.Claims.Single(x => x.Type == JwtRegisteredClaimNames.Exp).Value);

            var expiryDateTimeUtc = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)
                .AddSeconds(expiryDateUnix);

            if (expiryDateTimeUtc > DateTime.UtcNow)
            {
                return new AuthenticationResult { Errors = new[] { "This token hasn't expired yet" } };
            }

            var jti = validatedToken.Claims.Single(x => x.Type == JwtRegisteredClaimNames.Jti).Value;

            var storedRefreshToken = await _context.RefreshTokens.SingleOrDefaultAsync(x => x.Token == refreshToken);

            if (storedRefreshToken == null)
            {
                return new AuthenticationResult { Errors = new[] { "This refresh token does not exist" } };
            }

            if (DateTime.UtcNow > storedRefreshToken.ExpiryDate)
            {
                return new AuthenticationResult { Errors = new[] { "This refresh token has expired" } };
            }

            if (storedRefreshToken.Invalidated)
            {
                return new AuthenticationResult { Errors = new[] { "This refresh token has been invalidated" } };
            }

            if (storedRefreshToken.Used)
            {
                return new AuthenticationResult { Errors = new[] { "This refresh token has been used" } };
            }

            if (storedRefreshToken.JwtId != jti)
            {
                return new AuthenticationResult { Errors = new[] { "This refresh token does not match this JWT" } };
            }

            storedRefreshToken.Used = true;
            _context.RefreshTokens.Update(storedRefreshToken);
            await _context.SaveChangesAsync();

            var user = await _userManager.FindByIdAsync(validatedToken.Claims.Single(x => x.Type == "id").Value);
            return await GenerateAuthenticationResultForUserAsync(user);
        }

        private ClaimsPrincipal GetPrincipalFromToken(string token)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            try
            {
                var principal = tokenHandler.ValidateToken(token, _tokenValidationParameters, out var validatedToken);
                if (!IsJwtWithValidSecurityAlgorithm(validatedToken))
                {
                    return null;
                }

                return principal;
            }
            catch
            {
                return null;
            }
        }

        private bool IsJwtWithValidSecurityAlgorithm(SecurityToken validatedToken)
        {
            return (validatedToken is JwtSecurityToken jwtSecurityToken) &&
                   jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256,
                       StringComparison.InvariantCultureIgnoreCase);
        }

        private async Task<AuthenticationResult> GenerateAuthenticationResultForUserAsync(IdentityUser<long> user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);

            var person = await GetPersonByUserId(user.Id);

            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim("firstName", person.FirstName),
                new Claim("lastName", person.LastName),
                new Claim("id", user.Id.ToString())
            };

            var userClaims = await _userManager.GetClaimsAsync(user);
            claims.AddRange(userClaims);

            var userRoles = await _userManager.GetRolesAsync(user);
            foreach (var userRole in userRoles)
            {
                claims.Add(new Claim(ClaimTypes.Role, userRole));
                var role = await _roleManager.FindByNameAsync(userRole);
                if (role == null) continue;
                var roleClaims = await _roleManager.GetClaimsAsync(role);

                foreach (var roleClaim in roleClaims)
                {
                    if (claims.Contains(roleClaim))
                        continue;

                    claims.Add(roleClaim);
                }
            }

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.Add(_jwtSettings.TokenLifetime),
                SigningCredentials =
                    new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);

            var refreshToken = new RefreshToken
            {
                JwtId = token.Id,
                UserId = user.Id,
                CreationDate = DateTime.UtcNow,
                ExpiryDate = DateTime.UtcNow.AddMonths(6)
            };

            await _context.RefreshTokens.AddAsync(refreshToken);
            await _context.SaveChangesAsync();

            return new AuthenticationResult
            {
                Success = true,
                Token = tokenHandler.WriteToken(token),
                RefreshToken = refreshToken.Token
            };
        }


        public async Task<Person> GetPersonByUserId(long userId)
        {
            return await _context.Persons.SingleOrDefaultAsync(x => x.UserId == userId && !x.Deleted);
        }

        public async Task<Person> GetPersonById(long personId)
        {
            return await _context.Persons.SingleOrDefaultAsync(x => x.Id == personId && !x.Deleted);
        }

        public async Task DeletePerson(Person person, IList<EventParent> events, IList<Ticket> tickets, IList<PersonXTicket> personXTickets)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                person.Deleted = true;
                
                _context.Update(person);

                foreach(var evt in events)
                {
                    evt.Deleted = true;
                }

                _context.UpdateRange(events);

                foreach(var ticket in tickets)
                {
                    ticket.Deleted = true;
                }

                _context.UpdateRange(tickets);

                foreach(var personXTicket in personXTickets)
                {
                    personXTicket.Deleted = true;
                }

                _context.UpdateRange(personXTickets);

                await _context.SaveChangesAsync();

                // Commit transaction if all commands succeed, transaction will auto-rollback
                // when disposed if either commands fails
                await transaction.CommitAsync();
            }
            catch (Exception e)
            {
                await transaction.RollbackAsync();

                throw new Exception(e.ToString());
            }
        }

        public async Task<IList<Person>> GetPersons()
        {
            return await _context.Persons.Include(x => x.User).Where(x => !x.Deleted).ToListAsync();
        }
    }
}
