using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class EventParentDto
    {
        public long Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public long EventTypeId { get; set; }
        public string EventTypeName { get; set; }
        [Required]
        public long EventGenreId { get; set; }
        public string EventGenreName { get; set; }
        [Required]
        public long PersonId { get; set; }
        public string PersonName { get; set; }
        [Required]
        public long LocationId { get; set; }
        public string LocationName { get; set; }
        [Required]
        public DateTime DateAndHour { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string PhotoURL { get; set; }
        public bool Deleted { get; set; }
    }
}
