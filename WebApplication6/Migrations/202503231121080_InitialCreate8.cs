namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate8 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.RepaymentSchedule", "content", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.RepaymentSchedule", "content", c => c.Int(nullable: false));
        }
    }
}
