using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("Investment")]
    public class Investment
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("investorId")]
        public string InvestorId { get; set; }

        [Column("businessId")]
        public string BusinessId { get; set; }

        [Column("amount")]
        public string Amount { get; set; }

        [Column("createdAt")]
        public DateTimeOffset CreatedAt { get; set; }
    }
}