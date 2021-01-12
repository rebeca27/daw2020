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
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Produces("application/json")]
    public class PersonController : Controller
    {
        private readonly IIdentityService _identityService;
        readonly IEventParentService _eventParentService;
        readonly ITicketService _ticketService;
        readonly IPersonXTicketService _personXTicketService;
        readonly IMapper _mapper;

        public PersonController(IIdentityService identityService, IMapper mapper, IEventParentService eventParentService, ITicketService ticketService, IPersonXTicketService personXTicketService)
        {
            _identityService = identityService;
            _eventParentService = eventParentService;
            _ticketService = ticketService;
            _personXTicketService = personXTicketService;
            _mapper = mapper;
        }

        [HttpGet(ApiRoutes.PersonRoutes.GetPersons)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetPersons()
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var currentPerson = await _identityService.GetPersonByUserId(currentUser.Id);

            if (currentPerson == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            return Ok(_mapper.Map<List<PersonDto>>(await _identityService.GetPersons()));
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete(ApiRoutes.PersonRoutes.Delete)]
        public async Task<IActionResult> Delete(long personId)
        {

            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var currentPerson = await _identityService.GetPersonByUserId(currentUser.Id);

            if (currentPerson == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            var person = await _identityService.GetPersonById(personId);

            if (person == null)
            {
                return BadRequest(new { error = "Selected person was not found" });
            }

            var events = await _eventParentService.GetEventsByPersonId(personId);

            List<Ticket> tickets = new List<Ticket>();

            foreach (var evt in events)
            {
                tickets.AddRange(await _ticketService.GetTicketsByEventId(evt.Id));
            }

            var personXTickets = await _personXTicketService.GetLinkByPersonId(personId);

            await _identityService.DeletePerson(person, events, tickets, personXTickets);

            return NoContent();
        }

        [HttpGet(ApiRoutes.PersonRoutes.Get)]
        public async Task<IActionResult> Get()
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

            return Ok(_mapper.Map<PersonDto>(person));
        }
    }
}
