using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;

namespace DDCH
{
    public partial class AdminVerificationModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
                {
                    Response.End();
                    return;
                }

                if (!IsPostBack)
                {
                    string targetId = Request.QueryString["id"];
                    string targetType = Request.QueryString["type"];

                    if (string.IsNullOrEmpty(targetId) || string.IsNullOrEmpty(targetType))
                    {
                        Response.End();
                        return;
                    }

                    if (targetType == "User")
                    {
                        LoadUserDetails(targetId);
                    }
                    else if (targetType == "Post")
                    {
                        LoadPostDetails(targetId);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("AdminVerificationModal Page_Load Error: " + ex.Message);
            }
        }

        private void LoadUserDetails(string userId)
        {
            try
            {
                var dt = DatabaseHelper.ExecuteQuery("SELECT Email, WorkId, DocType FROM Users WHERE UserId = @id", new SQLiteParameter("@id", userId));
                if (dt != null && dt.Rows.Count > 0)
                {
                    lblModalTitle.Text = "Review User Details";
                    lblModalDetail1Title.Text = "Email Address";
                    lblModalDetail1Value.Text = dt.Rows[0]["Email"].ToString();
                    lblModalDetail2Title.Text = "Work ID";
                    lblModalDetail2Value.Text = dt.Rows[0]["WorkId"].ToString();
                    lblModalDetail3Title.Text = "Document Type";
                    lblModalDetail3Value.Text = dt.Rows[0]["DocType"].ToString();
                }
            }
            catch (Exception ex)
            {
                lblModalTitle.Text = "Error loading user details.";
                System.Diagnostics.Trace.WriteLine("LoadUserDetails Error: " + ex.Message);
            }
        }

        private void LoadPostDetails(string postId)
        {
            try
            {
                var dt = DatabaseHelper.ExecuteQuery("SELECT p.Title, p.Category, p.Content, u.Email FROM Posts p JOIN Users u ON p.UserId = u.UserId WHERE p.PostId = @id", new SQLiteParameter("@id", postId));
                if (dt != null && dt.Rows.Count > 0)
                {
                    lblModalTitle.Text = "Review Content Details";
                    lblModalDetail1Title.Text = "Title & Category";
                    lblModalDetail1Value.Text = dt.Rows[0]["Title"].ToString() + " (" + dt.Rows[0]["Category"].ToString() + ")";
                    lblModalDetail2Title.Text = "Content";
                    lblModalDetail2Value.Text = dt.Rows[0]["Content"].ToString();
                    if (lblModalDetail2Value.Text.Length > 100)
                    {
                        lblModalDetail2Value.Text = lblModalDetail2Value.Text.Substring(0, 97) + "...";
                    }
                    lblModalDetail3Title.Text = "Author Email";
                    lblModalDetail3Value.Text = dt.Rows[0]["Email"].ToString();
                }
            }
            catch (Exception ex)
            {
                lblModalTitle.Text = "Error loading post details.";
                System.Diagnostics.Trace.WriteLine("LoadPostDetails Error: " + ex.Message);
            }
        }

        protected void btnModalApprove_Click(object sender, EventArgs e)
        {
            try
            {
                string targetId = Request.QueryString["id"];
                string targetType = Request.QueryString["type"];

                if (targetType == "User")
                {
                    DatabaseHelper.ExecuteNonQuery("UPDATE Users SET IsVerified = 1 WHERE UserId = @id", new SQLiteParameter("@id", targetId));
                }
                else if (targetType == "Post")
                {
                    DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Approved' WHERE PostId = @id", new SQLiteParameter("@id", targetId));
                }

                // Close modal and refresh parent
                ClientScript.RegisterStartupScript(this.GetType(), "closeAndRefresh", "closeAndRefresh();", true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Modal Approval Error: " + ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "alertError", "alert('Action failed. Please try again.');", true);
            }
        }
    }
}
