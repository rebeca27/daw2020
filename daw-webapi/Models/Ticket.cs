using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Models
{
    public class Ticket
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public long EventParentId { get; set; }
        public long TicketTypeId { get; set; }
        public double Price { get; set; }
        public int Remaining { get; set; }
        public bool Deleted { get; set; }

        [ForeignKey(nameof(EventParentId))]
        public virtual EventParent EventParent { get; set; }
        [ForeignKey(nameof(TicketTypeId))]
        public virtual TicketType TicketType { get; set; }
    }
}
