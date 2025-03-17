using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication6.Models
{
    [Table("Investor")]
    public class Investor
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("name")]
        public string Fio { get; set; }

        [Column("iin")]
        public string Iin { get; set; }

        [Column("phone_number")]
        public string PhoneNumber { get; set; }

        [Column("mail")]
        public string Mail { get; set; }

        [Column("address")]
        public string Address { get; set; }

        [Column("createdAt")]
        public DateTimeOffset CreatedAt { get; set; }

        [Column("updatedAt")]
        public DateTimeOffset UpdatedAt { get; set; }

        [Column("isChecked")]
        public int IsChecked { get; set; }
    }
}
