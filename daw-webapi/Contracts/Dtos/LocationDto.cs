using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Dtos
{
    public class LocationDto
    {
        public long Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        public bool Deleted { get; set; }
    }
}
