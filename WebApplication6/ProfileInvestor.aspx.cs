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

            //int orderID;
            //if (int.TryParse(Request.QueryString["id"], out orderID))
            //{
            //    getBusinessId(orderID);
            //}
            //else
            //{
            //    // Если ID не передан, перенаправляем на страницу списка заказов
            //    Response.Redirect("OrdersForInvestor.aspx");
            //}


            //Business business = null;
            //Investor investor = null;
            //decimal InvestmentAmount = 0;
            //if (decimal.TryParse(amount.Text, out decimal amountValue))
            //{
            //    InvestmentAmount = amountValue;
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Введите корректную сумму инвестиции.');", true);
            //    return;
            //}
            //if (InvestmentAmount < 30000)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Минимальная сумма инвестиции 30000тг.');", true);
            //    return;
            //}


            //string login = "";
            //if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            //{
            //    HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

            //    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            //    login = ticket.Name;
            //}


            //using (var db = new ApplicationDbContext()) // Замените на ваш контекст
            //{
            //    business = db.Businesses.Where(x => x.Id == businessId).FirstOrDefault();
            //    investor = db.Investors.Where(x => x.Mail == login).FirstOrDefault();
            //}

            //if (investor == null || business == null)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "InvalidAmount", "alert('Системная ошибка');", true);
            //    Response.Redirect("OrdersForInvestor.aspx");
            //}


            //var invest = new InvestmentDTO()
            //{
            //    InvestorId = investor.Id,
            //    InvestorFio = investor.Fio,
            //    InvestorIin = investor.Iin,
            //    BusinessId = business.Id,
            //    BusinessFio = business.OwnerFIO,
            //    BusinessBin = business.CompanyBIN,
            //    number = CardUtill.Encrypt(cardNumber.Text),
            //    date = CardUtill.Encrypt(expiryDate.Text),
            //    cvv = CardUtill.HashCVV(cvv.Text),
            //    amount = InvestmentAmount
            //};



            //var config = new ProducerConfig
            //{
            //    BootstrapServers = "localhost:9092"
            //};

            //using (var producer = new ProducerBuilder<string, string>(config).Build())
            //{
            //    string json = JsonConvert.SerializeObject(invest);
            //    producer.Produce("InvestorPayment", new Message<string, string> { Key = "1", Value = json });
            //    producer.Flush(TimeSpan.FromSeconds(5));
            //}


        }

    }
}