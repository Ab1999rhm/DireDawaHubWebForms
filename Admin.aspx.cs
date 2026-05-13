using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SQLite;

namespace DDCH
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }

                pnlModalOverlay.Visible = false;

                if (!IsPostBack)
                {
                    ApplyLanguage();
                    LoadDashboard();
                }
            }
            catch (Exception ex)
            {
                // In a real app, log this and show a friendly message
                System.Diagnostics.Trace.WriteLine("Admin Page_Load Error: " + ex.Message);
            }
        }

        private void ApplyLanguage()
        {
            try
            {
                lblTitle.Text = LanguageHelper.Get("AdminHubCommand");
                lblSubTitle.Text = LanguageHelper.Get("AdminSystemGov");
                btnLogout.Text = LanguageHelper.Get("AdminLogout");
                
                lblStat1Title.Text = LanguageHelper.Get("AdminPendingUsers");
                lblStat2Title.Text = LanguageHelper.Get("AdminPendingPosts");
                lblStat3Title.Text = LanguageHelper.Get("AdminActivePosts");
                lblStat4Title.Text = LanguageHelper.Get("AdminStatusTitle");
                lblAdminStatus.Text = LanguageHelper.Get("AdminOnline");
                
                lblUserMgtTitle.Text = " " + LanguageHelper.Get("AdminUserQueue");
                lblUserEmailHdr.Text = LanguageHelper.Get("AdminEmailHdr");
                lblUserWorkIdHdr.Text = LanguageHelper.Get("AdminWorkIdHdr");
                
                btnApproveUser1.Text = LanguageHelper.Get("AdminApprove");
                btnRejectUser1.Text = LanguageHelper.Get("AdminReject");
                btnApproveUser2.Text = LanguageHelper.Get("AdminApprove");
                btnRejectUser2.Text = LanguageHelper.Get("AdminReject");
                
                lblPostMgtTitle.Text = " " + LanguageHelper.Get("AdminPostQueue");
                lblPostCatHdr.Text = LanguageHelper.Get("AdminCatHdr");
                lblPostTitleHdr.Text = LanguageHelper.Get("AdminTitleHdr");
                
                btnApprovePost1.Text = LanguageHelper.Get("AdminApprove");
                btnRejectPost1.Text = LanguageHelper.Get("AdminReject");
                btnApprovePost2.Text = LanguageHelper.Get("AdminApprove");
                btnRejectPost2.Text = LanguageHelper.Get("AdminReject");
            }
            catch { /* Best effort for language application */ }
        }

        private void LoadDashboard()
        {
            try
            {
                // Load Counts
                string userCountSql = "SELECT COUNT(*) FROM Users WHERE IsVerified = 0 AND Role = 'Contributor'";
                object userCount = DatabaseHelper.ExecuteScalar(userCountSql);
                lblPendingUsersCount.Text = (userCount ?? 0).ToString();

                string postCountSql = "SELECT COUNT(*) FROM Posts WHERE Status = 'Pending'";
                object postCount = DatabaseHelper.ExecuteScalar(postCountSql);
                lblPendingPostsCount.Text = (postCount ?? 0).ToString();

                string activePostSql = "SELECT COUNT(*) FROM Posts WHERE Status = 'Approved'";
                object activePostCount = DatabaseHelper.ExecuteScalar(activePostSql);
                lblActivePostsCount.Text = (activePostCount ?? 0).ToString();

                // Pending Users (Top 2)
                pnlUserRow1.Visible = false;
                pnlUserRow2.Visible = false;
                System.Data.DataTable dtUsers = DatabaseHelper.ExecuteQuery("SELECT UserId, Email, WorkId, DocType FROM Users WHERE IsVerified = 0 AND Role = 'Contributor' LIMIT 2");
                if (dtUsers != null && dtUsers.Rows.Count > 0)
                {
                    pnlUserRow1.Visible = true;
                    lblUserEmail1.Text = dtUsers.Rows[0]["Email"].ToString();
                    lblUserWorkId1.Text = dtUsers.Rows[0]["WorkId"].ToString();
                    hdnUserId1.Value = dtUsers.Rows[0]["UserId"].ToString();
                }
                if (dtUsers != null && dtUsers.Rows.Count > 1)
                {
                    pnlUserRow2.Visible = true;
                    lblUserEmail2.Text = dtUsers.Rows[1]["Email"].ToString();
                    lblUserWorkId2.Text = dtUsers.Rows[1]["WorkId"].ToString();
                    hdnUserId2.Value = dtUsers.Rows[1]["UserId"].ToString();
                }

                // Pending Posts (Top 2)
                pnlPostRow1.Visible = false;
                pnlPostRow2.Visible = false;
                System.Data.DataTable dtPosts = DatabaseHelper.ExecuteQuery("SELECT p.PostId, p.Category, p.Title, u.Email FROM Posts p JOIN Users u ON p.UserId = u.UserId WHERE p.Status = 'Pending' LIMIT 2");
                if (dtPosts != null && dtPosts.Rows.Count > 0)
                {
                    pnlPostRow1.Visible = true;
                    lblPostCat1.Text = dtPosts.Rows[0]["Category"].ToString();
                    lblPostTitle1.Text = dtPosts.Rows[0]["Title"].ToString();
                    hdnPostId1.Value = dtPosts.Rows[0]["PostId"].ToString();
                }
                if (dtPosts != null && dtPosts.Rows.Count > 1)
                {
                    pnlPostRow2.Visible = true;
                    lblPostCat2.Text = dtPosts.Rows[1]["Category"].ToString();
                    lblPostTitle2.Text = dtPosts.Rows[1]["Title"].ToString();
                    hdnPostId2.Value = dtPosts.Rows[1]["PostId"].ToString();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Admin LoadDashboard Error: " + ex.Message);
            }
        }

        private void ShowUserApprovalModal(string userId, int rowIndex)
        {
            if (!string.IsNullOrEmpty(userId))
            {
                iframeModal.Src = "AdminVerificationModal.aspx?id=" + userId + "&type=User&row=" + rowIndex;
                pnlModalOverlay.Visible = true;
            }
        }

        private void ShowPostApprovalModal(string postId, int rowIndex)
        {
            if (!string.IsNullOrEmpty(postId))
            {
                iframeModal.Src = "AdminVerificationModal.aspx?id=" + postId + "&type=Post&row=" + rowIndex;
                pnlModalOverlay.Visible = true;
            }
        }

        protected void btnApproveUser1_Click(object sender, EventArgs e)
        {
            ShowUserApprovalModal(hdnUserId1.Value, 1);
        }

        protected void btnRejectUser1_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 2 WHERE UserId = @id", new SQLiteParameter("@id", hdnUserId1.Value));
            LoadDashboard();
        }

        protected void btnApproveUser2_Click(object sender, EventArgs e)
        {
            ShowUserApprovalModal(hdnUserId2.Value, 2);
        }

        protected void btnRejectUser2_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 2 WHERE UserId = @id", new SQLiteParameter("@id", hdnUserId2.Value));
            LoadDashboard();
        }

        protected void btnApprovePost1_Click(object sender, EventArgs e)
        {
            ShowPostApprovalModal(hdnPostId1.Value, 1);
        }

        protected void btnRejectPost1_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Rejected' WHERE PostId = @id", new SQLiteParameter("@id", hdnPostId1.Value));
            LoadDashboard();
        }

        protected void btnApprovePost2_Click(object sender, EventArgs e)
        {
            ShowPostApprovalModal(hdnPostId2.Value, 2);
        }

        protected void btnRejectPost2_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Rejected' WHERE PostId = @id", new SQLiteParameter("@id", hdnPostId2.Value));
            LoadDashboard();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
