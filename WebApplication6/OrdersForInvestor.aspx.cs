using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication6.Models;

namespace WebApplication6
{
	public partial class OrdersForInvestor : System.Web.UI.Page
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
            List<Order> orders = new List<Order>();
            List<OrderView> orderViews = new List<OrderView>();
            using (var db = new ApplicationDbContext())
            {
                orders = db.Orders.ToList();
            }
            foreach (var i in orders)
            {
                List<OrdersImg> ordersImg = new List<OrdersImg>();
                using (var db = new ApplicationDbContext())
                {
                    ordersImg = db.OrdersImg.Where(x => x.OrderId == i.Id).ToList();
                }
                if (ordersImg.Count >= 1)
                {
                    orderViews.Add(new OrderView()
                    {
                        Id = i.Id,
                        Target = i.Target,
                        Description = i.Description,
                        CurrentAmount = i.CurrentAmount,
                        TargetAmount = i.TargetAmount,
                        DueDate = i.DueDate,
                        Url1 = ordersImg[0].Url
                    });
                }
                else
                {
                    orderViews.Add(new OrderView()
                    {
                        Id = i.Id,
                        Target = i.Target,
                        Description = i.Description,
                        CurrentAmount = i.CurrentAmount,
                        TargetAmount = i.TargetAmount,
                        DueDate = i.DueDate,
                    });
                }

            }


            rptOrders.DataSource = orderViews;
            rptOrders.DataBind();
        }

        protected void rptOrders_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Перенаправляем на страницу деталей заказа
                int orderId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"OrderDetailsForInvestor.aspx?id={orderId}");
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