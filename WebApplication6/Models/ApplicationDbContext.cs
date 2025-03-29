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
        public DbSet<RepaymentSchedule> RepaymentSchedule { get; set; }
        public DbSet<Investment> Investment { get; set; }
        public DbSet<Transaction> Transaction { get; set; }
        public DbSet<Refill> Refill { get; set; }
        public DbSet<Investing> Investing { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}