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
    public class EventTypeXEventGenreService : IEventTypeXEventGenreService
    {
        readonly DataContext _dataContext;
        public EventTypeXEventGenreService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreateEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre)
        {
            eventTypeXEventGenre.Deleted = false;
            _dataContext.Add(eventTypeXEventGenre);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre)
        {
            eventTypeXEventGenre.Deleted = true;
            _dataContext.Update(eventTypeXEventGenre);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<EventTypeXEventGenre> GetEventTypeXEventGenreById(long id)
        {
            return await _dataContext.EventTypeXEventGenres.Include(x => x.EventType).Include(x => x.EventGenre).SingleOrDefaultAsync(x => x.Id == id && !x.Deleted && !x.EventType.Deleted && !x.EventGenre.Deleted);
        }

        public async Task<IList<EventTypeXEventGenre>> GetEventTypeXEventGenres()
        {
            return await _dataContext.EventTypeXEventGenres.Include(x => x.EventType).Include(x => x.EventGenre).Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<bool> ExistsEventTypeXEventGenre(long eventTypeId, long eventGenreId)
        {
            return await _dataContext.EventTypeXEventGenres
                .Include(x => x.EventType)
                .Include(x => x.EventGenre)
                .Where(x => x.EventTypeId == eventTypeId 
                && x.EventGenreId == eventGenreId 
                && !x.Deleted && !x.EventType.Deleted 
                && !x.EventGenre.Deleted).AnyAsync();
        }

        public async Task<bool> ExistsAnyEventTypeLink(long eventTypeId)
        {
            return await _dataContext.EventTypeXEventGenres.Where(x => !x.Deleted && x.EventTypeId == eventTypeId).AnyAsync();
        }

        public async Task<bool> ExistsAnyEventGenreLink(long eventGenreId)
        {
            return await _dataContext.EventTypeXEventGenres.Where(x => !x.Deleted && x.EventGenreId == eventGenreId).AnyAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetEventGenreSelectByEventType(long eventTypeId)
        {
            return await _dataContext.EventTypeXEventGenres
                .Include(x => x.EventGenre)
                .Include(x => x.EventType)
                .Where(x => x.EventTypeId == eventTypeId && !x.Deleted && !x.EventType.Deleted && !x.EventGenre.Deleted)
                .Select(x => new SelectItemResponse { Label = x.EventGenre.Name, Value = x.EventGenre.Id })
                .ToListAsync();
        }

        public async Task UpdateEventTypeXEventGenre(EventTypeXEventGenre eventTypeXEventGenre)
        {
            _dataContext.Update(eventTypeXEventGenre);
            await _dataContext.SaveChangesAsync();
        }
    }
}
