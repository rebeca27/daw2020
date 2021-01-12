using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IEventTypeXEventGenreService
    {
        Task<EventTypeXEventGenre> GetEventTypeXEventGenreById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetEventGenreSelectByEventType(long eventTypeId);
        Task<IList<EventTypeXEventGenre>> GetEventTypeXEventGenres();
        Task CreateEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre);
        Task UpdateEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre);
        Task DeleteEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre);
        Task<bool> ExistsEventTypeXEventGenre(long eventTypeId, long eventGenreId);
        Task<bool> ExistsAnyEventGenreLink(long eventGenreId);
        Task<bool> ExistsAnyEventTypeLink(long eventTypeId);
    }
}
