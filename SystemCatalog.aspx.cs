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
    public partial class SystemCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCatalog();
            }
        }

        private void LoadCatalog(string category = "Job Board")
        {
            // Update Counts
            int jobsCount = Convert.ToInt32(DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Job Board'"));
            int waterCount = Convert.ToInt32(DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Water Tracker'"));
            int clinicCount = Convert.ToInt32(DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Health Directory'"));

            btnTabJobs.Text = "Jobs (" + jobsCount + ")";
            btnTabWater.Text = "Water (" + waterCount + ")";
            btnTabClinics.Text = "Clinics (" + clinicCount + ")";

            // Load Data for specific category
            System.Data.DataTable dt = DatabaseHelper.ExecuteQuery("SELECT PostId, Category, Title, Status FROM Posts WHERE Category = @cat ORDER BY CreatedAt DESC LIMIT 3", new SQLiteParameter("@cat", category));
            
            // Reset visibility
            pnlCatalogRow1.Visible = false;
            pnlCatalogRow2.Visible = false;
            pnlCatalogRow3.Visible = false;

            if (dt.Rows.Count > 0)
            {
                pnlCatalogRow1.Visible = true;
                lblCat1.Text = dt.Rows[0]["Category"].ToString();
                lblTitle1.Text = dt.Rows[0]["Title"].ToString();
                lblStatus1.Text = dt.Rows[0]["Status"].ToString();
                hdnCatId1.Value = dt.Rows[0]["PostId"].ToString();
            }
            if (dt.Rows.Count > 1)
            {
                pnlCatalogRow2.Visible = true;
                lblCat2.Text = dt.Rows[1]["Category"].ToString();
                lblTitle2.Text = dt.Rows[1]["Title"].ToString();
                lblStatus2.Text = dt.Rows[1]["Status"].ToString();
                hdnCatId2.Value = dt.Rows[1]["PostId"].ToString();
            }
            if (dt.Rows.Count > 2)
            {
                pnlCatalogRow3.Visible = true;
                lblCat3.Text = dt.Rows[2]["Category"].ToString();
                lblTitle3.Text = dt.Rows[2]["Title"].ToString();
                lblStatus3.Text = dt.Rows[2]["Status"].ToString();
                hdnCatId3.Value = dt.Rows[2]["PostId"].ToString();
            }
        }

        protected void btnTabJobs_Click(object sender, EventArgs e)
        {
            SetActiveTab(btnTabJobs);
            LoadCatalog("Job Board");
        }

        protected void btnTabWater_Click(object sender, EventArgs e)
        {
            SetActiveTab(btnTabWater);
            LoadCatalog("Water Tracker");
        }

        protected void btnTabClinics_Click(object sender, EventArgs e)
        {
            SetActiveTab(btnTabClinics);
            LoadCatalog("Health Directory");
        }

        private void SetActiveTab(System.Web.UI.WebControls.Button activeBtn)
        {
            btnTabJobs.CssClass = "tab-btn";
            btnTabWater.CssClass = "tab-btn";
            btnTabClinics.CssClass = "tab-btn";
            activeBtn.CssClass = "tab-btn active";
        }

        protected void btnApproveCat1_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Approved' WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId1.Value));
            LoadCatalog();
        }

        protected void btnPurgeCat1_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("DELETE FROM Posts WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId1.Value));
            LoadCatalog();
        }

        protected void btnApproveCat2_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Approved' WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId2.Value));
            LoadCatalog();
        }

        protected void btnPurgeCat2_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("DELETE FROM Posts WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId2.Value));
            LoadCatalog();
        }

        protected void btnApproveCat3_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("UPDATE Posts SET Status = 'Approved' WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId3.Value));
            LoadCatalog();
        }

        protected void btnPurgeCat3_Click(object sender, EventArgs e)
        {
            DatabaseHelper.ExecuteNonQuery("DELETE FROM Posts WHERE PostId = @id", new SQLiteParameter("@id", hdnCatId3.Value));
            LoadCatalog();
        }
    }
}
