using Confluent.Kafka;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication6.Models;
using WebApplication6.utills;

namespace WebApplication6
{
	public partial class OrderDetailsForAdmin : System.Web.UI.Page
	{

        private int businessId;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int orderID;
                if (int.TryParse(Request.QueryString["id"], out orderID))
                {
                    LoadOrderDetails(orderID);
                }
                else
                {
                    // Если ID не передан, перенаправляем на страницу списка заказов
                    Response.Redirect("OrdersForInvestor.aspx");
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
                    businessId = order.BusinessId;
                }
                else
                {
                    // Если заказ не найден, перенаправляем на страницу списка заказов
                    Response.Redirect("OrdersForAdmin.aspx");
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

        protected void btnDeny_Click(object sender, EventArgs e)
        { }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int orderID;
            if (int.TryParse(Request.QueryString["id"], out orderID))
            {
                getBusinessId(orderID);
            }
            else
            {
                // Если ID не передан, перенаправляем на страницу списка заказов
                Response.Redirect("OrdersForInvestor.aspx");
            }







            // Сохранение в базу данных
            using (var db = new ApplicationDbContext()) // Замените на ваш контекст
            {
                var business = db.Businesses.Find(businessId);

                var shedule = new RepaymentSchedule()
                {
                    BusinessId = business.Id,
                    Content = txtContent.Text,
                    OrderId = orderID
                };


                var order = db.Orders.Find(orderID);
                order.IsChecked = 1;

                db.RepaymentSchedule.Add(shedule);
                db.SaveChanges();
            }


        }

    }
}