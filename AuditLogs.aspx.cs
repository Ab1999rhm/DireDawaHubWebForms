using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DDCH
{
    public partial class AuditLogs : System.Web.UI.Page
    {
        private int PageSize = 5;

        protected int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null) return 0;
                return (int)ViewState["CurrentPage"];
            }
            set { ViewState["CurrentPage"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                CurrentPage = 0;
                LoadAuditLogs();
            }
        }

        private void LoadAuditLogs()
        {
            // Fetch Stats
            int totalLogs = Convert.ToInt32(DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs"));
            lblStat1Value.Text = totalLogs.ToString();
            lblStat2Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'INFO'").ToString();
            lblStat3Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'WARNING'").ToString();
            lblStat4Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'CRITICAL'").ToString();

            // Bind Logs with Offset for Pagination
            int offset = CurrentPage * PageSize;
            DataTable dt = DatabaseHelper.ExecuteQuery(
                $"SELECT * FROM AuditLogs ORDER BY Timestamp DESC LIMIT {PageSize} OFFSET {offset}");
            
            pnlRow1.Visible = (dt.Rows.Count > 0);
            if (pnlRow1.Visible) FillRow(dt.Rows[0], lblTimestamp1, lblAction1, lblDescription1, lblPerformedBy1, lblTarget1, lblSeverity1);

            pnlRow2.Visible = (dt.Rows.Count > 1);
            if (pnlRow2.Visible) FillRow(dt.Rows[1], lblTimestamp2, lblAction2, lblDescription2, lblPerformedBy2, lblTarget2, lblSeverity2);

            pnlRow3.Visible = (dt.Rows.Count > 2);
            if (pnlRow3.Visible) FillRow(dt.Rows[2], lblTimestamp3, lblAction3, lblDescription3, lblPerformedBy3, lblTarget3, lblSeverity3);

            pnlRow4.Visible = (dt.Rows.Count > 3);
            if (pnlRow4.Visible) FillRow(dt.Rows[3], lblTimestamp4, lblAction4, lblDescription4, lblPerformedBy4, lblTarget4, lblSeverity4);

            pnlRow5.Visible = (dt.Rows.Count > 4);
            if (pnlRow5.Visible) FillRow(dt.Rows[4], lblTimestamp5, lblAction5, lblDescription5, lblPerformedBy5, lblTarget5, lblSeverity5);
            
            // Update Pagination UI
            int start = offset + 1;
            int end = offset + dt.Rows.Count;
            lblPageInfo.Text = $"Showing {start} - {end} of {totalLogs} events";
            
            btnPrev.Enabled = (CurrentPage > 0);
            btnNext.Enabled = (end < totalLogs);

            // Visual feedback for disabled buttons
            btnPrev.Style["opacity"] = btnPrev.Enabled ? "1" : "0.5";
            btnNext.Style["opacity"] = btnNext.Enabled ? "1" : "0.5";
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 0)
            {
                CurrentPage--;
                LoadAuditLogs();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadAuditLogs();
        }

        private void FillRow(DataRow row, Label ts, Label act, Label desc, Label by, Label target, Label sev)
        {
            ts.Text = Convert.ToDateTime(row["Timestamp"]).ToString("yyyy-MM-dd HH:mm:ss");
            act.Text = row["Action"].ToString();
            desc.Text = row["Description"].ToString();
            by.Text = row["PerformedBy"].ToString();
            target.Text = row["Target"].ToString();
            string s = row["Severity"].ToString();
            sev.Text = s;
            
            if (s == "CRITICAL") { sev.Style["background-color"] = "#450A0A"; sev.Style["color"] = "#FCA5A5"; }
            else if (s == "WARNING") { sev.Style["background-color"] = "#451A03"; sev.Style["color"] = "#FCD34D"; }
            else { sev.Style["background-color"] = "#1E3A8A"; sev.Style["color"] = "#93C5FD"; }
        }
    }
}
