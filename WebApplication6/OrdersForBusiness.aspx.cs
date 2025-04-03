using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WebApplication6.Models;

namespace WebApplication6
{
    public partial class Orders : System.Web.UI.Page
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
            using (var db = new ApplicationDbContext())
            {
                var orders = db.Orders.ToList(); 
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
                Response.Redirect($"OrderDetailsForBusiness.aspx?id={orderId}");
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