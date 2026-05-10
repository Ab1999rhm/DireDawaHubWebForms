using System;
using System.Data;
using System.Data.SQLite;

namespace DDCH
{
    public partial class AdminPublicSafety : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            DataTable dt = DatabaseHelper.ExecuteQuery("SELECT PostId, Title, Status FROM Posts WHERE Category = @cat ORDER BY CreatedAt DESC LIMIT 3", new SQLiteParameter("@cat", "Public Safety"));
            
            pnlRow1.Visible = false; pnlRow2.Visible = false; pnlRow3.Visible = false;

            if (dt.Rows.Count > 0)
            {
                pnlRow1.Visible = true;
                lblTitle1.Text = dt.Rows[0]["Title"].ToString();
                lblStatus1.Text = dt.Rows[0]["Status"].ToString();
                hdnId1.Value = dt.Rows[0]["PostId"].ToString();
            }
            if (dt.Rows.Count > 1)
            {
                pnlRow2.Visible = true;
                lblTitle2.Text = dt.Rows[1]["Title"].ToString();
                lblStatus2.Text = dt.Rows[1]["Status"].ToString();
                hdnId2.Value = dt.Rows[1]["PostId"].ToString();
            }
            if (dt.Rows.Count > 2)
            {
                pnlRow3.Visible = true;
                lblTitle3.Text = dt.Rows[2]["Title"].ToString();
                lblStatus3.Text = dt.Rows[2]["Status"].ToString();
                hdnId3.Value = dt.Rows[2]["PostId"].ToString();
            }
        }

        private void UpdateStatus(string id, string status)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = @status WHERE PostId = @id", new SQLiteParameter("@status", status), new SQLiteParameter("@id", id));
            LoadData();
        }

        private void DeletePost(string id)
        {
            DatabaseHelper.ExecuteNonQuery("DELETE FROM Posts WHERE PostId = @id", new SQLiteParameter("@id", id));
            LoadData();
        }

        protected void btnApprove1_Click(object sender, EventArgs e) { UpdateStatus(hdnId1.Value, "Approved"); }
        protected void btnDeactivate1_Click(object sender, EventArgs e) { UpdateStatus(hdnId1.Value, "Deactivated"); }
        protected void btnDelete1_Click(object sender, EventArgs e) { DeletePost(hdnId1.Value); }

        protected void btnApprove2_Click(object sender, EventArgs e) { UpdateStatus(hdnId2.Value, "Approved"); }
        protected void btnDeactivate2_Click(object sender, EventArgs e) { UpdateStatus(hdnId2.Value, "Deactivated"); }
        protected void btnDelete2_Click(object sender, EventArgs e) { DeletePost(hdnId2.Value); }

        protected void btnApprove3_Click(object sender, EventArgs e) { UpdateStatus(hdnId3.Value, "Approved"); }
        protected void btnDeactivate3_Click(object sender, EventArgs e) { UpdateStatus(hdnId3.Value, "Deactivated"); }
        protected void btnDelete3_Click(object sender, EventArgs e) { DeletePost(hdnId3.Value); }
    }
}
