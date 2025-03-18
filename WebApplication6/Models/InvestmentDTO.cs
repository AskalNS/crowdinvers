using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    public class InvestmentDTO
    {
        public int InvestorId;
        public string InvestorFio;
        public string InvestorIin;
        public int BusinessId;
        public string BusinessFio;
        public string BusinessBin;
        public string number;
        public decimal amount;
        public string date;
        public string cvv;
    }
}