using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IEventTypeService
    {
        Task<EventType> GetEventTypeById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetEventTypeSelect();
        Task<IList<EventType>> GetEventTypes();
        Task CreateEventType(EventType eventType);
        Task UpdateEventType(EventType eventType);
        Task DeleteEventType(EventType eventType);
    }
}
