using System.ComponentModel.DataAnnotations.Schema;

namespace daw_webapi.Models
{
    public class Location
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public bool Deleted { get; set; }
    }
}