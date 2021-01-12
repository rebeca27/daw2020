using daw_webapi.Contracts.Requests;
using daw_webapi.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IIdentityService
    {
        Task<AuthenticationResult> RegisterAsync(UserRegistrationRequest userToAdd);

        Task<AuthenticationResult> LoginAsync(string email, string password);

        Task<AuthenticationResult> RefreshTokenAsync(string token, string refreshToken);

        Task<IdentityUser<long>> GetCurrentUser();

        Task<Person> GetPersonByUserId(long userId);

        Task<Person> GetPersonById(long personId);

        Task DeletePerson(Person person, IList<EventParent> events, IList<Ticket> tickets, IList<PersonXTicket> personXTickets);

        Task<IList<Person>> GetPersons();
    }
}
