using System;
using System.Data;
using System.Data.SQLite;

namespace DDCH
{
    public partial class CommunityPosters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Ensure schema is updated
            try { DatabaseHelper.ExecuteNonQuery("ALTER TABLE Posts ADD COLUMN ImagePath TEXT"); } catch { }

            if (!IsPostBack)
            {
                LoadMyPosts();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text)) return;

            string imagePath = "";
            if (fuPostImage.HasFile)
            {
                try
                {
                    string fileName = Guid.NewGuid().ToString() + "_" + System.IO.Path.GetFileName(fuPostImage.FileName);
                    string savePath = Server.MapPath("~/Uploads/") + fileName;
                    fuPostImage.SaveAs(savePath);
                    imagePath = "Uploads/" + fileName;
                }
                catch { }
            }

            string userId = Session["UserId"].ToString();
            string sql = "INSERT INTO Posts (UserId, Category, Title, Content, ImagePath, Status, CreatedAt) VALUES (@uid, @cat, @title, @content, @img, 'Pending', @time)";
            
            SQLiteParameter[] prms = {
                new SQLiteParameter("@uid", userId),
                new SQLiteParameter("@cat", "Community Posters"),
                new SQLiteParameter("@title", txtTitle.Text),
                new SQLiteParameter("@content", txtContent.Text),
                new SQLiteParameter("@img", imagePath),
                new SQLiteParameter("@time", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            };

            DatabaseHelper.ExecuteNonQuery(sql, prms);

            txtTitle.Text = "";
            txtContent.Text = "";
            lblSuccess.Text = "Submitted for Review!";
            lblSuccess.Visible = true;

            LoadMyPosts();
        }

        private void LoadMyPosts()
        {
            string userId = Session["UserId"].ToString();
            DataTable dt = DatabaseHelper.ExecuteQuery("SELECT PostId, Title, Status FROM Posts WHERE Category = @cat AND UserId = @uid ORDER BY CreatedAt DESC LIMIT 3", 
                new SQLiteParameter("@cat", "Community Posters"), new SQLiteParameter("@uid", userId));
            
            pnlRow1.Visible = false; pnlRow2.Visible = false; pnlRow3.Visible = false;

            if (dt.Rows.Count > 0)
            {
                pnlRow1.Visible = true;
                lblRowTitle1.Text = dt.Rows[0]["Title"].ToString();
                SetStatus(lblRowStatus1, dt.Rows[0]["Status"].ToString());
                hdnId1.Value = dt.Rows[0]["PostId"].ToString();
            }
            if (dt.Rows.Count > 1)
            {
                pnlRow2.Visible = true;
                lblRowTitle2.Text = dt.Rows[1]["Title"].ToString();
                SetStatus(lblRowStatus2, dt.Rows[1]["Status"].ToString());
                hdnId2.Value = dt.Rows[1]["PostId"].ToString();
            }
            if (dt.Rows.Count > 2)
            {
                pnlRow3.Visible = true;
                lblRowTitle3.Text = dt.Rows[2]["Title"].ToString();
                SetStatus(lblRowStatus3, dt.Rows[2]["Status"].ToString());
                hdnId3.Value = dt.Rows[2]["PostId"].ToString();
            }
        }

        private void SetStatus(System.Web.UI.WebControls.Label lbl, string status)
        {
            lbl.Text = status;
            if (status == "Approved") { lbl.ForeColor = System.Drawing.ColorTranslator.FromHtml("#10B981"); lbl.BackColor = System.Drawing.ColorTranslator.FromHtml("#064E3B"); }
            else if (status == "Pending") { lbl.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FCD34D"); lbl.BackColor = System.Drawing.ColorTranslator.FromHtml("#451A03"); }
            else { lbl.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EF4444"); lbl.BackColor = System.Drawing.ColorTranslator.FromHtml("#7F1D1D"); }
        }

        private void DeletePost(string id)
        {
            string userId = Session["UserId"].ToString();
            DatabaseHelper.ExecuteNonQuery("DELETE FROM Posts WHERE PostId = @id AND UserId = @uid", new SQLiteParameter("@id", id), new SQLiteParameter("@uid", userId));
            LoadMyPosts();
        }

        protected void btnDelete1_Click(object sender, EventArgs e) { DeletePost(hdnId1.Value); }
        protected void btnDelete2_Click(object sender, EventArgs e) { DeletePost(hdnId2.Value); }
        protected void btnDelete3_Click(object sender, EventArgs e) { DeletePost(hdnId3.Value); }
    }
}
