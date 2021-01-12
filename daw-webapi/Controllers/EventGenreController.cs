using AutoMapper;
using daw_webapi.Contracts;
using daw_webapi.Contracts.Dtos;
using daw_webapi.Models;
using daw_webapi.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace daw_webapi.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Produces("application/json")]
    public class EventGenreController : Controller
    {
        readonly IEventGenreService _eventGenreService;
        readonly IEventTypeXEventGenreService _eventTypeXEventGenreService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        public EventGenreController(IEventGenreService eventGenreService, IIdentityService identityService, IMapper mapper, IEventTypeXEventGenreService eventTypeXEventGenreService)
        {
            _eventGenreService = eventGenreService;
            _identityService = identityService;
            _mapper = mapper;
            _eventTypeXEventGenreService = eventTypeXEventGenreService;
        }

        [HttpGet(ApiRoutes.EventGenreRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<EventGenreDto>>(await _eventGenreService.GetEventGenres()));
        }

        [HttpGet(ApiRoutes.EventGenreRoutes.Select)]
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

            return Ok(await _eventGenreService.GetEventGenreSelect());
        }

        [HttpGet(ApiRoutes.EventGenreRoutes.Get)]
        public async Task<IActionResult> Get(long genreId)
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

            var item = await _eventGenreService.GetEventGenreById(genreId);
            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new EventGenreDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    Deleted = item.Deleted
            //};
            return Ok(_mapper.Map<EventGenreDto>(item));
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete(ApiRoutes.EventGenreRoutes.Delete)]
        public async Task<IActionResult> Delete(long genreId)
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

            var genre = await _eventGenreService.GetEventGenreById(genreId);

            if (genre == null)
            {
                return BadRequest(new { error = "Selected genre was not found" });
            }

            var anyGenreLink = await _eventTypeXEventGenreService.ExistsAnyEventGenreLink(genreId);

            if (anyGenreLink)
            {
                return BadRequest(new { error = "You first must delete the link between this genre and types." });
            }

            await _eventGenreService.DeleteEventGenre(genre);

            return NoContent();
        }

        [Authorize(Roles = "Admin")]
        [HttpPut(ApiRoutes.EventGenreRoutes.Update)]
        public async Task<IActionResult> UpdateAsync([FromBody] EventGenreDto model)
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

            var genre = await _eventGenreService.GetEventGenreById(model.Id);

            if (genre == null)
            {
                return BadRequest(new { error = "Selected genre was not found" });
            }

            genre.Name = model.Name;
            genre.Deleted = model.Deleted;

            await _eventGenreService.UpdateEventGenre(genre);

            return Ok();

        }

        [Authorize(Roles = "Admin")]
        [HttpPost(ApiRoutes.EventGenreRoutes.Create)]
        public async Task<IActionResult> Create([FromBody] EventGenreDto model)
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

            var eventGenre = new EventGenre()
            {
                Name = model.Name,
                Deleted = model.Deleted
            };

            await _eventGenreService.CreateEventGenre(eventGenre);

            return Ok();
        }
    }
}
