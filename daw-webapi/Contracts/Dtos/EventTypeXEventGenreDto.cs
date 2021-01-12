using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class EventTypeXEventGenreDto
    {
        public long Id { get; set; }
        [Required]
        public long EventTypeId { get; set; }
        public string EventTypeName { get; set; }
        [Required]
        public long EventGenreId { get; set; }
        public string EventGenreName { get; set; }
        public bool Deleted { get; set; }
    }
}
