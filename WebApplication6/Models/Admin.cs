using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("Admin")]
    public class Admin
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

    }
}