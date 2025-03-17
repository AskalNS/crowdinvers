namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.User", "salt", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.User", "salt");
        }
    }
}
