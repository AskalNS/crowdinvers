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

namespace WebApplication6
{
    public partial class OrderDetailsForInvestor : System.Web.UI.Page
    {
        // Переменные для хранения данных карты
        public string CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public string CVV { get; set; }
        public decimal InvestmentAmount { get; set; }

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

        // Обработчик нажатия кнопки "Подтвердить инвестицию"
        protected void btnSubmitInvestment_Click(object sender, EventArgs e)
        {
            CardNumber = cardNumber.Text;
            ExpiryDate = expiryDate.Text;
            CVV = cvv.Text;
            if (decimal.TryParse(amount.Text, out decimal amountValue))
            {
                InvestmentAmount = amountValue;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Введите корректную сумму инвестиции.');", true);
                return;
            }



            var invest = new Invest()
            {
                number = cardNumber.Text,
                date = expiryDate.Text,
                cvv = cvv.Text,
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

            Thread.Sleep(60000);

        }
    }
}