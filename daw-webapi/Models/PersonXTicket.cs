using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Models
{
    public class PersonXTicket
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public long TicketId { get; set; }
        public long PersonId { get; set; }
        public int NrOfBought { get; set; }
        public int NrOfReturned { get; set; }
        public bool Deleted { get; set; }

        [ForeignKey(nameof(PersonId))]
        public virtual Person Person { get; set; }
        [ForeignKey(nameof(TicketId))]
        public virtual Ticket Ticket { get; set; }
    }
}
