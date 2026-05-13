using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DDCH
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string lang = LanguageHelper.GetCurrentLanguage();
                ddlLanguage.SelectedValue = lang;
                LoadSidebarStats();
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
            lblAdminSection.Text = LanguageHelper.Get("AdminSection");
            lblWorkspaceSection.Text = LanguageHelper.Get("WorkspaceSection");
            
            lnkAnalytics.Text = LanguageHelper.Get("AdminAnalytics");
            lnkUsers.Text = LanguageHelper.Get("AdminUsers");
            lnkCatalog.Text = LanguageHelper.Get("AdminCatalog");
            lnkAudit.Text = LanguageHelper.Get("AdminAudit");
            
            lnkDashboard.Text = LanguageHelper.Get("AdminDashboard");
            lnkPosters.Text = LanguageHelper.Get("AdminPosters");
            lnkWater.Text = LanguageHelper.Get("AdminWater");
            lnkHealth.Text = LanguageHelper.Get("AdminHealth");
            lnkJobs.Text = LanguageHelper.Get("AdminJobs");
            lnkAgri.Text = LanguageHelper.Get("AdminAgri");
            lnkSafety.Text = LanguageHelper.Get("AdminSafety");
            lnkStats.Text = LanguageHelper.Get("AdminStats");
            lnkPublic.Text = LanguageHelper.Get("AdminPublic");
            
            btnLogout.Text = LanguageHelper.Get("AdminLogout");
        }

        private void SetActiveLink()
        {
            string path = Request.Url.AbsolutePath.ToLower();
            HyperLink[] links = { lnkAnalytics, lnkUsers, lnkCatalog, lnkAudit, lnkDashboard, lnkPosters, lnkWater, lnkHealth, lnkJobs, lnkAgri, lnkSafety, lnkStats, lnkPublic };
            
            foreach (var link in links) {
                if (link != null) {
                    link.BackColor = System.Drawing.Color.Transparent;
                    link.ForeColor = System.Drawing.ColorTranslator.FromHtml("#94A3B8");
                    link.Font.Bold = false;
                }
            }

            if (path.Contains("admin.aspx")) { lnkAnalytics.BackColor = System.Drawing.ColorTranslator.FromHtml("#2563EB"); lnkAnalytics.ForeColor = System.Drawing.Color.White; lnkAnalytics.Font.Bold = true; }
            else if (path.Contains("manageusers.aspx")) { lnkUsers.BackColor = System.Drawing.ColorTranslator.FromHtml("#2563EB"); lnkUsers.ForeColor = System.Drawing.Color.White; lnkUsers.Font.Bold = true; }
            else if (path.Contains("systemcatalog.aspx")) { lnkCatalog.BackColor = System.Drawing.ColorTranslator.FromHtml("#2563EB"); lnkCatalog.ForeColor = System.Drawing.Color.White; lnkCatalog.Font.Bold = true; }
            else if (path.Contains("auditlogs.aspx")) { lnkAudit.BackColor = System.Drawing.ColorTranslator.FromHtml("#2563EB"); lnkAudit.ForeColor = System.Drawing.Color.White; lnkAudit.Font.Bold = true; }
        }

        private void LoadSidebarStats()
        {
            try {
                UpdateBadge(badgePosters, "Community Posters");
                UpdateBadge(badgeWater, "Water Tracker");
                UpdateBadge(badgeHealth, "Health Directory");
                UpdateBadge(badgeJobs, "Job Board");
                UpdateBadge(badgeAgri, "Agriculture");
                UpdateBadge(badgeSafety, "Public Safety");
                UpdateBadge(badgeStats, "Statistics");
            } catch { }
        }

        private void UpdateBadge(Label badge, string category)
        {
            int count = Convert.ToInt32(DatabaseHelper.ExecuteScalar($"SELECT COUNT(*) FROM Posts WHERE Category = '{category}' AND Status = 'Pending'"));
            if (count > 0) {
                badge.Text = count.ToString() + " New";
                badge.Visible = true;
            } else {
                badge.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}
