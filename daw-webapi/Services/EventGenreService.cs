using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using daw_webapi.Contracts.Requests;
using daw_webapi.Contracts.Responses;
using daw_webapi.Data;
using daw_webapi.Models;
using Microsoft.EntityFrameworkCore;

namespace daw_webapi.Services
{
    public class EventGenreService : IEventGenreService
    {
        readonly DataContext _dataContext;
        public EventGenreService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreateEventGenre(EventGenre eventGenre)
        {
            eventGenre.Deleted = false;
            _dataContext.Add(eventGenre);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteEventGenre(EventGenre eventGenre)
        {
            eventGenre.Deleted = true;
            _dataContext.Update(eventGenre);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<EventGenre> GetEventGenreById(long id)
        {
            return await _dataContext.EventGenres.SingleOrDefaultAsync(x => x.Id == id && !x.Deleted);
        }

        public async Task<IList<EventGenre>> GetEventGenres()
        {
            return await _dataContext.EventGenres.Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetEventGenreSelect()
        {
            return await _dataContext.EventGenres.Where(x => !x.Deleted).Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id }).ToListAsync();
        }

        public async Task UpdateEventGenre(EventGenre eventGenre)
        {
            _dataContext.Update(eventGenre);
            await _dataContext.SaveChangesAsync();
        }
    }
}
