using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IEventParentService
    {
        Task<EventParent> GetEventParentById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetEventParentSelect();
        Task<IList<EventParent>> GetEventParents();
        Task CreateEventParent(EventParent eventParent);
        Task UpdateEventParent(EventParent eventParent);
        Task DeleteEventParent(EventParent eventParent, IList<Ticket> tickets);
        Task<bool> ExistsEventTypeXEventGenreOnEvent(long eventTypeId, long eventGenreId);
        Task<bool> ExistsLocationOnEvent(long locationId);
        Task<IList<EventParent>> GetEventsByPersonId(long personId);
    }
}
