namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate11 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Refill", "amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AlterColumn("dbo.Transaction", "amount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Transaction", "amount", c => c.Double(nullable: false));
            AlterColumn("dbo.Refill", "amount", c => c.Double(nullable: false));
        }
    }
}
