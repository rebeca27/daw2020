using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface IPersonXTicketService
    {
        Task<PersonXTicket> GetPersonXTicketById(long id);
        Task<IList<Ticket>> GetTicketsByPerson(long personId);
        Task<IList<PersonXTicket>> GetPersonXTickets();
        Task CreatePersonXTicket(PersonXTicket personXTicket, Ticket ticket);
        Task UpdatePersonXTicket(PersonXTicket personXTicket, Ticket ticket);
        Task DeletePersonXTicket(PersonXTicket personXTicket, Ticket ticket);
        Task<PersonXTicket> ExistingPersonXTicket(long personId, long ticketId);
        Task<IList<PersonXTicket>> GetLinkByPersonId(long personId);
        Task<bool> ExistsAnyBoughtTickets(List<long> ticketIds);
        Task<IList<PersonXTicket>> GetPersonXTicketsByPerson(long personId);
    }
}
