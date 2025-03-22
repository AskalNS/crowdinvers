using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using WebApplication6.Models;

namespace WebApplication6
{
    public partial class RegisterBusiness : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Логика загрузки страницы
        }

        protected void btnRegister_Click(object sender, EventArgs e)
            {
            if (Page.IsValid && chkAgreemm.Checked) // Проверка валидации
            {

                using (var db = new ApplicationDbContext())
                {
                    // Проверка на дубликаты
                    bool userExists = db.User.Any(b => b.Login == txtMail.Text);
                    bool ownerExistsIIN = db.Businesses.Any(b => b.OwnerIIN == txtOwnerIIN.Text);
                    bool ownerExistsPhone = db.Businesses.Any(b => b.OwnerNumber == txtOwnerNumber.Text);
                    bool companyExistsBIN = db.Businesses.Any(b => b.CompanyBIN == txtCompanyBIN.Text);

                    if (ownerExistsIIN || ownerExistsPhone || companyExistsBIN)
                    {
                        lblMessage.Text = "Қате: Бұл ИИН/номер немесе БИН тіркелген.";
                        lblMessage.CssClass = "text-danger";
                        return;
                    }
                }

                string salt = generateSalt();
                string hashedPassword = hashPassword(txtPassword.Text, salt);

                // Создание объекта Business
                var business = new Business
                {
                    OwnerFIO = txtOwnerFIO.Text,
                    OwnerIIN = txtOwnerIIN.Text,
                    OwnerNumber = txtOwnerNumber.Text,
                    CompanyName = txtCompanyName.Text,
                    CompanyBIN = txtCompanyBIN.Text,
                    OwnerMail = txtMail.Text,
                    Address = txtAddress.Text,
                    Sector = txtSector.Text,
                    AboutMe = txtAboutMe.Text,
                    DateOfBusinessStarted = DateTimeOffset.TryParse(txtDateOfBusinessStarted.Text, out var parsedDate)
                        ? parsedDate
                        : DateTimeOffset.MinValue, // Если парсинг не удался, используем минимальное значение
                    CreatedAt = DateTimeOffset.Now,
                    UpdatedAt = DateTimeOffset.Now,
                    IsChecked = 0 // По умолчанию 0 (не проверен)
                };
                var user = new User
                {
                    Login = txtMail.Text,
                    Password = hashedPassword,
                    Salt = salt,
                    Role = "BUSINESS"
                };
                
                // Сохранение в базу данных
                using (var db = new ApplicationDbContext()) // Замените на ваш контекст
                {
                    db.Businesses.Add(business);
                    db.User.Add(user);
                    db.SaveChanges();
                }

                // Вывод сообщения об успешной регистрации
                lblMessage.Text = "Сіз сәтті тіркелдіңіз!";
                lblMessage.CssClass = "text-success";

                // Очистка полей после регистрации
                txtOwnerFIO.Text = "";
                txtOwnerIIN.Text = "";
                txtOwnerNumber.Text = "";
                txtCompanyName.Text = "";
                txtCompanyBIN.Text = "";
                txtAddress.Text = "";
                txtSector.Text = "";
                txtDateOfBusinessStarted.Text = "";
                txtAboutMe.Text = "";
                Response.Redirect("RiskAwarenessTest.aspx");
            }
            else
            {
                // Вывод сообщения об ошибке
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