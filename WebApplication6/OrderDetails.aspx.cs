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
    public partial class OrderDetails : System.Web.UI.Page
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

        // Обработчик нажатия кнопки "Подтвердить инвестицию"
        protected void btnSubmitInvestment_Click(object sender, EventArgs e)
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


            Business business = null;
            decimal InvestmentAmount = 0;
            if (decimal.TryParse(amount.Text, out decimal amountValue))
            {
                InvestmentAmount = amountValue;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Введите корректную сумму инвестиции.');", true);
                return;
            }


            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }


            using (var db = new ApplicationDbContext()) // Замените на ваш контекст
            {
                business = db.Businesses.Where(x => x.OwnerMail == login).FirstOrDefault();
            }

            if (business == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Системная ошибка');", true);
                Response.Redirect("OrdersForInvestor.aspx");
            }


            var invest = new RefillDTO()
            {
                BusinessId = business.Id,
                OrderId = orderID,
                CreatedAt = DateTimeOffset.Now,
                number = CardUtill.Encrypt(cardNumber.Text),
                date = CardUtill.Encrypt(expiryDate.Text),
                cvv = CardUtill.HashCVV(cvv.Text),
                amount = InvestmentAmount
            };



            var config = new ProducerConfig
            {
                BootstrapServers = "localhost:9092"
            };

            using (var producer = new ProducerBuilder<string, string>(config).Build())
            {
                string json = JsonConvert.SerializeObject(invest);
                producer.Produce("BusinessRefill", new Message<string, string> { Key = "1", Value = json });
                producer.Flush(TimeSpan.FromSeconds(5));
            }


        }

    }
}