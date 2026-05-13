using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace DDCH
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Force TLS 1.2 for all HTTPS calls (OpenWeatherMap API, etc.)
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            // Initialize SQLite Database
            DatabaseHelper.InitializeDatabase();
        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex != null)
            {
                string logPath = Server.MapPath("~/App_Data/errors.log");
                string message = string.Format("[{0}] URL: {1} - Error: {2}\nStack Trace: {3}\n\n",
                    DateTime.Now.ToString(), Request.Url.ToString(), ex.Message, ex.StackTrace);
                
                try { File.AppendAllText(logPath, message); } catch { }
                
                // Optional: Clear error and redirect to a custom error page
                // Server.ClearError();
                // Response.Redirect("~/Error.aspx");
            }
        }
    }
}