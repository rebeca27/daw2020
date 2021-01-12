
using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface ITicketService
    {
        Task<IList<Ticket>> GetTicketsByEventId(long id);
        Task<Ticket> GetTicketById(long id);
        Task<IList<Ticket>> GetTickets();
        Task CreateTicket(Ticket ticket);
        Task UpdateTicket(Ticket ticket);
        Task DeleteTicket(Ticket ticket);
        Task<bool> ExistingTicketType(long ticketTypeId, long eventParentId, long? ticketId = null);
        Task<bool> AnyTicketsOnTypeId(long typeId);
    }
}
