namespace WebApplication6.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Business",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        ownerFIO = c.String(),
                        ownerMail = c.String(),
                        ownerIIN = c.String(),
                        ownerNumber = c.String(),
                        isChecked = c.Int(nullable: false),
                        companyName = c.String(),
                        companyBIN = c.String(),
                        address = c.String(),
                        sector = c.String(),
                        dateOfBusinessStarted = c.DateTimeOffset(nullable: false, precision: 7),
                        createdAt = c.DateTimeOffset(nullable: false, precision: 7),
                        updatedAt = c.DateTimeOffset(nullable: false, precision: 7),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Investor",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(),
                        iin = c.String(),
                        phone_number = c.String(),
                        mail = c.String(),
                        address = c.String(),
                        createdAt = c.DateTimeOffset(nullable: false, precision: 7),
                        updatedAt = c.DateTimeOffset(nullable: false, precision: 7),
                        isChecked = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Order",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        iin = c.Int(nullable: false),
                        isActive = c.Int(nullable: false),
                        targetAmount = c.Int(nullable: false),
                        target = c.String(),
                        description = c.String(),
                        plan = c.String(),
                        isChecked = c.Int(nullable: false),
                        dateOfOrder = c.DateTimeOffset(nullable: false, precision: 7),
                        dueDate = c.DateTimeOffset(nullable: false, precision: 7),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Order");
            DropTable("dbo.Investor");
            DropTable("dbo.Business");
        }
    }
}
