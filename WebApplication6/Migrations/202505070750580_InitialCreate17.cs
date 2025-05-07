namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate17 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.OrderDocument",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        orderId = c.Int(nullable: false),
                        fileName = c.String(),
                        url = c.String(),
                        uploadDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.OrderDocument");
        }
    }
}
