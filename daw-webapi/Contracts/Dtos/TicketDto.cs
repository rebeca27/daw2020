using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class TicketDto
    {
        public long Id { get; set; }
        [Required]
        public long EventParentId { get; set; }
        public string EventParentName { get; set; }
        [Required]
        public long TicketTypeId { get; set; }
        public string TicketTypeName { get; set; }
        [Required]
        public double Price { get; set; }
        public int Remaining { get; set; }
        public bool Deleted { get; set; }
    }
}
