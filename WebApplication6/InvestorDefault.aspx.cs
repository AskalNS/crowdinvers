using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication6.Models;

namespace WebApplication6
{
	public partial class InvestorDefault : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }


            Investor business = null;
            using (var db = new ApplicationDbContext())
            {
                business = db.Investors.Where(x => x.Mail == login).First();
            }

            int id = -1;
            if (business != null)
            {
                id = business.Id;
            }
            List<Investing> investind = new List<Investing>();
            List<Transaction> trans = new List<Transaction>();
            using (var db = new ApplicationDbContext())
            {
                investind = db.Investing.Where(x => x.InvestorId == id).ToList();
                trans = db.Transaction.Where(x => x.InvestorId == id).ToList();
            }
            decimal investmentSumm = 0;
            decimal profit = 0;

            foreach (var i in investind)
            {
                investmentSumm += i.Amount;
            }
            foreach (var i in trans)
            {
                if(i.TrasactionType == 1010)
                {
                    profit += i.Amount;
                }
            }
            txtProfitSumm.InnerText = "" + profit;
            textInvestment.InnerText = "" + investmentSumm;
            textCount.InnerText = "" + investind.Count;
            string result = Convert.ToString(profit / investmentSumm * 100);
            txtProfit.InnerText = (result.Length > 3 ? result.Substring(0, 3) : result) + "%";

        }
	}
}