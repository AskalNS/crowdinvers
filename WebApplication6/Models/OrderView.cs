using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
	public class OrderView
	{
        public int Id { get; set; }
        public int BusinessId { get; set; }
        public int IsActive { get; set; }
        public int TargetAmount { get; set; }
        public int CurrentAmount { get; set; }
        public string Target { get; set; }
        public string Description { get; set; }
        public string Plan { get; set; }
        public int IsChecked { get; set; }
        public DateTimeOffset DateOfOrder { get; set; }
        public DateTimeOffset DueDate { get; set; }
        public string Url1 { get; set; }
        public string Url2 { get; set; }
        public string Url3 { get; set; }
        public string Url4 { get; set; }
    }
}