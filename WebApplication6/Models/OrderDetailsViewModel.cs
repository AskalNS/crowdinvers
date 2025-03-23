using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
	public class OrderDetailsViewModel
	{
        public int TargetAmount { get; set; }
        public int CurrentAmount { get; set; }
        public string Target { get; set; }
        public string Description { get; set; }
        public string Plan { get; set; }
        public DateTimeOffset DateOfOrder { get; set; }
        public DateTimeOffset DueDate { get; set; }
        public string content { get; set; }
    }
}