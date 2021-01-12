using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class EventGenreDto
    {
        public long Id { get; set; }
        [Required]
        public string Name { get; set; }
        public bool Deleted { get; set; }
    }
}
