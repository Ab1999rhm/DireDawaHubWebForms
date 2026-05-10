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
                LoadSidebarStats();
            }
            SetActiveLink();
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
