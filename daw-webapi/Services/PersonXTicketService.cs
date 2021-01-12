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
    public class PersonXTicketService : IPersonXTicketService
    {
        readonly DataContext _dataContext;
        public PersonXTicketService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreatePersonXTicket(PersonXTicket personXTicket, Ticket ticket)
        {
            using var transaction = await _dataContext.Database.BeginTransactionAsync();
            try
            {
                personXTicket.Deleted = false;
                await _dataContext.AddAsync(personXTicket);

                _dataContext.Update(ticket);

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

        public async Task DeletePersonXTicket(PersonXTicket personXTicket, Ticket ticket)
        {
            using var transaction = await _dataContext.Database.BeginTransactionAsync();
            try
            {
                personXTicket.Deleted = true;
                _dataContext.Update(personXTicket);

                _dataContext.Update(ticket);

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

        public async Task<PersonXTicket> GetPersonXTicketById(long id)
        {
            return await _dataContext.PersonXTickets
                .Include(x => x.Ticket).ThenInclude(x => x.TicketType)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent.Location)
                .Include(x => x.Person)
                .SingleOrDefaultAsync(x => x.Id == id && !x.Deleted && !x.Ticket.Deleted && !x.Ticket.TicketType.Deleted && !x.Ticket.EventParent.Deleted && !x.Ticket.EventParent.Location.Deleted);
        }

        public async Task<IList<PersonXTicket>> GetPersonXTickets()
        {
            return await _dataContext.PersonXTickets
                .Include(x => x.Ticket).ThenInclude(x => x.TicketType)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent.Location)
                .Include(x => x.Person)
                .Where(x => !x.Deleted && !x.Ticket.Deleted && !x.Ticket.TicketType.Deleted && !x.Ticket.EventParent.Deleted && !x.Ticket.EventParent.Location.Deleted)
                .ToListAsync();
        }

        public async Task<IList<Ticket>> GetTicketsByPerson(long personId)
        {
            return await _dataContext.PersonXTickets
                .Include(x => x.Ticket).ThenInclude(x => x.TicketType)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent.Location)
                .Include(x => x.Person)
                .Where(x => !x.Deleted && !x.Ticket.Deleted && !x.Ticket.TicketType.Deleted && !x.Ticket.EventParent.Deleted && !x.Ticket.EventParent.Location.Deleted && x.PersonId == personId)
                .Select(x => x.Ticket)
                .ToListAsync();
        }

        public async Task<IList<PersonXTicket>> GetPersonXTicketsByPerson(long personId)
        {
            return await _dataContext.PersonXTickets
                .Include(x => x.Ticket).ThenInclude(x => x.TicketType)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent)
                .Include(x => x.Ticket).ThenInclude(x => x.EventParent.Location)
                .Include(x => x.Person)
                .Where(x => !x.Deleted && !x.Ticket.Deleted && !x.Ticket.TicketType.Deleted && !x.Ticket.EventParent.Deleted && !x.Ticket.EventParent.Location.Deleted && x.PersonId == personId)
                .ToListAsync();
        }

        public async Task UpdatePersonXTicket(PersonXTicket personXTicket, Ticket ticket)
        {
            using var transaction = await _dataContext.Database.BeginTransactionAsync();
            try
            {
                _dataContext.Update(personXTicket);

                _dataContext.Update(ticket);

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

        public async Task<PersonXTicket> ExistingPersonXTicket(long personId, long ticketId)
        {
            return await _dataContext.PersonXTickets.SingleOrDefaultAsync(x => x.PersonId == personId && x.TicketId == ticketId && !x.Deleted);
        }

        public async Task<IList<PersonXTicket>> GetLinkByPersonId(long personId)
        {
            return await _dataContext.PersonXTickets.Where(x => !x.Deleted && x.PersonId == personId).ToListAsync();
        }

        public async Task<bool> ExistsAnyBoughtTickets(List<long> ticketIds)
        {
            return await _dataContext.PersonXTickets.Where(x => !x.Deleted && ticketIds.Contains(x.TicketId)).AnyAsync();
        }
    }
}
