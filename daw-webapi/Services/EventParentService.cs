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
    public class EventParentService : IEventParentService
    {
        readonly DataContext _dataContext;
        public EventParentService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreateEventParent(EventParent eventParent)
        {
            eventParent.Deleted = false;
            _dataContext.Add(eventParent);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<bool> ExistsEventTypeXEventGenreOnEvent(long eventTypeId, long eventGenreId)
        {
            return await _dataContext.EventParents
                .Where(x => x.EventTypeId == eventTypeId
                && x.EventGenreId == eventGenreId
                && !x.Deleted && x.DateAndHour >= DateTime.Now).AnyAsync();
        }

        public async Task<bool> ExistsLocationOnEvent(long locationId)
        {
            return await _dataContext.EventParents
                .Where(x => x.LocationId == locationId
                && !x.Deleted && x.DateAndHour >= DateTime.Now).AnyAsync();
        }

        public async Task DeleteEventParent(EventParent eventParent, IList<Ticket> tickets)
        {
            using var transaction = await _dataContext.Database.BeginTransactionAsync();
            try
            {
                eventParent.Deleted = true;
                _dataContext.Update(eventParent);

                foreach(var ticket in tickets)
                {
                    ticket.Deleted = true;
                }

                _dataContext.UpdateRange(tickets);

                await _dataContext.SaveChangesAsync();

                // Commit transaction if all commands succeed, transaction will auto-rollback
                // when disposed if either commands fails
                await transaction.CommitAsync();
            }
            catch (Exception e)
            {
                await transaction.RollbackAsync();

                throw new Exception(e.ToString());
            }
        }

        public async Task<EventParent> GetEventParentById(long id)
        {
            return await _dataContext.EventParents.SingleOrDefaultAsync(x => x.Id == id && !x.Deleted);
        }

        public async Task<IList<EventParent>> GetEventParents()
        {
            return await _dataContext.EventParents.Where(x => !x.Deleted && x.DateAndHour >= DateTime.Now).ToListAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetEventParentSelect()
        {
            return await _dataContext.EventParents.Where(x => !x.Deleted && x.DateAndHour >= DateTime.Now).Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id }).ToListAsync();
        }

        public async Task UpdateEventParent(EventParent eventParent)
        {
            _dataContext.Update(eventParent);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<IList<EventParent>> GetEventsByPersonId(long personId)
        {
            return await _dataContext.EventParents.Where(x => !x.Deleted && x.DateAndHour >= DateTime.Now && x.PersonId == personId).ToListAsync();
        }
    }
}
