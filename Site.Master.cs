using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDCH
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string lang = LanguageHelper.GetCurrentLanguage();
                ddlLanguage.SelectedValue = lang;
                ApplyLanguage();
            }
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LanguageHelper.SetLanguage(ddlLanguage.SelectedValue);
            Response.Redirect(Request.RawUrl); // Refresh page to apply culture
        }

        private void ApplyLanguage()
        {
            lblLogo.Text = LanguageHelper.Get("Logo");
            BtnLogin.Text = LanguageHelper.Get("Login");
            BtnContributor.Text = LanguageHelper.Get("Portal");
            lblFooterTitle.Text = LanguageHelper.Get("Logo"); // Reuse Logo key
            lblFooterText.Text = LanguageHelper.Get("FooterText");
            lblFooterCopyright.Text = LanguageHelper.Get("Copyright");
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void BtnContributor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}