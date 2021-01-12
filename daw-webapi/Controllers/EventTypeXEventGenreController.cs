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
    public class EventTypeXEventGenreController : Controller
    {
        readonly IEventTypeXEventGenreService _eventTypeXEventGenreService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly IEventParentService _eventParentService;
        public EventTypeXEventGenreController(IEventTypeXEventGenreService eventTypeXEventGenreService, IIdentityService identityService, IMapper mapper, IEventParentService eventParentService)
        {
            _eventTypeXEventGenreService = eventTypeXEventGenreService;
            _identityService = identityService;
            _mapper = mapper;
            _eventParentService = eventParentService;
        }

        [HttpGet(ApiRoutes.EventTypeXEventGenreRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<EventTypeXEventGenreDto>>(await _eventTypeXEventGenreService.GetEventTypeXEventGenres()));
        }

        [HttpGet(ApiRoutes.EventTypeXEventGenreRoutes.Select)]
        public async Task<IActionResult> Select(long typeId)
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

            return Ok(await _eventTypeXEventGenreService.GetEventGenreSelectByEventType(typeId));
        }

        [HttpGet(ApiRoutes.EventTypeXEventGenreRoutes.Get)]
        public async Task<IActionResult> Get(long typeXGenreId)
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

            var item = await _eventTypeXEventGenreService.GetEventTypeXEventGenreById(typeXGenreId);

            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new EventTypeXEventGenreDto
            //{
            //    Id = item.Id,
            //    EventTypeName = item.EventType.Name,
            //    EventGenreName = item.EventGenre.Name,
            //    EventGenreId = item.EventGenreId,
            //    EventTypeId = item.EventTypeId,
            //    Deleted = item.Deleted
            //};
            return Ok(_mapper.Map<List<EventTypeXEventGenreDto>>(item));
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete(ApiRoutes.EventTypeXEventGenreRoutes.Delete)]
        public async Task<IActionResult> Delete(long typeXGenreId)
        {

            var currentUser = await _identityService.GetCurrentUser();

            if (currentUser == null)
            {
                return BadRequest(new { error = "You are not allowed!" });
            }

            var typeXGenre = await _eventTypeXEventGenreService.GetEventTypeXEventGenreById(typeXGenreId);

            if (typeXGenre == null)
            {
                return BadRequest(new { error = "Selected typeXGenre was not found" });
            }

            var existsTypeXGenreOnEvent = await _eventParentService.ExistsEventTypeXEventGenreOnEvent(typeXGenre.EventTypeId, typeXGenre.EventGenreId);

            if (existsTypeXGenreOnEvent)
            {
                return BadRequest(new { error = "You first must delete events associated with these event type and genre" });
            }

            await _eventTypeXEventGenreService.DeleteEventTypeXEventGenre(typeXGenre);

            return NoContent();
        }

        [Authorize(Roles = "Admin")]
        [HttpPut(ApiRoutes.EventTypeXEventGenreRoutes.Update)]
        public async Task<IActionResult> UpdateAsync([FromBody] EventTypeXEventGenreDto model)
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

            var typeXGenre = await _eventTypeXEventGenreService.GetEventTypeXEventGenreById(model.Id);

            if (typeXGenre == null)
            {
                return BadRequest(new { error = "Selected typeXGenre was not found" });
            }

            typeXGenre.EventGenreId = model.EventGenreId;
            typeXGenre.EventTypeId = model.EventTypeId;
            typeXGenre.Deleted = model.Deleted;

            await _eventTypeXEventGenreService.UpdateEventTypeXEventGenre(typeXGenre);

            return Ok();

        }

        [Authorize(Roles = "Admin")]
        [HttpPost(ApiRoutes.EventTypeXEventGenreRoutes.Create)]
        public async Task<IActionResult> Create([FromBody] EventTypeXEventGenreDto model)
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

            var eventTypeXEventGenre = new EventTypeXEventGenre()
            {
                EventTypeId = model.EventTypeId,
                EventGenreId = model.EventGenreId
            };

            await _eventTypeXEventGenreService.CreateEventTypeXEventGenre(eventTypeXEventGenre);

            return Ok();
        }
    }
}
