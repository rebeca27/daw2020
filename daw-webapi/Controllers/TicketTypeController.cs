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
    public class TicketTypeController : Controller
    {
        readonly ITicketTypeService _ticketTypeService;
        readonly IIdentityService _identityService;
        readonly IMapper _mapper;
        readonly ITicketService _ticketService;
        public TicketTypeController(ITicketTypeService ticketTypeService, IIdentityService identityService, IMapper mapper, ITicketService ticketService)
        {
            _ticketTypeService = ticketTypeService;
            _identityService = identityService;
            _mapper = mapper;
            _ticketService = ticketService;
        }

        [HttpGet(ApiRoutes.TicketTypeRoutes.GetAll)]
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

            return Ok(_mapper.Map<List<TicketTypeDto>>(await _ticketTypeService.GetTicketTypes()));
        }

        [HttpGet(ApiRoutes.TicketTypeRoutes.Select)]
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

            return Ok(await _ticketTypeService.GetTicketTypeSelect());
        }

        [HttpGet(ApiRoutes.TicketTypeRoutes.Get)]
        public async Task<IActionResult> Get(long ticketTypeId)
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

            var item = await _ticketTypeService.GetTicketTypeById(ticketTypeId);

            if (item == null)
            {
                return NotFound();
            }

            //var itemDto = new TicketTypeDto
            //{
            //    Id = item.Id,
            //    Name = item.Name,
            //    ShortName = item.ShortName,
            //    Deleted = item.Deleted
            //};

            return Ok(_mapper.Map<TicketTypeDto>(item));
        }

        [HttpDelete(ApiRoutes.TicketTypeRoutes.Delete)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(long ticketTypeId)
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

            var ticketType = await _ticketTypeService.GetTicketTypeById(ticketTypeId);

            if (ticketType == null)
            {
                return BadRequest(new { error = "Selected ticketType was not found" });
            }

            var anyTickets = await _ticketService.AnyTicketsOnTypeId(ticketTypeId);

            if (anyTickets)
            {
                return BadRequest(new { error = "You first must delete tickets associated with this ticket type" });
            }

            await _ticketTypeService.DeleteTicketType(ticketType);

            return NoContent();
        }

        [HttpPut(ApiRoutes.TicketTypeRoutes.Update)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateAsync([FromBody] TicketTypeDto model)
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

            var ticketType = await _ticketTypeService.GetTicketTypeById(model.Id);

            if (ticketType == null)
            {
                return BadRequest(new { error = "Selected ticketType was not found" });
            }

            ticketType.Name = model.Name;
            ticketType.Deleted = model.Deleted;

            await _ticketTypeService.UpdateTicketType(ticketType);

            return Ok();

        }

        [HttpPost(ApiRoutes.TicketTypeRoutes.Create)]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([FromBody] TicketTypeDto model)
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

            var ticketType = new TicketType()
            {
                Name = model.Name,
            };

            await _ticketTypeService.CreateTicketType(ticketType);

            return Ok();
        }
    }
}
