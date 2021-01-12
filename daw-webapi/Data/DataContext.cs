using daw_webapi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Data
{
    public class DataContext : IdentityDbContext<IdentityUser<long>, IdentityRole<long>, long>
    {
        public DataContext(DbContextOptions<DataContext> options)
            : base(options)
        {
        }

        public DbSet<RefreshToken> RefreshTokens { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<EventType> EventTypes { get; set; }
        public DbSet<EventGenre> EventGenres { get; set; }
        public DbSet<EventTypeXEventGenre> EventTypeXEventGenres { get; set; }
        public DbSet<EventParent> EventParents { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<TicketType> TicketTypes { get; set; }
        public DbSet<PersonXTicket> PersonXTickets { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Model.GetEntityTypes().ToList().ForEach(entityType => entityType.GetForeignKeys()
            .Where(fk => !fk.IsOwnership && fk.DeleteBehavior == DeleteBehavior.Cascade)
            .ToList()
            .ForEach(fk => fk.DeleteBehavior = DeleteBehavior.Restrict));

        }
    }
}
