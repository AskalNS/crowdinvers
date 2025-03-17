using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WebApplication6.Models;

namespace WebApplication6
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderId;
                if (int.TryParse(Request.QueryString["id"], out orderId))
                {
                    LoadOrderDetails(orderId);
                }
                else
                {
                    // Если ID не передан, перенаправляем на страницу списка заказов
                    Response.Redirect("Orders.aspx");
                }
            }
        }

        private void LoadOrderDetails(int orderId)
        {
            using (var db = new ApplicationDbContext())
            {
                var order = db.Orders.FirstOrDefault(o => o.Id == orderId);
                if (order != null)
                {
                    fvOrderDetails.DataSource = new List<Order> { order };
                    fvOrderDetails.DataBind();
                }
                else
                {
                    // Если заказ не найден, перенаправляем на страницу списка заказов
                    Response.Redirect("Orders.aspx");
                }
            }
        }
    }
}