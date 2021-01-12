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
    public class TicketController : Controller
    {
        readonly ITicketService _ticketService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly IEventParentService _eventParentService;
        readonly ITicketTypeService _ticketTypeService;
        readonly IPersonXTicketService _personXTicketService;
        public TicketController(ITicketService ticketService, IIdentityService identityService, IMapper mapper, IEventParentService eventParentService, ITicketTypeService ticketTypeService, IPersonXTicketService personXTicketService)
        {
            _ticketService = ticketService;
            _identityService = identityService;
            _mapper = mapper;
            _eventParentService = eventParentService;
            _ticketTypeService = ticketTypeService;
            _personXTicketService = personXTicketService;
        }

        [HttpGet(ApiRoutes.TicketRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<TicketDto>>(await _ticketService.GetTickets()));
        }

        [HttpGet(ApiRoutes.TicketRoutes.GetTicketsByEventId)]
        public async Task<IActionResult> GetTicketsByEventId(long eventId)
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

            return Ok(_mapper.Map<List<TicketDto>>(await _ticketService.GetTicketsByEventId(eventId)));
        }

        [HttpGet(ApiRoutes.TicketRoutes.Get)]
        public async Task<IActionResult> Get(long ticketId)
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

            var item = await _ticketService.GetTicketById(ticketId);

            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new TicketDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    ShortName = item.ShortName,
            //    Deleted = item.Deleted
            //};

            return Ok(_mapper.Map<TicketDto>(item));
        }

        [HttpDelete(ApiRoutes.TicketRoutes.Delete)]
        [Authorize(Roles = "Admin, EventManager")]
        public async Task<IActionResult> Delete(long ticketId)
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

            var ticket = await _ticketService.GetTicketById(ticketId);

            if (ticket == null)
            {
                return BadRequest(new { error = "Selected ticket was not found" });
            }

            var ticketIds = new List<long>
            {
                ticketId
            };

            var anyBoughtTickets = await _personXTicketService.ExistsAnyBoughtTickets(ticketIds);

            if (anyBoughtTickets)
            {
                return BadRequest(new { error = "Someone bought this ticket. You can't delete this" });
            }

            await _ticketService.DeleteTicket(ticket);

            return NoContent();
        }

        [HttpPut(ApiRoutes.TicketRoutes.Update)]
        [Authorize(Roles = "Admin, EventManager")]
        public async Task<IActionResult> UpdateAsync([FromBody] TicketDto model)
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
                return BadRequest(new { error = "Person was not found" });
            }

            var ticket = await _ticketService.GetTicketById(model.Id);

            if (ticket == null)
            {
                return BadRequest(new { error = "Selected ticket was not found" });
            }

            var eventParent = await _eventParentService.GetEventParentById(model.EventParentId);

            if (eventParent == null)
            {
                return BadRequest(new { error = "Selected event child was not found" });
            }

            var ticketType = await _ticketTypeService.GetTicketTypeById(model.TicketTypeId);

            if (ticketType == null)
            {
                return BadRequest(new { error = "Selected ticket type was not found" });
            }

            var existingType = await _ticketService.ExistingTicketType(model.TicketTypeId, model.EventParentId, model.Id);

            if (existingType)
            {
                return BadRequest(new { error = "Event child can not have the same ticket type twice" });
            }

            ticket.EventParentId = model.EventParentId;
            ticket.Price = model.Price;
            ticket.Remaining = model.Remaining;
            ticket.TicketTypeId = model.TicketTypeId;
            ticket.Deleted = model.Deleted;

            await _ticketService.UpdateTicket(ticket);

            return Ok();

        }

        [HttpPost(ApiRoutes.TicketRoutes.Create)]
        [Authorize(Roles = "Admin, EventManager")]
        public async Task<IActionResult> Create([FromBody] TicketDto model)
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

            if (!ModelState.IsValid)
            {
                return NotFound();
            }

            if (model == null)
            {
                return NotFound();
            }

            var eventParent = await _eventParentService.GetEventParentById(model.EventParentId);

            if (eventParent == null)
            {
                return BadRequest(new { error = "Selected event child was not found" });
            }

            var ticketType = await _ticketTypeService.GetTicketTypeById(model.TicketTypeId);

            if (ticketType == null)
            {
                return BadRequest(new { error = "Selected ticket type was not found" });
            }

            var existingType = await _ticketService.ExistingTicketType(model.TicketTypeId, model.EventParentId, model.Id);

            if (existingType)
            {
                return BadRequest(new { error = "Event child can not have the same ticket type twice" });
            }

            var ticket = new Ticket()
            {
                EventParentId = model.EventParentId,
                TicketTypeId = model.TicketTypeId,
                Price = model.Price,
                Remaining = model.Remaining
            };

            await _ticketService.CreateTicket(ticket);

            return Ok();
        }
    }
}
