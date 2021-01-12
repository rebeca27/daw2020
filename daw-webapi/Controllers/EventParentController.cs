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
    public class EventParentController : Controller
    {
        readonly IEventParentService _eventParentService;
        readonly IEventTypeService _eventTypeService;
        readonly IEventGenreService _eventGenreService;
        readonly IEventTypeXEventGenreService _eventTypeXEventGenreService;
        readonly ITicketService _ticketService;
        readonly IPersonXTicketService _personXTicketService;
        readonly ILocationService _locationService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;

        public EventParentController(IEventParentService eventParentService, IIdentityService identityService, IMapper mapper, IEventTypeService eventTypeService, IEventGenreService eventGenreService, ILocationService locationService, IEventTypeXEventGenreService eventTypeXEventGenreService, ITicketService ticketService, IPersonXTicketService personXTicketService)
        {
            _eventParentService = eventParentService;
            _identityService = identityService;
            _mapper = mapper;
            _eventTypeService = eventTypeService;
            _eventGenreService = eventGenreService;
            _locationService = locationService;
            _eventTypeXEventGenreService = eventTypeXEventGenreService;
            _ticketService = ticketService;
            _personXTicketService = personXTicketService;
        }

        [HttpGet(ApiRoutes.EventParentRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<EventParentDto>>(await _eventParentService.GetEventParents()));
        }

        [HttpGet(ApiRoutes.EventParentRoutes.Select)]
        public async Task<IActionResult> Select()
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

            return Ok(await _eventParentService.GetEventParentSelect());
        }

        [HttpGet(ApiRoutes.EventParentRoutes.Get)]
        public async Task<IActionResult> Get(long eventParentId)
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

            var item = await _eventParentService.GetEventParentById(eventParentId);
            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new EventParentDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    Deleted = item.Deleted
            //};
            return Ok(_mapper.Map<EventParentDto>(item));
        }

        [Authorize(Roles = "Admin, EventManager")]
        [HttpDelete(ApiRoutes.EventParentRoutes.Delete)]
        public async Task<IActionResult> Delete(long eventParentId)
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

            var eventParent = await _eventParentService.GetEventParentById(eventParentId);

            if (eventParent == null)
            {
                return BadRequest(new { error = "Selected eventParent was not found" });
            }

            var tickets = await _ticketService.GetTicketsByEventId(eventParentId);

            var ticketIds = tickets.Select(x => x.Id).ToList();

            var anyBoughtTickets = await _personXTicketService.ExistsAnyBoughtTickets(ticketIds);

            if (anyBoughtTickets)
            {
                return BadRequest(new { error = "You can't delete this event. Some tickets sold already" });
            }

            await _eventParentService.DeleteEventParent(eventParent, tickets);

            return NoContent();
        }

        [Authorize(Roles = "Admin, EventManager")]
        [HttpPut(ApiRoutes.EventParentRoutes.Update)]
        public async Task<IActionResult> UpdateAsync([FromBody] EventParentDto model)
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

            var eventParent = await _eventParentService.GetEventParentById(model.Id);

            if (eventParent == null)
            {
                return BadRequest(new { error = "Selected eventParent was not found" });
            }

            var eventType = await _eventTypeService.GetEventTypeById(model.EventTypeId);

            if (eventType == null)
            {
                return BadRequest(new { error = "Selected event type was not found" });
            }

            var eventGenre = await _eventGenreService.GetEventGenreById(model.EventGenreId);

            if (eventGenre == null)
            {
                return BadRequest(new { error = "Selected event eventParent was not found" });
            }

            var location = await _locationService.GetLocationById(model.LocationId);

            if (location == null)
            {
                return BadRequest(new { error = "Selected location was not found" });
            }

            bool result = Uri.TryCreate(model.PhotoURL, UriKind.Absolute, out Uri uriResult)
                && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);

            if (result == false)
            {
                return BadRequest(new { error = "Photo URL is not valid" });
            }

            eventParent.Name = model.Name;
            eventParent.Description = model.Description;
            eventParent.EventGenreId = model.EventGenreId;
            eventParent.EventTypeId = model.EventTypeId;
            eventParent.LocationId = model.LocationId;
            eventParent.DateAndHour = model.DateAndHour;
            eventParent.PhotoURL = model.PhotoURL;

            await _eventParentService.UpdateEventParent(eventParent);

            return Ok();

        }

        [Authorize(Roles = "Admin, EventManager")]
        [HttpPost(ApiRoutes.EventParentRoutes.Create)]
        public async Task<IActionResult> Create([FromBody] EventParentDto model)
        {
            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            if (!ModelState.IsValid)
            {
                return NotFound();
            }

            if (model == null)
            {
                return NotFound();
            }

            var person = await _identityService.GetPersonByUserId(currentUser.Id);

            if (person == null)
            {
                return BadRequest(new { error = "Person was not found" });
            }

            var eventType = await _eventTypeService.GetEventTypeById(model.EventTypeId);

            if (eventType == null)
            {
                return BadRequest(new { error = "Selected event type was not found" });
            }

            var eventGenre = await _eventGenreService.GetEventGenreById(model.EventGenreId);

            if (eventGenre == null)
            {
                return BadRequest(new { error = "Selected event eventParent was not found" });
            }

            var location = await _locationService.GetLocationById(model.LocationId);

            if (location == null)
            {
                return BadRequest(new { error = "Selected location was not found" });
            }

            var eventTypeXEventGenreExists = await _eventTypeXEventGenreService.ExistsEventTypeXEventGenre(model.EventTypeId, model.EventGenreId);

            if (!eventTypeXEventGenreExists)
            {
                return BadRequest(new { error = "Link between type and genre was not found" });
            }

            bool result = Uri.TryCreate(model.PhotoURL, UriKind.Absolute, out Uri uriResult)
                && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);

            if (result == false)
            {
                return BadRequest(new { error = "Photo URL is not valid" });
            }

            var eventParent = new EventParent()
            {
                Name = model.Name,
                Description = model.Description,
                Deleted = model.Deleted,
                PersonId = person.Id,
                EventTypeId = model.EventTypeId,
                EventGenreId = model.EventGenreId,
                LocationId = model.LocationId,
                DateAndHour = model.DateAndHour,
                PhotoURL = model.PhotoURL
            };

            await _eventParentService.CreateEventParent(eventParent);

            return Ok(eventParent);
        }
    }
}
