using daw_webapi.Contracts.Requests;
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
    public class EventTypeService : IEventTypeService
    {
        readonly DataContext _dataContext;
        public EventTypeService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreateEventType(EventType eventType)
        {
            eventType.Deleted = false;
            _dataContext.Add(eventType);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteEventType(EventType eventType)
        {
            eventType.Deleted = true;
            _dataContext.Update(eventType);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<EventType> GetEventTypeById(long id)
        {
            return await _dataContext.EventTypes.SingleOrDefaultAsync(x => x.Id == id && !x.Deleted);
        }

        public async Task<IList<EventType>> GetEventTypes()
        {
            return await _dataContext.EventTypes.Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetEventTypeSelect()
        {
            return await _dataContext.EventTypes.Where(x => !x.Deleted).Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id }).ToListAsync();
        }

        public async Task UpdateEventType(EventType eventType)
        {
            _dataContext.Update(eventType);
            await _dataContext.SaveChangesAsync();
        }
    }
}
