using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Models
{
    public class EventTypeXEventGenre
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public long EventTypeId { get; set; }
        public long EventGenreId { get; set; }
        public bool Deleted { get; set; }

        [ForeignKey(nameof(EventTypeId))]
        public virtual EventType EventType { get; set; }
        [ForeignKey(nameof(EventGenreId))]
        public virtual EventGenre EventGenre { get; set; }
    }
}
