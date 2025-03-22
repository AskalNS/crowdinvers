using System;
using System.Web.UI;

namespace WebApplication6
{
    public partial class RiskAwarenessTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Скрываем блок с результатом при первой загрузке
                result.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int score = 0;

            // Проверка ответов
            if (q1.SelectedValue == "1") score++;
            if (q2.SelectedValue == "0") score++;
            if (q3.SelectedValue == "1") score++;
            if (q4.SelectedValue == "1") score++;
            if (q5.SelectedValue == "1") score++;

            // Отображение результата
            result.Visible = true;
            if (true)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                resultText.InnerText = $"Сіз {score}/5 дұрыс жауап бердіңіз. Тәуекелдерді толық түсіну үшін қайта оқып шығыңыз.";
            }
        }
    }
}