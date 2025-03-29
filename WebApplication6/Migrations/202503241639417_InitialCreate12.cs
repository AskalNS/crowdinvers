namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate12 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Investing",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        investorId = c.Int(nullable: false),
                        businessId = c.Int(nullable: false),
                        amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        createdAt = c.DateTimeOffset(nullable: false, precision: 7),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Investing");
        }
    }
}
