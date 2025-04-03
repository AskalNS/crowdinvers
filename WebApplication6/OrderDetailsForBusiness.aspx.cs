using Confluent.Kafka;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using WebApplication6.Models;
using WebApplication6.utills;

namespace WebApplication6
{
    public partial class OrderDetailsForBusiness : System.Web.UI.Page
    {
        private int businessId;
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
                var shedule = db.RepaymentSchedule.FirstOrDefault(o => o.OrderId == orderId);
                if (order != null && shedule != null)
                {
                    var orderDetail = new OrderDetailsViewModel()
                    {
                        Target = order.Target,
                        TargetAmount = order.TargetAmount,
                        DueDate = order.DueDate,
                        DateOfOrder = order.DateOfOrder,
                        CurrentAmount = order.CurrentAmount,
                        content = shedule.Content,
                        Plan = order.Plan,
                        Description = order.Description
                    };


                    fvOrderDetails.DataSource = new List<OrderDetailsViewModel> { orderDetail };
                    fvOrderDetails.DataBind();
                    businessId = order.BusinessId;
                }
                else
                {
                    // Если заказ не найден, перенаправляем на страницу списка заказов
                    Response.Redirect("MyOrders.aspx");
                }
            }
        }
        private void getBusinessId(int orderId)
        {
            using (var db = new ApplicationDbContext())
            {
                var order = db.Orders.FirstOrDefault(o => o.Id == orderId);
                if (order != null)
                {
                    businessId = order.BusinessId;
                }
            }
        }

    }
}