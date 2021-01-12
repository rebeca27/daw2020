using System.ComponentModel.DataAnnotations.Schema;

namespace daw_webapi.Models
{
    public class TicketType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public string Name { get; set; }
        public bool Deleted { get; set; }
    }
}