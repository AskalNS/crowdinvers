using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    [Table("OrderDocument")]
    public class OrderDocument
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("orderId")]
        public int OrderId { get; set; }

        [Column("fileName")]
        public string FileName { get; set; }

        [Column("url")]
        public string Url { get; set; }

        [Column("uploadDate")]
        public DateTime UploadDate { get; set; }
    }
}