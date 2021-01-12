using AutoMapper;
using daw_webapi.Contracts;
using daw_webapi.Contracts.Dtos;
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
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Produces("application/json")]
    public class PersonXTicketController : Controller
    {
        readonly ITicketService _ticketService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly IPersonXTicketService _personXTicketService;
        public PersonXTicketController(IPersonXTicketService personXTicketService, ITicketService ticketService, IIdentityService identityService, IMapper mapper)
        {
            _personXTicketService = personXTicketService;
            _ticketService = ticketService;
            _identityService = identityService;
            _mapper = mapper;
        }

        [HttpGet(ApiRoutes.PersonXTicketRoutes.GetAll)]
        public async Task<IActionResult> GetAll()
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            return Ok(_mapper.Map<List<PersonXTicketDto>>(await _personXTicketService.GetPersonXTickets()));
        }

        [HttpGet(ApiRoutes.PersonXTicketRoutes.Get)]
        public async Task<IActionResult> Get(long personXTicketId)
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            var item = await _personXTicketService.GetPersonXTicketById(personXTicketId);

            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new PersonXTicketDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    ShortName = item.ShortName,
            //    Deleted = item.Deleted
            //};

            return Ok(_mapper.Map<PersonXTicketDto>(item));
        }

        [HttpGet(ApiRoutes.PersonXTicketRoutes.GetByCurrentPerson)]
        public async Task<IActionResult> GetAllByCurrentPerson()
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            return Ok(_mapper.Map<List<PersonXTicketDto>>(await _personXTicketService.GetPersonXTicketsByPerson(person.Id)));
        }

        [HttpDelete(ApiRoutes.PersonXTicketRoutes.Delete)]
        public async Task<IActionResult> Delete(long personXTicketId)
        {

            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            var personXTicket = await _personXTicketService.GetPersonXTicketById(personXTicketId);

            if (personXTicket == null)
            {
                return BadRequest(new { error = "Selected personXTicket was not found" });
            }

            var ticket = await _ticketService.GetTicketById(personXTicket.TicketId);

            if (ticket == null)
            {
                return BadRequest(new { error = "Selected ticket was not found" });
            }

            ticket.Remaining += (personXTicket.NrOfBought - personXTicket.NrOfReturned);

            await _personXTicketService.DeletePersonXTicket(personXTicket, ticket);

            return NoContent();
        }

        [HttpPut(ApiRoutes.PersonXTicketRoutes.Update)]
        public async Task<IActionResult> UpdateAsync([FromBody] PersonXTicketDto model)
        {
            if (model == null)
            {
                return NotFound();
            }

            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person does not exist for this user" });
            }

            var personXTicket = await _personXTicketService.GetPersonXTicketById(model.Id);

            if (personXTicket == null)
            {
                return BadRequest(new { error = "Selected personXTicket was not found" });
            }

            var ticket = await _ticketService.GetTicketById(personXTicket.TicketId);

            if (ticket == null)
            {
                return BadRequest(new { error = "Selected ticket was not found" });
            }

            ticket.Remaining += model.Returning;
            personXTicket.NrOfReturned += model.Returning;

            if (personXTicket.NrOfReturned == personXTicket.NrOfBought)
            {
                await _personXTicketService.DeletePersonXTicket(personXTicket, ticket);
            }
            else
            {
                await _personXTicketService.UpdatePersonXTicket(personXTicket, ticket);
            }



            return Ok();

        }

        [HttpPost(ApiRoutes.PersonXTicketRoutes.Create)]
        public async Task<IActionResult> Create([FromBody] PersonXTicketDto model)
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person does not exist for this user" });
            }

            if (!ModelState.IsValid)
            {
                return NotFound();
            }

            if (model == null)
            {
                return NotFound();
            }

            var ticket = await _ticketService.GetTicketById(model.TicketId);

            if (ticket == null)
            {
                return BadRequest(new { error = "Selected ticket was not found" });
            }

            if (ticket.Remaining <= 0 || ticket.Remaining - model.NrOfBought < 0)
            {
                return BadRequest(new { error = $"There aren't so many tickets available. There are only {ticket.Remaining} more!" });
            }

            if (model.NrOfBought <= 0)
            {
                return BadRequest(new { error = "Number of bought tickets must be higher than 0" });
            }

            var existingLink = await _personXTicketService.ExistingPersonXTicket(model.PersonId, model.TicketId);

            ticket.Remaining -= model.NrOfBought;

            if (existingLink != null)
            {
                existingLink.NrOfBought += model.NrOfBought;
                await _personXTicketService.UpdatePersonXTicket(existingLink, ticket);
            }
            else
            {
                var personXTicket = new PersonXTicket()
                {
                    TicketId = model.TicketId,
                    NrOfBought = model.NrOfBought,
                    NrOfReturned = 0,
                    PersonId = person.Id
                };

                await _personXTicketService.CreatePersonXTicket(personXTicket, ticket);
            }

            return Ok();
        }
    }
}
