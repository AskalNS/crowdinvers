using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("Refill")]
    public class Refill
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("businessId")]
        public int BusinessId { get; set; }

        [Column("orderId")]
        public int OrderId { get; set; }

        [Column("amount")]
        public decimal Amount { get; set; }

        [Column("createdAt")]
        public DateTimeOffset CreatedAt { get; set; }

    }
}