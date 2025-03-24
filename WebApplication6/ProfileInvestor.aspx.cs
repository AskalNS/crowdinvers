using System;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using WebApplication6.Models;
using System.Collections.Generic;
using Confluent.Kafka;
using Newtonsoft.Json;
using WebApplication6.utills;
using System.Xml.Linq;

namespace WebApplication6
{
    public partial class ProfileInvestorView : System.Web.UI.Page
    {
        int businessId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInvestorData();
            }
        }

        private void LoadInvestorData()
        {
            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }
            List<Transaction> transactions = null;
            using (var db = new ApplicationDbContext())
            {
                var investor = db.Investors.FirstOrDefault(i => i.Mail == login);

                if (investor != null)
                {
                    lblFio.InnerText = investor.Fio;
                    lblMail.InnerText = investor.Mail;
                    lblIin.InnerText = investor.Iin;
                    lblPhoneNumber.InnerText = investor.PhoneNumber;
                    lblAddress.InnerText = investor.Address;
                    lblCreatedAt.InnerText = investor.CreatedAt.ToString("dd.MM.yyyy");

                    transactions = db.Transaction.Where(x => x.InvestorId == investor.Id).ToList();
                }
            }
            double balance = 0;
            foreach (var transaction in transactions)
            {
                if (transaction.TrasactionType == 1010)
                {
                    balance += transaction.Amount;
                }
                else
                {
                    balance -= transaction.Amount;
                }
            }
            litBalance.Text = "  " + balance;
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


            Investor investor = null;
            decimal InvestmentAmount = 0;
            if (decimal.TryParse(txtAmount.Text, out decimal amountValue))
            {
                InvestmentAmount = amountValue;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Введите корректную сумму инвестиции.');", true);
                return;
            }
            if (InvestmentAmount > int.Parse(litBalance.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Балансыңыздағы ақша жетпейді.');", true);
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
                investor = db.Investors.Where(x => x.Mail == login).FirstOrDefault();
            }

            if (investor == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Системная ошибка');", true);
                Response.Redirect("OrdersForInvestor.aspx");
            }

            var transaction = new TransactionDTO()
            {
                InvestorId = investor.Id,
                OrderId = -1,
                Amount = InvestmentAmount,
                TrasactionType = 1010,
                CreatedAt = DateTimeOffset.Now,
                cardNumber = CardUtill.Encrypt(cardNumber.Text)

            };



            var config = new ProducerConfig
            {
                BootstrapServers = "localhost:9092"
            };

            using (var producer = new ProducerBuilder<string, string>(config).Build())
            {
                string json = JsonConvert.SerializeObject(transaction);
                producer.Produce("InvestorTransaction", new Message<string, string> { Key = "1", Value = json });
                producer.Flush(TimeSpan.FromSeconds(5));
            }


        }

    }
}