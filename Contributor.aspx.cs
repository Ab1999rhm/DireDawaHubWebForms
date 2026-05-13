using System;
using System.Data;
using System.Data.SQLite;
using System.Web.UI.WebControls;
using System.Drawing;

namespace DDCH
{
    public partial class ContributorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Contributor")
                {
                    Response.Redirect("Login.aspx");
                }

                if (!IsPostBack)
                {
                    ApplyLanguage();
                    LoadDashboard();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Contributor Page_Load Error: " + ex.Message);
            }
        }

        private void ApplyLanguage()
        {
            try
            {
                lblTitle.Text = LanguageHelper.Get("ContributorWorkspace");
                lblSubTitle.Text = LanguageHelper.Get("ContributorHub");
                
                lblStat1Title.Text = LanguageHelper.Get("ContributorTotalPosts");
                lblStat2Title.Text = LanguageHelper.Get("ContributorApproved");
                lblStat3Title.Text = LanguageHelper.Get("ContributorPending");
                lblStat4Title.Text = LanguageHelper.Get("ContributorDeactivated");
                
                lblQATitle.Text = LanguageHelper.Get("ContributorQuickActions");
                
                lblRecentTitle.Text = LanguageHelper.Get("ContributorRecentActivities");
                lblHdrTitle.Text = LanguageHelper.Get("ContributorPostTitle");
                lblHdrCategory.Text = LanguageHelper.Get("ContributorCategory");
                lblHdrStatus.Text = LanguageHelper.Get("ContributorStatus");
                
                lblNoActivity.Text = LanguageHelper.Get("ContributorNoActivity");
            }
            catch { }
        }

        private void LoadDashboard()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);

                // Load stat counts
                lblStat1Value.Text = (DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE UserId = @uid", new SQLiteParameter("@uid", userId)) ?? 0).ToString();
                lblStat2Value.Text = (DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE UserId = @uid AND Status = 'Approved'", new SQLiteParameter("@uid", userId)) ?? 0).ToString();
                lblStat3Value.Text = (DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE UserId = @uid AND Status = 'Pending'", new SQLiteParameter("@uid", userId)) ?? 0).ToString();
                lblStat4Value.Text = (DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE UserId = @uid AND Status = 'Deactivated'", new SQLiteParameter("@uid", userId)) ?? 0).ToString();

                // Load recent activities (latest 5 posts)
                DataTable dt = DatabaseHelper.ExecuteQuery(
                    "SELECT Title, Category, Status FROM Posts WHERE UserId = @uid ORDER BY CreatedAt DESC LIMIT 5",
                    new SQLiteParameter("@uid", userId));

                // Hide all rows first
                pnlActRow1.Visible = false; pnlActRow2.Visible = false; pnlActRow3.Visible = false;
                pnlActRow4.Visible = false; pnlActRow5.Visible = false;
                lblNoActivity.Visible = (dt == null || dt.Rows.Count == 0);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Label[] titleLabels   = { lblActTitle1, lblActTitle2, lblActTitle3, lblActTitle4, lblActTitle5 };
                    Label[] catLabels     = { lblActCategory1, lblActCategory2, lblActCategory3, lblActCategory4, lblActCategory5 };
                    Label[] statusLabels  = { lblActStatus1, lblActStatus2, lblActStatus3, lblActStatus4, lblActStatus5 };
                    Panel[] rows          = { pnlActRow1, pnlActRow2, pnlActRow3, pnlActRow4, pnlActRow5 };

                    for (int i = 0; i < dt.Rows.Count && i < 5; i++)
                    {
                        rows[i].Visible      = true;
                        titleLabels[i].Text  = dt.Rows[i]["Title"].ToString();
                        catLabels[i].Text    = dt.Rows[i]["Category"].ToString();
                        SetStatus(statusLabels[i], dt.Rows[i]["Status"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Contributor LoadDashboard Error: " + ex.Message);
            }
        }

        private void SetStatus(Label lbl, string status)
        {
            try
            {
                lbl.Text = status;
                switch (status)
                {
                    case "Approved":
                        lbl.ForeColor = ColorTranslator.FromHtml("#10B981");
                        lbl.BackColor = ColorTranslator.FromHtml("#064E3B");
                        break;
                    case "Pending":
                        lbl.ForeColor = ColorTranslator.FromHtml("#FCD34D");
                        lbl.BackColor = ColorTranslator.FromHtml("#451A03");
                        break;
                    default:
                        lbl.ForeColor = ColorTranslator.FromHtml("#EF4444");
                        lbl.BackColor = ColorTranslator.FromHtml("#7F1D1D");
                        break;
                }
            }
            catch { }
        }
    }
}
