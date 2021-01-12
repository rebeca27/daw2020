using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IEventGenreService
    {
        Task<EventGenre> GetEventGenreById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetEventGenreSelect();
        Task<IList<EventGenre>> GetEventGenres();
        Task CreateEventGenre(EventGenre eventGenre);
        Task UpdateEventGenre(EventGenre eventGenre);
        Task DeleteEventGenre(EventGenre eventGenre);
    }
}
