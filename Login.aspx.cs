using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SQLite;

namespace DDCH
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ApplyLanguage();
                }
            }
            catch { }
        }

        private void ApplyLanguage()
        {
            try
            {
                lblWelcome.Text = LanguageHelper.Get("WelcomePortal");
                lblDesc.Text = LanguageHelper.Get("PortalDesc");
                lblSignIn.Text = LanguageHelper.Get("SignIn");
                lblSignInDesc.Text = LanguageHelper.Get("SignInDesc");
                lblEmail.Text = LanguageHelper.Get("Email");
                lblPassword.Text = LanguageHelper.Get("Password");
                chkRemember.Text = LanguageHelper.Get("Remember");
                btnLoginSubmit.Text = LanguageHelper.Get("SignInBtn");
                lblRegisterText.Text = LanguageHelper.Get("NeedShare");
                lnkRegister.Text = LanguageHelper.Get("RegisterLink");
            }
            catch { }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                {
                    lblLoginError.Text = "Please enter both email and password.";
                    return;
                }

                if (AuthenticateUser(email, password))
                {
                    FormsAuthentication.SetAuthCookie(email, chkRemember.Checked);
                    if (Session["UserRole"] != null)
                    {
                        string role = Session["UserRole"].ToString();
                        if (role == "Admin")
                            Response.Redirect("Admin.aspx");
                        else
                            Response.Redirect("Contributor.aspx");
                    }
                }
                else
                {
                    lblLoginError.Text = Session["LoginError"]?.ToString() ?? "Invalid login attempt.";
                }
            }
            catch (Exception ex)
            {
                lblLoginError.Text = "An error occurred during login. Please try again.";
                System.Diagnostics.Trace.WriteLine("Login Error: " + ex.Message);
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            try
            {
                string sql = "SELECT UserId, Role, IsVerified FROM Users WHERE Email = @email AND Password = @password";
                var dt = DatabaseHelper.ExecuteQuery(sql, 
                    new SQLiteParameter("@email", email),
                    new SQLiteParameter("@password", password));

                if (dt != null && dt.Rows.Count > 0)
                {
                    int isVerified = Convert.ToInt32(dt.Rows[0]["IsVerified"]);
                    string role = dt.Rows[0]["Role"].ToString();

                    if (role != "Admin" && isVerified == 0)
                    {
                        Session["LoginError"] = "Your account is pending approval by the administrator.";
                        DatabaseHelper.LogAudit("Failed Login", "Pending account attempted login", "System", email, "WARNING");
                        return false;
                    }
                    
                    if (isVerified == 2)
                    {
                        Session["LoginError"] = "Your account has been deactivated.";
                        DatabaseHelper.LogAudit("Failed Login", "Deactivated account attempted login", "System", email, "WARNING");
                        return false;
                    }

                    Session["UserId"] = dt.Rows[0]["UserId"].ToString();
                    Session["UserRole"] = role;
                    Session["UserEmail"] = email;
                    DatabaseHelper.LogAudit("User Login", role + " authenticated successfully", email, "-", "INFO");
                    return true;
                }
                Session["LoginError"] = "Invalid email or password.";
                DatabaseHelper.LogAudit("Failed Login", "Invalid credentials provided", "System", email, "WARNING");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("AuthenticateUser Error: " + ex.Message);
            }
            return false;
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
