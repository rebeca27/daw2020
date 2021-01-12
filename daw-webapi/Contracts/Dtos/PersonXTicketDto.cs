using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class PersonXTicketDto
    {
        public long Id { get; set; }
        [Required]
        public long TicketId { get; set; }
        public string TicketTypeName { get; set; }
        public string EventName { get; set; }
        public string LocationName { get; set; }
        public DateTime? DateAndHour { get; set; }
        public long PersonId { get; set; }
        public string PersonName { get; set; }
        public int NrOfBought { get; set; }
        public int NrOfReturned { get; set; }
        public int Returning { get; set; }
        public bool Deleted { get; set; }
    }
}
