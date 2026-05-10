using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SQLite;

namespace DDCH
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ApplyLanguage();
            }
        }

        private void ApplyLanguage()
        {
            lblRegHeader.Text = LanguageHelper.Get("RegHeader");
            lblRegSub.Text = LanguageHelper.Get("RegSub");
            lblReqTitle.Text = LanguageHelper.Get("DocReqs");
            lblReq1.Text = LanguageHelper.Get("Req1");
            lblReq2.Text = LanguageHelper.Get("Req2");
            lblRegEmail.Text = LanguageHelper.Get("Email");
            lblRegWorkId.Text = LanguageHelper.Get("WorkIdNum");
            lblDocType.Text = LanguageHelper.Get("DocType");
            lblUpload.Text = LanguageHelper.Get("UploadId");
            lblRegPass.Text = LanguageHelper.Get("Password");
            lblRegConf.Text = LanguageHelper.Get("ConfPass");
            btnRegSubmit.Text = LanguageHelper.Get("RegSubmitBtn");
            lblLoginText.Text = LanguageHelper.Get("AlreadyAcc");
            lnkLogin.Text = LanguageHelper.Get("SignInLink");
        }

        protected void btnRegSubmit_Click(object sender, EventArgs e)
        {
            string email = txtRegEmail.Text.Trim();
            string password = txtRegPass.Text.Trim();
            string confirmPassword = txtRegConf.Text.Trim();
            string workId = txtRegWorkId.Text.Trim();
            string docType = ddlDocType.SelectedValue;

            if (password != confirmPassword)
            {
                lblStatus.Text = "Passwords do not match.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(workId))
            {
                lblStatus.Text = "Please fill in all required fields.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (RegisterUser(email, password, workId, docType))
            {
                lblStatus.Text = "Registered successfully! Waiting for admin approval.";
                lblStatus.ForeColor = System.Drawing.Color.Green;
                
                // Clear the form
                txtRegEmail.Text = "";
                txtRegPass.Text = "";
                txtRegConf.Text = "";
                txtRegWorkId.Text = "";
                
                btnRegSubmit.Enabled = false;
                btnRegSubmit.BackColor = System.Drawing.Color.Gray;
            }
            else
            {
                lblStatus.Text = "Registration failed. Email might already exist.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool RegisterUser(string email, string password, string workId, string docType)
        {
            string sql = "INSERT INTO Users (Email, Password, Role, WorkId, DocType, IsVerified) VALUES (@email, @password, 'Contributor', @workId, @docType, 0)";
            try
            {
                DatabaseHelper.ExecuteNonQuery(sql,
                    new SQLiteParameter("@email", email),
                    new SQLiteParameter("@password", password),
                    new SQLiteParameter("@workId", workId),
                    new SQLiteParameter("@docType", docType));
                return true;
            }
            catch (Exception)
            {
                // Log error or show message (e.g. email already exists)
                return false;
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
