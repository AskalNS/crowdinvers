namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate14 : DbMigration
    {
        public override void Up()
        {
            DropTable("dbo.Investment");
        }
        
        public override void Down()
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
            
        }
    }
}
