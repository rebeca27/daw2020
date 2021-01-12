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
    public class LocationController : Controller
    {
        readonly ILocationService _locationService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly IEventParentService _eventParentService;
        public LocationController(IIdentityService identityService, IMapper mapper, ILocationService locationService, IEventParentService eventParentService)
        {
            _identityService = identityService;
            _mapper = mapper;
            _locationService = locationService;
            _eventParentService = eventParentService;
        }

        [HttpGet(ApiRoutes.LocationRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<LocationDto>>(await _locationService.GetLocations()));
        }

        [HttpGet(ApiRoutes.LocationRoutes.Select)]
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

            return Ok(await _locationService.GetLocationSelect());
        }

        [HttpGet(ApiRoutes.LocationRoutes.Get)]
        public async Task<IActionResult> Get(long locationId)
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

            var item = await _locationService.GetLocationById(locationId);

            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new LocationDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    ShortName = item.ShortName,
            //    Deleted = item.Deleted
            //};

            return Ok(_mapper.Map<LocationDto>(item));
        }

        [HttpDelete(ApiRoutes.LocationRoutes.Delete)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(long locationId)
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

            var location = await _locationService.GetLocationById(locationId);

            if (location == null)
            {
                return BadRequest(new { error = "Selected location was not found" });
            }

            var existsLocationOnEvent = await _eventParentService.ExistsLocationOnEvent(locationId);

            if (existsLocationOnEvent)
            {
                return BadRequest(new { error = "You first must delete events associated with this location" });
            }

            await _locationService.DeleteLocation(location);

            return NoContent();
        }

        [HttpPut(ApiRoutes.LocationRoutes.Update)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateAsync([FromBody] LocationDto model)
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

            var location = await _locationService.GetLocationById(model.Id);

            if (location == null)
            {
                return BadRequest(new { error = "Selected location was not found" });
            }

            location.Name = model.Name;
            location.Deleted = model.Deleted;
            location.Address = model.Address;

            await _locationService.UpdateLocation(location);

            return Ok();

        }

        [HttpPost(ApiRoutes.LocationRoutes.Create)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([FromBody] LocationDto model)
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

            var location = new Location()
            {
                Name = model.Name,
                Address = model.Address
            };

            await _locationService.CreateLocation(location);

            return Ok();
        }
    }
}
