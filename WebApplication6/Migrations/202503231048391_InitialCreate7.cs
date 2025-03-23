namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate7 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Investment",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        investorId = c.String(),
                        businessId = c.String(),
                        amount = c.String(),
                        createdAt = c.DateTimeOffset(nullable: false, precision: 7),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.RepaymentSchedule",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        businessId = c.Int(nullable: false),
                        orderId = c.Int(nullable: false),
                        content = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.RepaymentSchedule");
            DropTable("dbo.Investment");
        }
    }
}
