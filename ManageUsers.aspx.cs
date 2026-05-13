using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;

namespace DDCH
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            pnlModalOverlay.Visible = false;

            if (!IsPostBack)
            {
                ApplyLanguage();
                LoadUsers();
            }
        }

        private void ApplyLanguage()
        {
            lblBreadcrumb.Text = "Home / Admin / " + LanguageHelper.Get("AdminUsers");
            lblHeaderTitle.Text = LanguageHelper.Get("AdminIdentityManager");
            lblHeaderSub.Text = LanguageHelper.Get("AdminVerifyMunicipal");
            lblTotalTitle.Text = LanguageHelper.Get("AdminTotalUsers");
            
            lblSearch.Text = LanguageHelper.Get("SearchBtn"); // Use existing key
            btnApplyFilter.Text = LanguageHelper.Get("SearchBtn");
            
            lblUserEmailHdr.Text = LanguageHelper.Get("AdminEmailHdr");
            lblUserWorkIdHdr.Text = LanguageHelper.Get("AdminWorkIdHdr");
            
            btnApproveUser1.Text = LanguageHelper.Get("AdminApprove");
            btnApproveUser2.Text = LanguageHelper.Get("AdminApprove");
            btnApproveUser3.Text = LanguageHelper.Get("AdminApprove");
        }

        private void ShowUserApprovalModal(string userId, int rowIndex)
        {
            iframeModal.Src = "AdminVerificationModal.aspx?id=" + userId + "&type=User&row=" + rowIndex;
            pnlModalOverlay.Visible = true;
        }

        private void LoadUsers()
        {
            System.Data.DataTable dt = DatabaseHelper.ExecuteQuery("SELECT UserId, Email, Role, WorkId, IsVerified FROM Users WHERE Role != 'Admin' LIMIT 3");
            
            if (dt.Rows.Count > 0)
            {
                pnlUserRow1.Visible = true;
                lblUserEmail1.Text = dt.Rows[0]["Email"].ToString();
                lblUserWorkId1.Text = dt.Rows[0]["WorkId"].ToString();
                lblUserStatus1.Text = GetStatusText(dt.Rows[0]["IsVerified"]);
                hdnUserId1.Value = dt.Rows[0]["UserId"].ToString();
            }
            if (dt.Rows.Count > 1)
            {
                pnlUserRow2.Visible = true;
                lblUserEmail2.Text = dt.Rows[1]["Email"].ToString();
                lblUserWorkId2.Text = dt.Rows[1]["WorkId"].ToString();
                lblUserStatus2.Text = GetStatusText(dt.Rows[1]["IsVerified"]);
                hdnUserId2.Value = dt.Rows[1]["UserId"].ToString();
            }
            if (dt.Rows.Count > 2)
            {
                pnlUserRow3.Visible = true;
                lblUserEmail3.Text = dt.Rows[2]["Email"].ToString();
                lblUserWorkId3.Text = dt.Rows[2]["WorkId"].ToString();
                lblUserStatus3.Text = GetStatusText(dt.Rows[2]["IsVerified"]);
                hdnUserId3.Value = dt.Rows[2]["UserId"].ToString();
            }

            lblTotalUsers.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Users").ToString();
        }

        protected void btnApproveUser1_Click(object sender, EventArgs e)
        {
            ShowUserApprovalModal(hdnUserId1.Value, 1);
        }

        protected void btnDeactivateUser1_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 2 WHERE UserId = @id", new SQLiteParameter("@id", hdnUserId1.Value));
            LoadUsers();
        }

        protected void btnApproveUser2_Click(object sender, EventArgs e)
        {
            ShowUserApprovalModal(hdnUserId2.Value, 2);
        }

        protected void btnDeactivateUser2_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 2 WHERE UserId = @id", new SQLiteParameter("@id", hdnUserId2.Value));
            LoadUsers();
        }

        protected void btnApproveUser3_Click(object sender, EventArgs e)
        {
            ShowUserApprovalModal(hdnUserId3.Value, 3);
        }

        protected void btnDeactivateUser3_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 2 WHERE UserId = @id", new SQLiteParameter("@id", hdnUserId3.Value));
            LoadUsers();
        }

        public string GetStatusText(object status)
        {
            int s = Convert.ToInt32(status);
            if (s == 0) return "Pending Approval";
            if (s == 1) return "Active Contributor";
            return "Deactivated";
        }
    }
}
