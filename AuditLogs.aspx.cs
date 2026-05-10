using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DDCH
{
    public partial class AuditLogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadAuditLogs();
            }
        }

        private void LoadAuditLogs()
        {
            // Fetch Stats
            lblStat1Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs").ToString();
            lblStat2Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'INFO'").ToString();
            lblStat3Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'WARNING'").ToString();
            lblStat4Value.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM AuditLogs WHERE Severity = 'CRITICAL'").ToString();

            // Bind Logs (Manual mapping for Designer support)
            DataTable dt = DatabaseHelper.ExecuteQuery("SELECT * FROM AuditLogs ORDER BY Timestamp DESC LIMIT 5");
            
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
            
            lblPageInfo.Text = "Showing " + dt.Rows.Count + " of " + lblStat1Value.Text + " events";
        }

        private void FillRow(DataRow row, System.Web.UI.WebControls.Label ts, System.Web.UI.WebControls.Label act, System.Web.UI.WebControls.Label desc, System.Web.UI.WebControls.Label by, System.Web.UI.WebControls.Label target, System.Web.UI.WebControls.Label sev)
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
