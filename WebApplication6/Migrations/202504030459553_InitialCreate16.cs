namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate16 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.OrdersImg", "url", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.OrdersImg", "url");
        }
    }
}
