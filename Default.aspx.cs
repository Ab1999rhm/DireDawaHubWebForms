using System;
using System.Configuration;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;

namespace DDCH
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHomeData();
                LoadWeather();
            }
        }

        private void LoadHomeData()
        {
            try
            {
                // Stat counters
                lblWaterCount.Text  = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Water Tracker' AND Status = 'Approved'").ToString();
                lblClinicCount.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Health Directory' AND Status = 'Approved'").ToString();
                lblJobCount.Text    = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Job Board' AND Status = 'Approved'").ToString();
                lblMarketCount.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Category = 'Agriculture' AND Status = 'Approved'").ToString();

                // Community Posters (Fixed Panels)
                var postersDt = DatabaseHelper.ExecuteQuery(
                    "SELECT Title, Content FROM Posts WHERE Category = 'Community Posters' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 3");
                BindPostersToPanels(postersDt);

                // Quick View Data
                var waterDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Water Tracker' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (waterDt.Rows.Count > 0) { lblWater1Loc.Text = waterDt.Rows[0]["Title"].ToString(); lblWater1Time.Text = waterDt.Rows[0]["Content"].ToString(); }

                var healthDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Health Directory' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (healthDt.Rows.Count > 0) { lblHealth1Name.Text = healthDt.Rows[0]["Title"].ToString(); lblHealth1Docs.Text = healthDt.Rows[0]["Content"].ToString(); }

                var jobsDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Job Board' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (jobsDt.Rows.Count > 0) { lblJob1Title.Text = jobsDt.Rows[0]["Title"].ToString(); lblJob1Company.Text = jobsDt.Rows[0]["Content"].ToString(); }

                var agriDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Agriculture' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (agriDt.Rows.Count > 0) { lblMarket1Crop.Text = agriDt.Rows[0]["Title"].ToString(); lblMarket1Loc.Text = agriDt.Rows[0]["Content"].ToString(); }

                var safetyDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Public Safety' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (safetyDt.Rows.Count > 0) { lblSafety1Title.Text = safetyDt.Rows[0]["Title"].ToString(); lblSafety1Desc.Text = safetyDt.Rows[0]["Content"].ToString(); }

                var statsDt = DatabaseHelper.ExecuteQuery("SELECT Title, Content FROM Posts WHERE Category = 'Statistics' AND Status = 'Approved' ORDER BY CreatedAt DESC LIMIT 1");
                if (statsDt.Rows.Count > 0) { lblStatBox1Val.Text = statsDt.Rows[0]["Title"].ToString(); lblStatBox1Desc.Text = statsDt.Rows[0]["Content"].ToString(); }
            }
            catch { }
        }

        private void BindPostersToPanels(DataTable dt)
        {
            pnlPostItem1.Visible = false;
            pnlPostItem2.Visible = false;
            pnlPostItem3.Visible = false;

            if (dt.Rows.Count > 0) {
                lblPostTitle1.Text = dt.Rows[0]["Title"].ToString();
                lblPostContent1.Text = dt.Rows[0]["Content"].ToString();
                pnlPostItem1.Visible = true;
            }
            if (dt.Rows.Count > 1) {
                lblPostTitle2.Text = dt.Rows[1]["Title"].ToString();
                lblPostContent2.Text = dt.Rows[1]["Content"].ToString();
                pnlPostItem2.Visible = true;
            }
            if (dt.Rows.Count > 2) {
                lblPostTitle3.Text = dt.Rows[2]["Title"].ToString();
                lblPostContent3.Text = dt.Rows[2]["Content"].ToString();
                pnlPostItem3.Visible = true;
            }
        }

        private void LoadWeather()
        {
            try
            {
                const string CACHE_KEY = "DireDawaWeather";
                JObject data = HttpRuntime.Cache[CACHE_KEY] as JObject;
                if (data == null)
                {
                    string apiKey = ConfigurationManager.AppSettings["WeatherApiKey"];
                    string city = ConfigurationManager.AppSettings["WeatherCity"] ?? "Dire Dawa,ET";
                    string url  = $"https://api.openweathermap.org/data/2.5/weather?q={Uri.EscapeDataString(city)}&appid={apiKey}&units=metric";
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    using (var client = new WebClient())
                    {
                        client.Encoding = System.Text.Encoding.UTF8;
                        string json = client.DownloadString(url);
                        data = JObject.Parse(json);
                    }
                    HttpRuntime.Cache.Insert(CACHE_KEY, data, null, DateTime.Now.AddMinutes(15), Cache.NoSlidingExpiration);
                }
                double temp = Math.Round(data["main"]["temp"].Value<double>(), 1);
                lblWeatherCity.Text = "Dire Dawa, Ethiopia";
                lblWeatherDate.Text = DateTime.Now.ToString("dddd, MMMM d");
                lblWeatherTemp.Text = $"{temp}°C";
                lblWeatherCondition.Text = data["weather"][0]["description"].ToString();
                lblWeatherIcon.Text = "☀️";
            }
            catch { ShowWeatherFallback("API Unavailable"); }
        }

        private void ShowWeatherFallback(string msg) { lblWeatherError.Text = msg; lblWeatherError.Visible = true; }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = txtGlobalSearch.Text.Trim();
            if (!string.IsNullOrEmpty(query))
            {
                var dt = DatabaseHelper.ExecuteQuery(
                    "SELECT Title, Content FROM Posts WHERE Status = 'Approved' AND (Title LIKE @q OR Content LIKE @q) LIMIT 3",
                    new System.Data.SQLite.SQLiteParameter("@q", "%" + query + "%"));
                BindPostersToPanels(dt);
                lblPostersHeader.Text = "Search Results for '" + query + "'";
            }
            else
            {
                LoadHomeData();
                lblPostersHeader.Text = "Community Posters";
            }
        }

        protected void txtGlobalSearch_TextChanged(object sender, EventArgs e) { }
    }
}