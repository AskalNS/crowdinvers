using System.Data.Entity;

namespace WebApplication6.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("DefaultConnection")
        {
        }
        public DbSet<Investor> Investors { get; set; }
        public DbSet<Business> Businesses { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<User> User { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}