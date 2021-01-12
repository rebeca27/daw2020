using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Models
{
    public class EventParent
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public string Name { get; set; }
        public long EventTypeId { get; set; }
        public long EventGenreId { get; set; }
        public long PersonId { get; set; }
        public string Description { get; set; }
        public long LocationId { get; set; }
        public DateTime DateAndHour { get; set; }
        public string PhotoURL { get; set; }
        public bool Deleted { get; set; }

        [ForeignKey(nameof(EventTypeId))]
        public virtual EventType EventType { get; set; }
        [ForeignKey(nameof(EventGenreId))]
        public virtual EventGenre EventGenre { get; set; }
        [ForeignKey(nameof(PersonId))]
        public virtual Person Person { get; set; }
        [ForeignKey(nameof(LocationId))]
        public virtual Location Location { get; set; }
    }
}
