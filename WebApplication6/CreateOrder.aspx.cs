using System;
using System.Collections.Generic;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using WebApplication6.Models;
using System.Linq;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Web.UI.WebControls;
using System.IO; // Файл жолдарымен жұмыс істеу үшін

namespace WebApplication6
{
    public partial class CreateOrder : System.Web.UI.Page
    {
        private Cloudinary _cloudinary;

        private List<UploadedDocument> _uploadedDocuments = new List<UploadedDocument>();

        public class UploadedDocument
        {
            public string FileName { get; set; }
            public string Url { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var account = new Account(
                "dug68sc7q",
                "365952145816191",
                "pUFV80AoFijHJ_hhQrgrDpStadk"
            );
            _cloudinary = new Cloudinary(account);
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


                if (business == null)
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



                int orderId = -1;
                // Сохранение в базу данных
                using (var db = new ApplicationDbContext())
                {
                    db.Orders.Add(order);
                    db.SaveChanges();
                    orderId = order.Id;
                }


                int photoIndex = int.Parse(PhotoIndex.Value);
                HyperLink[] links = { PhotoLink1, PhotoLink2, PhotoLink3, PhotoLink4 };
                for (int i = 0; i < photoIndex; i++)
                {
                    // Сохранение в базу данных
                    using (var db = new ApplicationDbContext())
                    {
                        db.OrdersImg.Add(new OrdersImg()
                        {
                            OrderId = orderId,
                            Url = links[i].NavigateUrl
                        });
                        db.SaveChanges();
                    }
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
        protected void UploadButton_Click(object sender, EventArgs e)
        {


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

        protected void btnUploadDocuments_Click(object sender, EventArgs e)
        {
            if (!FileUploadDocuments.HasFile)
            {
                lblDocumentStatus.Text = "Файл таңдаңыз!";
                lblDocumentStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                string[] allowedExtensions = { ".pdf", ".docx", ".xlsx", ".doc", ".xls" };
                int maxFileSize = 5 * 1024 * 1024; // 5MB

                foreach (HttpPostedFile file in FileUploadDocuments.PostedFiles)
                {
                    var fileExtension = Path.GetExtension(file.FileName).ToLower();

                    // Файл түрін тексеру
                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        lblDocumentStatus.Text = "Тек PDF, DOCX, XLSX құжаттарын жүктеуге болады!";
                        continue;
                    }

                    // Файл өлшемін тексеру
                    if (file.ContentLength > maxFileSize)
                    {
                        lblDocumentStatus.Text = $"{file.FileName} - файлы тым үлкен (максимум 5MB)!";
                        continue;
                    }

                    // Cloudinary-ге жүктеу (немесе серверге сақтау)
                    var uploadParams = new RawUploadParams()
                    {
                        File = new FileDescription(file.FileName, file.InputStream),
                        PublicId = $"documents/{Guid.NewGuid()}_{file.FileName}"
                    };

                    var uploadResult = _cloudinary.Upload(uploadParams);

                    // Жүктелгендер тізіміне қосу
                    _uploadedDocuments.Add(new UploadedDocument
                    {
                        FileName = file.FileName,
                        Url = uploadResult.SecureUrl.ToString()
                    });
                }

                // Тізімді жаңарту
                rptDocuments.DataSource = _uploadedDocuments;
                rptDocuments.DataBind();

                lblDocumentStatus.Text = "Құжаттар сәтті жүктелді!";
                lblDocumentStatus.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblDocumentStatus.Text = "Қате: " + ex.Message;
                lblDocumentStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}