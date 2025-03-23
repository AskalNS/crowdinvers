using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("RepaymentSchedule")]
    public class RepaymentSchedule
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("businessId")]
        public int BusinessId { get; set; }

        [Column("orderId")]
        public int OrderId { get; set; }

        [Column("content")]
        public string Content { get; set; }

    }
}