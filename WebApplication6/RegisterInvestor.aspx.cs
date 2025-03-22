using System;
using System.Web.UI;
using WebApplication6.Models;
using System.Data.Entity;
using System.Security.Cryptography;
using System.Text;
using System.Linq;

namespace WebApplication6
{
    public partial class RegisterInvestor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Логика загрузки страницы
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && chkAgreemm.Checked)
            {
                using (var db = new ApplicationDbContext())
                {
                    // Проверка, существует ли уже пользователь с таким email или ИИН
                    bool userExists = db.User.Any(u => u.Login == txtMail.Text);
                    bool investorExistsIIN = db.Investors.Any(i => i.Iin == txtIin.Text);
                    bool investorExistsPohone = db.Investors.Any(i => i.PhoneNumber == txtPhone.Text);

                    if (userExists || investorExistsIIN || investorExistsPohone)
                    {
                        lblMessage.Text = "Қате: Бұл email/номер немесе ИИН тіркелген.";
                        lblMessage.CssClass = "text-danger";
                        return;
                    }

                }


                string salt = generateSalt();
                string hashedPassword = hashPassword(txtPassword.Text, salt);

                var investor = new Investor
                {
                    Fio = txtFio.Text,
                    Iin = txtIin.Text,
                    PhoneNumber = txtPhone.Text,
                    Mail = txtMail.Text,
                    Address = txtAddress.Text,
                    CreatedAt = DateTimeOffset.Now,
                    UpdatedAt = DateTimeOffset.Now,
                    IsChecked = 1010
                };

                var user = new User
                {
                    Login = txtMail.Text,
                    Password = hashedPassword,
                    Salt = salt,
                    Role = "INVESTOR"
                };
                using (var db = new ApplicationDbContext())
                {
                    db.Investors.Add(investor);
                    db.User.Add(user);
                    db.SaveChanges();
                }

                lblMessage.Text = "Сіз сәтті тіркелдіңіз!";
                lblMessage.CssClass = "text-success";

                txtFio.Text = "";
                txtIin.Text = "";
                txtPhone.Text = "";
                txtMail.Text = "";
                txtAddress.Text = "";
                Response.Redirect("RiskAwarenessTest.aspx");
            }
            else
            {
                lblMessage.Text = "Деректерді дұрыс енгізіңіз.";
                lblMessage.CssClass = "text-danger";
            }
        }



        private static string generateSalt()
        {
            byte[] saltBytes = new byte[16];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(saltBytes);
            }
            return Convert.ToBase64String(saltBytes);
        }

        private static string hashPassword(string password, string salt)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] saltedPassword = Encoding.UTF8.GetBytes(password + salt);
                byte[] hash = sha256.ComputeHash(saltedPassword);
                return Convert.ToBase64String(hash);
            }
        }
    }
}