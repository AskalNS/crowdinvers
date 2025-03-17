using System;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using WebApplication6.Models;
using static Mono.Security.X509.X520;

namespace WebApplication6
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Логика при загрузке страницы
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtPassword.Text;
            User user = null;

            using (var db = new ApplicationDbContext())
            {
                // Проверка, существует ли уже пользователь с таким email или ИИН
                user = db.User.Where(u => u.Login == login).First();

                if (user == null)
                {
                    lblMessage.Text = "Логин немесе пароль қате";
                    lblMessage.CssClass = "text-danger";
                    return;
                }
            }

            if(!VerifyPassword(password, user.Password, user.Salt))
            {
                lblMessage.Text = "Логин немесе пароль қате";
                lblMessage.CssClass = "text-danger";
                return;
            }

            switch (user.Role)
            {
                case "INVESTOR":
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.Login, DateTime.Now, DateTime.Now.AddMinutes(30), false, "INVESTOR");
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    System.Web.HttpCookie authCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    Response.Cookies.Add(authCookie);
                    Response.Redirect("Orders.aspx");
                    break;
                }
                case "BUSINESS":
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.Login, DateTime.Now, DateTime.Now.AddMinutes(30), false, "BUSINESS");
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    System.Web.HttpCookie authCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    Response.Cookies.Add(authCookie);
                    Response.Redirect("BusinessDefault.aspx");
                    break;
                }
                case "ADMIN" :
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.Login, DateTime.Now, DateTime.Now.AddMinutes(30), false, "ADMIN");
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    System.Web.HttpCookie authCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    Response.Cookies.Add(authCookie);
                    Response.Redirect("Default.aspx"); // Перенаправление на главную
                    break;

                }
                default:
                    lblMessage.Text = "Логин немесе пароль қате";
                    lblMessage.CssClass = "text-danger";
                    return;
            }


        }

        public static string HashPassword(string password, string salt)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] saltedPassword = Encoding.UTF8.GetBytes(password + salt);
                byte[] hash = sha256.ComputeHash(saltedPassword);
                return Convert.ToBase64String(hash);
            }
        }

        public static bool VerifyPassword(string enteredPassword, string storedHash, string storedSalt)
        {
            string enteredHash = HashPassword(enteredPassword, storedSalt);
            return enteredHash == storedHash;
        }
    }
}