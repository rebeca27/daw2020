using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface ITicketTypeService
    {
        Task<TicketType> GetTicketTypeById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetTicketTypeSelect();
        Task<IReadOnlyList<SelectItemResponse>> GetTicketTypesByEventParent(long eventParentId);
        Task<IList<TicketType>> GetTicketTypes();
        Task CreateTicketType(TicketType ticketType);
        Task UpdateTicketType(TicketType ticketType);
        Task DeleteTicketType(TicketType ticketType);
    }
}
