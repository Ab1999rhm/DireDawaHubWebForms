using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DDCH
{
    public partial class ContributorMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // Response.Redirect("~/Login.aspx");
            }
            SetActiveLink();
        }

        private void SetActiveLink()
        {
            string path = Request.Url.AbsolutePath.ToLower();
            HyperLink[] links = { lnkDashboard, lnkPosters, lnkWater, lnkHealth, lnkJobs, lnkAgri, lnkSafety, lnkStats, lnkPublic };
            
            foreach (var link in links) {
                if (link != null) {
                    link.BackColor = System.Drawing.Color.Transparent;
                    link.ForeColor = System.Drawing.ColorTranslator.FromHtml("#94A3B8");
                }
            }

            if (path.Contains("contributor.aspx")) { lnkDashboard.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkDashboard.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("communityposters.aspx")) { lnkPosters.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkPosters.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("watertracker.aspx")) { lnkWater.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkWater.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("healthdirectory.aspx")) { lnkHealth.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkHealth.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("jobboard.aspx")) { lnkJobs.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkJobs.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("agriculture.aspx")) { lnkAgri.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkAgri.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("publicsafety.aspx")) { lnkSafety.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkSafety.ForeColor = System.Drawing.Color.White; }
            else if (path.Contains("statistics.aspx")) { lnkStats.BackColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lnkStats.ForeColor = System.Drawing.Color.White; }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}
