﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("Investing")]
    public class Investing
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("investorId")]
        public int InvestorId { get; set; }

        [Column("businessId")]
        public int BusinessId { get; set; }

        [Column("amount")]
        public decimal Amount { get; set; }

        [Column("createdAt")]
        public DateTimeOffset CreatedAt { get; set; }
    }
}