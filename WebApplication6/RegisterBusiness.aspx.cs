using System;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Web.UI;
using WebApplication6.Models;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class RegisterBusiness : System.Web.UI.Page
    {
        private Cloudinary _cloudinary;
        protected void Page_Load(object sender, EventArgs e)
        {


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


        protected void UploadButton_Click(object sender, EventArgs e)
        {
            var account = new Account(
                "dug68sc7q",
                "365952145816191",
                "pUFV80AoFijHJ_hhQrgrDpStadk"
            );
            _cloudinary = new Cloudinary(account);

            if (!FileUploadControl.HasFile)
            {
                StatusLabel.Text = "Выберите файл для загрузки!";
                return;
            }

            int photoIndex = int.Parse(PhotoIndex.Value); // Получаем текущий индекс
            if (photoIndex >= 4)
            {
                StatusLabel.Text = "Все 4 изображения уже загружены!";
                return;
            }

            try
            {
                using (var stream = FileUploadControl.PostedFile.InputStream)
                {
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(FileUploadControl.FileName, stream),
                        PublicId = Guid.NewGuid().ToString(), // Уникальное имя
                        Overwrite = true
                    };

                    var uploadResult = _cloudinary.Upload(uploadParams);
                    string imageUrl = uploadResult.SecureUrl.AbsoluteUri;

                    // Сохранение в базу данных
                    //using (var db = new ApplicationDbContext()) // Замените на ваш контекст
                    //{
                    //    db.Businesses.Add(business);
                    //    db.User.Add(user);
                    //    db.SaveChanges();
                    //}

                    // Определяем, какую ссылку сделать видимой
                    HyperLink[] links = { PhotoLink1, PhotoLink2, PhotoLink3, PhotoLink4 };
                    Control[] previews = { photoPreview1, photoPreview2, photoPreview3, photoPreview4 };
                    links[photoIndex].NavigateUrl = imageUrl;
                    links[photoIndex].Visible = true;
                    links[photoIndex].Text = "Фото " + (photoIndex + 1);
                    previews[photoIndex].Visible = true;

                    // Увеличиваем индекс
                    PhotoIndex.Value = (photoIndex + 1).ToString();

                    StatusLabel.Text = "Изображение загружено!";
                    StatusLabel.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Ошибка: " + ex.Message;
            }
        }



    }
}