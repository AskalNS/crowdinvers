using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication6.Models
{
    [Table("Business")]
    public class Business
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("ownerFIO")]
        public string OwnerFIO { get; set; }

        [Column("ownerMail")]
        public string OwnerMail { get; set; }

        [Column("ownerIIN")]
        public string OwnerIIN { get; set; }

        [Column("ownerNumber")]
        public string OwnerNumber { get; set; }

        [Column("isChecked")]
        public int IsChecked { get; set; }

        [Column("companyName")]
        public string CompanyName { get; set; }

        [Column("companyBIN")]
        public string CompanyBIN { get; set; }

        [Column("address")]
        public string Address { get; set; }

        [Column("sector")]
        public string Sector { get; set; }

        [Column("aboutMe")]
        public string AboutMe { get; set; }

        [Column("dateOfBusinessStarted")]
        public DateTimeOffset DateOfBusinessStarted { get; set; }

        [Column("createdAt")]
        public DateTimeOffset CreatedAt { get; set; }

        [Column("updatedAt")]
        public DateTimeOffset UpdatedAt { get; set; }
    }
}
