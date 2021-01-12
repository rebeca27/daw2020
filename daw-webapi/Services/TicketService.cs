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
    public class TicketService : ITicketService
    {
        readonly DataContext _dataContext;
        public TicketService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public async Task CreateTicket(Ticket ticket)
        {
            ticket.Deleted = false;
            await _dataContext.AddAsync(ticket);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteTicket(Ticket ticket)
        {
            ticket.Deleted = true;
            _dataContext.Update(ticket);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<IList<Ticket>> GetTickets()
        {
            return await _dataContext.Tickets.Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<Ticket> GetTicketById(long id)
        {
            return await _dataContext.Tickets.SingleOrDefaultAsync(x => x.Id == id && !x.Deleted);
        }

        public async Task<IList<Ticket>> GetTicketsByEventId(long id)
        {
            return await _dataContext.Tickets.Where(x => x.EventParentId == id && !x.Deleted).ToListAsync();
        }

        public async Task<bool> AnyTicketsOnTypeId(long typeId)
        {
            return await _dataContext.Tickets.Where(x => x.TicketTypeId == typeId && !x.Deleted).AnyAsync();
        }

        public async Task UpdateTicket(Ticket ticket)
        {
            _dataContext.Update(ticket);
            await _dataContext.SaveChangesAsync();
        }


        public async Task<bool> ExistingTicketType(long ticketTypeId, long eventParentId, long? ticketId = null)
        {
            return await _dataContext.Tickets.Include(x => x.EventParent).Include(x => x.TicketType)
            .Where(x => x.TicketTypeId == ticketTypeId
            && eventParentId == x.EventParentId
            && x.EventParent.DateAndHour >= DateTime.Now
            && (ticketId.HasValue ? ticketId != x.Id : true)
            && !x.Deleted
            && !x.EventParent.Deleted
            && !x.TicketType.Deleted).AnyAsync();
        }
    }
}
