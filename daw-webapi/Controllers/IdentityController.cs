using AutoMapper;
using daw_webapi.Contracts;
using daw_webapi.Contracts.Dtos;
using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using daw_webapi.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Controllers
{
    [Produces("application/json")]
    public class IdentityController : Controller
    {
        private readonly IIdentityService _identityService;

        public IdentityController(IIdentityService identityService)
        {
            _identityService = identityService;
        }

        [HttpPost(ApiRoutes.IdentityRoutes.Register)]
        public async Task<IActionResult> Register([FromBody] UserRegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new AuthFailedResponse
                {
                    Errors = ModelState.Values.SelectMany(x => x.Errors.Select(xx => xx.ErrorMessage))
                });
            }

            if (request == null)
            {
                return NotFound();
            }

            var authResponse = await _identityService.RegisterAsync(request);

            if (!authResponse.Success)
            {
                return BadRequest(new AuthFailedResponse
                {
                    Errors = authResponse.Errors
                });
            }

            return Ok(new AuthSuccessResponse
            {
                Token = authResponse.Token,
                RefreshToken = authResponse.RefreshToken
            });
        }

        [HttpPost(ApiRoutes.IdentityRoutes.Login)]
        public async Task<IActionResult> Login([FromBody] UserLoginRequest request)
        {
            if (request == null)
            {
                return NotFound();
            }

            var authResponse = await _identityService.LoginAsync(request.Email, request.Password);

            if (!authResponse.Success)
            {
                return BadRequest(new AuthFailedResponse
                {
                    Errors = authResponse.Errors
                });
            }

            return Ok(new AuthSuccessResponse
            {
                Token = authResponse.Token,
                RefreshToken = authResponse.RefreshToken
            });
        }

        [HttpPost(ApiRoutes.IdentityRoutes.Refresh)]
        public async Task<IActionResult> Refresh([FromBody] RefreshTokenRequest request)
        {
            if (request == null)
            {
                return NotFound();
            }

            var authResponse = await _identityService.RefreshTokenAsync(request.Token, request.RefreshToken);

            if (!authResponse.Success)
            {
                return BadRequest(new AuthFailedResponse
                {
                    Errors = authResponse.Errors
                });
            }

            return Ok(new AuthSuccessResponse
            {
                Token = authResponse.Token,
                RefreshToken = authResponse.RefreshToken
            });
        }

        //[HttpPost(ApiRoutes.IdentityRoutes.AddRoles)]
        //public async Task<IActionResult> AddRoles([FromBody] UserSetRoleRequest request)
        //{
        //    if (request == null)
        //    {
        //        return NotFound();
        //    }

        //    var currentUser = await _identityService.GetCurrentUser();

        //    if (currentUser == null)
        //    {
        //        return BadRequest(new { error = "You are not allowed!" });
        //    }


        //}
    }
}
