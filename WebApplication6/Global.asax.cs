using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using WebApplication6.Models;
using Npgsql;
using System.Web.UI;

namespace WebApplication6
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Добавьте эту строку для регистрации jQuery
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.6.0.min.js", // Укажите путь к вашей версии jQuery
                DebugPath = "~/Scripts/jquery-3.6.0.js", // Укажите путь к отладочной версии jQuery
                CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js", // CDN-путь
                CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js", // CDN-путь для отладки
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });
        }
    }
}