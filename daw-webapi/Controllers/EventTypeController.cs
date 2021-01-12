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
using System.Threading.Tasks;

namespace daw_webapi.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Produces("application/json")]
    public class EventTypeController : Controller
    {
        readonly IEventTypeService _eventTypeService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly IEventTypeXEventGenreService _eventTypeXEventGenreService;
        public EventTypeController(IEventTypeService eventTypeService, IIdentityService identityService, IMapper mapper, IEventTypeXEventGenreService eventTypeXEventGenreService)
        {
            _eventTypeService = eventTypeService;
            _identityService = identityService;
            _mapper = mapper;
            _eventTypeXEventGenreService = eventTypeXEventGenreService;
        }

        [HttpGet(ApiRoutes.EventTypeRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<EventTypeDto>>(await _eventTypeService.GetEventTypes()));
        }

        [HttpGet(ApiRoutes.EventTypeRoutes.Select)]
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

            return Ok(await _eventTypeService.GetEventTypeSelect());
        }

        [HttpGet(ApiRoutes.EventTypeRoutes.Get)]
        public async Task<IActionResult> Get(long typeId)
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

            var item = await _eventTypeService.GetEventTypeById(typeId);

            if (item == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<EventTypeDto>(item));
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete(ApiRoutes.EventTypeRoutes.Delete)]
        public async Task<IActionResult> Delete(long typeId)
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

            var type = await _eventTypeService.GetEventTypeById(typeId);

            if (type == null)
            {
                return BadRequest(new { error = "Selected type was not found" });
            }

            var anyTypeLink = await _eventTypeXEventGenreService.ExistsAnyEventTypeLink(typeId);

            if (anyTypeLink)
            {
                return BadRequest(new { error = "You first must delete the link between this type and genres." });
            }

            await _eventTypeService.DeleteEventType(type);

            return NoContent();
        }

        [Authorize(Roles = "Admin")]
        [HttpPut(ApiRoutes.EventTypeRoutes.Update)]
        public async Task<IActionResult> UpdateAsync([FromBody] EventTypeDto model)
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

            var type = await _eventTypeService.GetEventTypeById(model.Id);

            if (type == null)
            {
                return BadRequest(new { error = "Selected type was not found" });
            }

            type.Name = model.Name;
            type.Deleted = model.Deleted;

            await _eventTypeService.UpdateEventType(type);

            return Ok();

        }

        [Authorize(Roles = "Admin")]
        [HttpPost(ApiRoutes.EventTypeRoutes.Create)]
        public async Task<IActionResult> Create([FromBody] EventTypeDto model)
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

            var eventType = new EventType()
            {
                Name = model.Name,
                Deleted = model.Deleted
            };

            await _eventTypeService.CreateEventType(eventType);

            return Ok();
        }
    }
}
