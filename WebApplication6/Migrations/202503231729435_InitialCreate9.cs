namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate9 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Transaction",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        investorId = c.Int(nullable: false),
                        orderId = c.Int(nullable: false),
                        amount = c.Double(nullable: false),
                        trasactionType = c.Int(nullable: false),
                        createdAt = c.DateTimeOffset(nullable: false, precision: 7),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Transaction");
        }
    }
}
