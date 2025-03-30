namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate13 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Investing", "orderId", c => c.Int(nullable: false));
            DropColumn("dbo.Investing", "businessId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Investing", "businessId", c => c.Int(nullable: false));
            DropColumn("dbo.Investing", "orderId");
        }
    }
}
