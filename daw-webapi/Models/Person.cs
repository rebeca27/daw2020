using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Models
{
    public class Person
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long UserId { get; set; }
        [Required]
        public bool Deleted { get; set; }

        [ForeignKey(nameof(UserId))]
        public virtual IdentityUser<long> User { get; set; }
    }
}
