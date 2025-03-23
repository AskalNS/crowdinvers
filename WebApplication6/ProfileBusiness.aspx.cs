using System;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using WebApplication6.Models;

namespace WebApplication6
{
    public partial class ProfileBusiness : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }

            using (var db = new ApplicationDbContext())
            {
                var business = db.Businesses.FirstOrDefault(b => b.OwnerMail == login);
                if (business != null)
                {
                    txtOwnerFIO.Text = business.OwnerFIO;
                    txtOwnerMail.Text = business.OwnerMail;
                    txtOwnerIIN.Text = business.OwnerIIN;
                    txtOwnerNumber.Text = business.OwnerNumber;
                    txtCompanyName.Text = business.CompanyName;
                    txtCompanyBIN.Text = business.CompanyBIN;
                    txtAddress.Text = business.Address;
                    txtSector.Text = business.Sector;
                    txtAboutMe.Text = business.AboutMe;
                    txtDateOfBusinessStarted.Text = business.DateOfBusinessStarted.ToString("dd.MM.yyyy");
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Включаем редактирование
            txtOwnerMail.ReadOnly = false;
            txtOwnerNumber.ReadOnly = false;
            txtCompanyName.ReadOnly = false;
            txtAddress.ReadOnly = false;
            txtSector.ReadOnly = false;
            txtAboutMe.ReadOnly = false;

            // Показываем кнопки "Сохранить" и "Отмена"
            btnSave.Visible = true;
            btnCancel.Visible = true;
            btnEdit.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string login = "";
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                login = ticket.Name;
            }

            using (var db = new ApplicationDbContext())
            {
                var business = db.Businesses.FirstOrDefault(b => b.OwnerMail == login);
                if (business != null)
                {
                    business.OwnerMail = txtOwnerMail.Text;
                    business.OwnerNumber = txtOwnerNumber.Text;
                    business.CompanyName = txtCompanyName.Text;
                    business.Address = txtAddress.Text;
                    business.Sector = txtSector.Text;
                    business.AboutMe = txtAboutMe.Text;
                    business.UpdatedAt = DateTimeOffset.Now;

                    db.SaveChanges();
                }
            }

            // Отключаем редактирование
            txtOwnerMail.ReadOnly = true;
            txtOwnerNumber.ReadOnly = true;
            txtCompanyName.ReadOnly = true;
            txtAddress.ReadOnly = true;
            txtSector.ReadOnly = true;
            txtAboutMe.ReadOnly = true;

            // Скрываем кнопки "Сохранить" и "Отмена"
            btnSave.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Отменяем редактирование и загружаем исходные данные
            LoadProfileData();

            // Отключаем редактирование
            txtOwnerMail.ReadOnly = true;
            txtOwnerNumber.ReadOnly = true;
            txtCompanyName.ReadOnly = true;
            txtAddress.ReadOnly = true;
            txtSector.ReadOnly = true;
            txtAboutMe.ReadOnly = true;

            // Скрываем кнопки "Сохранить" и "Отмена"
            btnSave.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = true;
        }
    }
}