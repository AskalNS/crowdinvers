using System;
using System.Collections.Generic;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using WebApplication6.Models;
using System.Linq;

namespace WebApplication6
{
    public partial class CreateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // Проверка валидации
            {
                string login = "";
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                    login = ticket.Name; 
                }
                else
                {
                    lblMessage.Text = "Серверлік қате. Сайтты қайта жүктеп көріңіз";
                    lblMessage.CssClass = "text-danger";
                    return;
                }

                Business business = null;
                using (var db = new ApplicationDbContext()) // Замените на ваш контекст
                {
                    business = db.Businesses.Where(x => x.OwnerMail == login).First();
                }


                if(business == null)
                {
                    lblMessage.Text = "Серверлік қате. Сайтты қайта жүктеп көріңіз";
                    lblMessage.CssClass = "text-danger";
                    return;
                }


                // Создание объекта Order
                var order = new Order
                {
                    TargetAmount = int.Parse(txtTargetAmount.Text),
                    Target = txtTarget.Text,
                    Description = txtDescription.Text,
                    BusinessId = business.Id,
                    Plan = txtPlan.Text,
                    DateOfOrder = DateTimeOffset.Now,
                    DueDate = DateTimeOffset.Parse(txtDueDate.Text),
                    IsActive = 1, // По умолчанию активен
                    IsChecked = 0 // По умолчанию не проверен
                };

                // Сохранение в базу данных
                using (var db = new ApplicationDbContext()) // Замените на ваш контекст
                {
                    db.Orders.Add(order);
                    db.SaveChanges();
                }

                // Вывод сообщения об успешном создании заказа
                lblMessage.Text = "Заказ сәтті құрылды!  Бір жұмыс күнінің ішінде сізге менеджер хабарласады";
                lblMessage.CssClass = "text-success";

                // Очистка полей после создания заказа
                txtTargetAmount.Text = "";
                txtTarget.Text = "";
                txtDescription.Text = "";
                txtPlan.Text = "";
                txtDueDate.Text = "";
            }
            else
            {
                // Вывод сообщения об ошибке
                lblMessage.Text = "Деректерді дұрыс енгізіңіз.";
                lblMessage.CssClass = "text-danger";
            }
        }
    }
}