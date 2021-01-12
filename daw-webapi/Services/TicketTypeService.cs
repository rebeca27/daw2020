using daw_webapi.Contracts.Responses;
using daw_webapi.Data;
using daw_webapi.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public class TicketTypeService : ITicketTypeService
    {
        readonly DataContext _dataContext;
        public TicketTypeService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public async Task CreateTicketType(TicketType ticketType)
        {
            ticketType.Deleted = false;
            await _dataContext.AddAsync(ticketType);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteTicketType(TicketType ticketType)
        {
            ticketType.Deleted = true;
            _dataContext.Update(ticketType);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<IList<TicketType>> GetTicketTypes()
        {
            return await _dataContext.TicketTypes.Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<TicketType> GetTicketTypeById(long id)
        {
            return await _dataContext.TicketTypes.SingleOrDefaultAsync(x => x.Id == id && !x.Deleted);
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetTicketTypesByEventParent(long eventParentId)
        {
            var typeIds = await GetTypeIdsByEventParent(eventParentId);

            return await _dataContext.TicketTypes
                .Where(x => !typeIds.Contains(x.Id) && !x.Deleted)
                .Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id })
                .ToListAsync();
        }

        private async Task<IList<long>> GetTypeIdsByEventParent(long eventParentId)
        {
            return await _dataContext.Tickets
                .Where(x => x.EventParentId == eventParentId && !x.Deleted)
                .Select(x => x.TicketTypeId)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetTicketTypeSelect()
        {
            return await _dataContext.TicketTypes
                .Where(x => !x.Deleted)
                .Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id })
                .ToListAsync();
        }

        public async Task UpdateTicketType(TicketType ticketType)
        {
            _dataContext.Update(ticketType);
            await _dataContext.SaveChangesAsync();
        }
    }
}
