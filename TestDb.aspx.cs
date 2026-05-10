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
    public partial class TestDb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DatabaseHelper.InitializeDatabase();
                DataTable dt = DatabaseHelper.ExecuteQuery("SELECT * FROM Users");
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
