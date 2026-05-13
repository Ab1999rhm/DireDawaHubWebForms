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
            if (!IsPostBack)
            {
                string lang = LanguageHelper.GetCurrentLanguage();
                ddlLanguage.SelectedValue = lang;
            }
            ApplyLanguage();
            SetActiveLink();
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LanguageHelper.SetLanguage(ddlLanguage.SelectedValue);
            Response.Redirect(Request.RawUrl);
        }

        private void ApplyLanguage()
        {
            lblLogo.Text = LanguageHelper.Get("Logo");
            lblContributorSection.Text = LanguageHelper.Get("WorkspaceSection");
            lblWorkspaceSection.Text = "DATA ENTRY"; // Or localized if needed
            
            lnkDashboard.Text = " " + LanguageHelper.Get("AdminDashboard"); // Reusing dashboard key
            lnkPosters.Text = " " + LanguageHelper.Get("AdminPosters");
            lnkWater.Text = " " + LanguageHelper.Get("AdminWater");
            lnkHealth.Text = " " + LanguageHelper.Get("AdminHealth");
            lnkJobs.Text = " " + LanguageHelper.Get("AdminJobs");
            lnkAgri.Text = " " + LanguageHelper.Get("AdminAgri");
            lnkSafety.Text = " " + LanguageHelper.Get("AdminSafety");
            lnkStats.Text = " " + LanguageHelper.Get("AdminStats");
            lnkPublic.Text = " " + LanguageHelper.Get("AdminPublic");
            
            btnLogout.Text = LanguageHelper.Get("AdminLogout");
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
