namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate5 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Business", "aboutMe", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Business", "aboutMe");
        }
    }
}
