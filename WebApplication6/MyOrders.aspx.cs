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
	public partial class MyOrders : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }


            Business business = null;
            using (var db = new ApplicationDbContext()) // Замените на ваш контекст
            {
                business = db.Businesses.Where(x => x.OwnerMail == login).First();
            }

            int id = -1;
            if (business != null)
            {
                id = business.Id;
            }



            using (var db = new ApplicationDbContext())
            {
                var orders = db.Orders.Where(x => x.Id == id).ToList();
                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
        }

        protected void rptOrders_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Перенаправляем на страницу деталей заказа
                int orderId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"OrderDetails.aspx?id={orderId}");
            }
        }
        public string GetProgressPercentage(int currentAmount, int targetAmount)
        {
            if (targetAmount == 0) return "0";
            double percentage = (double)currentAmount / targetAmount * 100;
            return percentage.ToString("0");
        }
    }
}