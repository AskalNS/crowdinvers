using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication6.Models;
using Confluent.Kafka;
using Microsoft.Ajax.Utilities;
using System.Web.Services.Description;
using System.Threading;
using Newtonsoft.Json;
using WebApplication6.utills;
using System.Web.Security;

namespace WebApplication6
{
    public partial class OrderDetailsForInvestor : System.Web.UI.Page
    {
        // Переменные для хранения данных карты
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
                    Response.Redirect("OrdersForInvestor.aspx");
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
            Investor investor = null;
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
            if(InvestmentAmount < 30000)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Минимальная сумма инвестиции 30000тг.');", true);
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
                business = db.Businesses.Where(x => x.Id == businessId).FirstOrDefault();
                investor = db.Investors.Where(x => x.Mail == login).FirstOrDefault();
            }

            if(investor == null || business == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Системная ошибка');", true);
                Response.Redirect("OrdersForInvestor.aspx");
            }


            var invest = new InvestmentDTO()
            {
                InvestorId = investor.Id,
                InvestorFio = investor.Fio,
                InvestorIin = investor.Iin,
                BusinessId = business.Id,
                BusinessFio = business.OwnerFIO,
                BusinessBin = business.CompanyBIN,
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
                producer.Produce("InvestorPayment", new Message<string, string> { Key = "1", Value = json });
                producer.Flush(TimeSpan.FromSeconds(5));
            }


        }
    }
}