using System;
using System.Collections.Generic;
using System.Web;

namespace DDCH
{
    public static class LanguageHelper
    {
        private static Dictionary<string, Dictionary<string, string>> translations = new Dictionary<string, Dictionary<string, string>>()
        {
            ["en"] = new Dictionary<string, string>()
            {
                ["Logo"] = "Dire Dawa Hub",
                ["Login"] = "Login",
                ["Portal"] = "Contributors Portal",
                ["HeroTitle"] = "Welcome to Dire Dawa",
                ["HeroSubtitle"] = "Your gateway to city services, community news, and real-time updates.",
                ["SearchPlaceholder"] = "Search services, news, or safety alerts...",
                ["QuickNav"] = "Quick Navigation",
                ["Water"] = "Water Status",
                ["Health"] = "Health Directory",
                ["Agri"] = "Agriculture",
                ["Jobs"] = "Job Board",
                ["Stats"] = "City Statistics",
                ["CommunityPosters"] = "Community Posters",
                ["LatestUpdate"] = "Latest Updates",
                ["FooterText"] = "The official digital gateway for the residents of Dire Dawa.",
                ["Copyright"] = "Copyright 2026 Dire Dawa City Administration.",
                ["HeroTitleMain"] = "Dire Dawa Hub",
                ["HeroSubtitleMain"] = "The Smart City Gateway for Residents & Businesses",
                ["SearchBtn"] = "Search",
                ["WaterSvc"] = "Water Services",
                ["HealthCl"] = "Health Clinics",
                ["AgriSvc"] = "Agriculture",
                ["JobP"] = "Job Portal",
                ["EduSvc"] = "Education",
                ["WaterStat"] = "Active Water Routes",
                ["HealthStat"] = "Health Clinics",
                ["MarketStat"] = "Market Reports",
                ["JobStat"] = "Job Postings",
                ["PostersHdr"] = "Community Posters",
                ["WeatherHdr"] = "Dire Dawa, Ethiopia",
                ["EduHdr"] = "Education Updates",
                ["WaterHdr"] = "Water Supply Tracker",
                ["HealthHdr"] = "Health Clinics",
                ["JobsHdr"] = "Local Job Portal",
                ["MarketHdr"] = "Agriculture Market",
                ["SafetyHdr"] = "Public Safety Alerts",
                ["StatsHdr"] = "Community Statistics",
                ["WelcomePortal"] = "Welcome to the Portal",
                ["PortalDesc"] = "Access the Dire Dawa Community Hub management system to update resources and insights.",
                ["SignIn"] = "Sign In",
                ["SignInDesc"] = "Enter your credentials to manage the hub",
                ["Email"] = "Email Address",
                ["Password"] = "Password",
                ["Remember"] = "Remember me",
                ["SignInBtn"] = "Sign Into Dashboard",
                ["NeedShare"] = "Need to share information?",
                ["RegisterLink"] = "Register as Contributor",
                ["RegHeader"] = "Contributor Registration",
                ["RegSub"] = "Join the Dire Dawa Hub community",
                ["DocReqs"] = "Document Requirements:",
                ["Req1"] = "• Upload a clear photo of your Work ID card or Government ID",
                ["Req2"] = "• File size: Max 5MB (JPG, PNG, PDF accepted)",
                ["WorkIdNum"] = "Work ID Number",
                ["DocType"] = "Document Type",
                ["UploadId"] = "ID Document Photo",
                ["ConfPass"] = "Confirm Password",
                ["RegSubmitBtn"] = "Submit for Verification",
                ["AlreadyAcc"] = "Already have an account?",
                ["SignInLink"] = "Sign in here"
            },
            ["am"] = new Dictionary<string, string>()
            {
                ["Logo"] = "ድሬ ዳዋ ሀብ",
                ["Login"] = "ግባ",
                ["Portal"] = "የአስተዋጽኦ አድራጊዎች ፖርታል",
                ["HeroTitle"] = "ወደ ድሬ ዳዋ እንኳን ደህና መጡ",
                ["HeroSubtitle"] = "ለከተማ አገልግሎቶች፣ ለማህበረሰብ ዜናዎች እና ለቀጥታ መረጃዎች መግቢያዎ።",
                ["SearchPlaceholder"] = "አገልግሎቶችን፣ ዜናዎችን ወይም የደህንነት ማስጠንቀቂያዎችን ይፈልጉ...",
                ["QuickNav"] = "ፈጣን አሰሳ",
                ["Water"] = "የውሃ ሁኔታ",
                ["Health"] = "የጤና ማውጫ",
                ["Agri"] = "ግብርና",
                ["Jobs"] = "የስራ ቦርድ",
                ["Stats"] = "የከተማ ስታቲስቲክስ",
                ["CommunityPosters"] = "የማህበረሰብ ፖስተሮች",
                ["LatestUpdate"] = "የቅርብ ጊዜ ዝመናዎች",
                ["FooterText"] = "ለድሬዳዋ ነዋሪዎች ይፋዊ የዲጂታል መግቢያ በር።",
                ["Copyright"] = "የቅጂ መብት 2026 የድሬዳዋ ከተማ አስተዳደር።",
                ["HeroTitleMain"] = "ድሬ ዳዋ ሀብ",
                ["HeroSubtitleMain"] = "ለነዋሪዎች እና ለንግድ ድርጅቶች ስማርት የከተማ መግቢያ በር",
                ["SearchBtn"] = "ፈልግ",
                ["WaterSvc"] = "የውሃ አገልግሎቶች",
                ["HealthCl"] = "የጤና ክሊኒኮች",
                ["AgriSvc"] = "ግብርና",
                ["JobP"] = "የስራ ፖርታል",
                ["EduSvc"] = "ትምህርት",
                ["WaterStat"] = "ንቁ የውሃ መስመሮች",
                ["HealthStat"] = "የጤና ክሊኒኮች",
                ["MarketStat"] = "የገበያ ሪፖርቶች",
                ["JobStat"] = "የስራ ማስታወቂያዎች",
                ["PostersHdr"] = "የማህበረሰብ ፖስተሮች",
                ["WeatherHdr"] = "ድሬ ዳዋ፣ ኢትዮጵያ",
                ["EduHdr"] = "የትምህርት ዝመናዎች",
                ["WaterHdr"] = "የውሃ አቅርቦት ተቆጣጣሪ",
                ["HealthHdr"] = "የጤና ክሊኒኮች",
                ["JobsHdr"] = "የአካባቢ የሥራ ፖርታል",
                ["MarketHdr"] = "የግብርና ገበያ",
                ["SafetyHdr"] = "የህዝብ ደህንነት ማንቂያዎች",
                ["StatsHdr"] = "የማህበረሰብ ስታቲስቲክስ",
                ["WelcomePortal"] = "ወደ ፖርታል እንኳን ደህና መጡ",
                ["PortalDesc"] = "ሃብቶችን እና ግንዛቤዎችን ለማዘመን የድሬዳዋ ማህበረሰብ መገናኛ አስተዳደር ስርዓትን ይድረሱ።",
                ["SignIn"] = "ይግቡ",
                ["SignInDesc"] = "ማዕከሉን ለማስተዳደር ምስክርነቶችን ያስገቡ",
                ["Email"] = "የኢሜል አድራሻ",
                ["Password"] = "የይለፍ ቃል",
                ["Remember"] = "አስታውሰኝ",
                ["SignInBtn"] = "ወደ ዳሽቦርድ ይግቡ",
                ["NeedShare"] = "መረጃ ማጋራት ይፈልጋሉ?",
                ["RegisterLink"] = "እንደ አስተዋጽኦ አድራጊ ይመዝገቡ",
                ["RegHeader"] = "የአስተዋጽኦ አድራጊ ምዝገባ",
                ["RegSub"] = "የድሬዳዋ ሀብ ማህበረሰብን ይቀላቀሉ",
                ["DocReqs"] = "የሰነድ መስፈርቶች፡",
                ["Req1"] = "• የሥራ መታወቂያ ካርድዎን ወይም የመንግስት መታወቂያዎን ግልጽ ፎቶ ይስቀሉ",
                ["Req2"] = "• የፋይል መጠን፡ ቢበዛ 5 ሜባ (JPG፣ PNG፣ PDF ተቀባይነት አለው)",
                ["WorkIdNum"] = "የሥራ መታወቂያ ቁጥር",
                ["DocType"] = "የሰነድ ዓይነት",
                ["UploadId"] = "የመታወቂያ ሰነድ ፎቶ",
                ["ConfPass"] = "የይለፍ ቃል ያረጋግጡ",
                ["RegSubmitBtn"] = "ለማረጋገጫ ያቅርቡ",
                ["AlreadyAcc"] = "አስቀድመው መለያ አለዎት?",
                ["SignInLink"] = "እዚህ ይግቡ"
            },
            ["om"] = new Dictionary<string, string>()
            {
                ["Logo"] = "Dire Dawa Hub",
                ["Login"] = "Seeni",
                ["Portal"] = "Portal Gumaachitootaa",
                ["HeroTitle"] = "Baga Gara Diree Dawaa Dhuftan",
                ["HeroSubtitle"] = "Kalaqa keessan tajaajila magaalaa, oduu hawaasaa fi odeeffannoo yeroo dhugaaf.",
                ["SearchPlaceholder"] = "Tajaajila, oduu ykn akeekkachiisa nageenyaa barbaadi...",
                ["QuickNav"] = "Qubannoo Ariifachiisaa",
                ["Water"] = "Haala Bishaania",
                ["Health"] = "Qajeelcha Fayyaa",
                ["Agri"] = "Qonna",
                ["Jobs"] = "Boordii Hojii",
                ["Stats"] = "Istaatistiiksii Magaalaa",
                ["CommunityPosters"] = "Poostari Hawwaasaa",
                ["LatestUpdate"] = "Oduu Haaraa",
                ["FooterText"] = "Karra dijiitaalaa rasmicha jiraattota Diree Dawaatiif.",
                ["Copyright"] = "Mirgi Qubannoo 2026 Bulchiinsa Magaalaa Diree Dawaa.",
                ["HeroTitleMain"] = "Dire Dawa Hub",
                ["HeroSubtitleMain"] = "Karra Magaalaa Smart Jiraattotaaf fi Daldaltootaaf",
                ["SearchBtn"] = "Barbaadi",
                ["WaterSvc"] = "Tajaajila Bishaania",
                ["HealthCl"] = "Kiliniikota Fayyaa",
                ["AgriSvc"] = "Qonna",
                ["JobP"] = "Portal Hojii",
                ["EduSvc"] = "Barumsa",
                ["WaterStat"] = "Dhaabbilee Bishaania",
                ["HealthStat"] = "Kiliniikota Fayyaa",
                ["MarketStat"] = "Gabaasa Gabaa",
                ["JobStat"] = "Beeksisa Hojii",
                ["PostersHdr"] = "Poostari Hawwaasaa",
                ["WeatherHdr"] = "Diree Dawaa, Itoophiyaa",
                ["EduHdr"] = "Oduu Barumsaa",
                ["WaterHdr"] = "Hordoffii Bishaania",
                ["HealthHdr"] = "Kiliniikota Fayyaa",
                ["JobsHdr"] = "Portal Hojii Naannoo",
                ["MarketHdr"] = "Gabaa Qonnaa",
                ["SafetyHdr"] = "Akeekkachiisa Nageenyaa",
                ["StatsHdr"] = "Istaatistiiksii Hawaasaa",
                ["WelcomePortal"] = "Baga gara Portal dhuftan",
                ["PortalDesc"] = "Meeshaalee fi ilaalcha haaraa gochuuf sirna bulchiinsa Hub Hawaasa Diree Dawaa seenaa.",
                ["SignIn"] = "Seeni",
                ["SignInDesc"] = "Hub bulchuuf ragaa keessan galchaa",
                ["Email"] = "Imeelii",
                ["Password"] = "Jecha Icchitii",
                ["Remember"] = "Na yaadadhu",
                ["SignInBtn"] = "Gara Daashboordiitti Seeni",
                ["NeedShare"] = "Odeeffannoo qooduun barbaachisadha?",
                ["RegisterLink"] = "Akka Gumaachituutti Galmaa'i",
                ["RegHeader"] = "Galmee Gumaachituu",
                ["RegSub"] = "Hawaasa Hub Diree Dawaa tti makamaa",
                ["DocReqs"] = "Ulaagaalee Sanadaa:",
                ["Req1"] = "• Footoo qulqulluu kaardii eenyummaa hojii ykn eenyummaa mootummaa keessanii olkaa'aa",
                ["Req2"] = "• Hammamtaa faayilaa: Max 5MB (JPG, PNG, PDF ni fudhatama)",
                ["WorkIdNum"] = "Lakkoofsa Eenyummaa Hojii",
                ["DocType"] = "Gosa Sanadaa",
                ["UploadId"] = "Footoo Sanada Eenyummaa",
                ["ConfPass"] = "Jecha Icchitii Mirkaneessi",
                ["RegSubmitBtn"] = "Mirkaneessaaf Galchi",
                ["AlreadyAcc"] = "Duraan akkawuntii qabduu?",
                ["SignInLink"] = "Asitti seeni"
            },
            ["so"] = new Dictionary<string, string>()
            {
                ["Logo"] = "Dire Dawa Hub",
                ["Login"] = "Gali",
                ["Portal"] = "Bogga Wax-ku-biiriyayaasha",
                ["HeroTitle"] = "Ku soo dhawaada Dire Dawa",
                ["HeroSubtitle"] = "Albaabkaaga tixraaca adeegyada magaalada, wararka bulshada iyo macluumaadka rasmiga ah.",
                ["SearchPlaceholder"] = "Raadi adeegyada, wararka ama digniinaha nabadgelyada...",
                ["QuickNav"] = "Hage Degdeg ah",
                ["Water"] = "Xaaladda Biyaha",
                ["Health"] = "Hage Caafimaad",
                ["Agri"] = "Beeraha",
                ["Jobs"] = "Guddiga Shaqada",
                ["Stats"] = "Xogta Magaalada",
                ["CommunityPosters"] = "Ogeysiisyada Bulshada",
                ["LatestUpdate"] = "Wararkii ugu dambeeyay",
                ["FooterText"] = "Albaabka rasmiga ah ee dhijitaalka ah ee dadka deegaanka Dire Dawa.",
                ["Copyright"] = "Xuquuqda daabacaadda 2026 Maamulka Magaalada Dire Dawa.",
                ["HeroTitleMain"] = "Dire Dawa Hub",
                ["HeroSubtitleMain"] = "Albaabka Magaalada Smart ee Dadka iyo Ganacsiga",
                ["SearchBtn"] = "Raadi",
                ["WaterSvc"] = "Adeegyada Biyaha",
                ["HealthCl"] = "Rugaha Caafimaadka",
                ["AgriSvc"] = "Beeraha",
                ["JobP"] = "Bogga Shaqada",
                ["EduSvc"] = "Waxbarashada",
                ["WaterStat"] = "Waddooyinka Biyaha",
                ["HealthStat"] = "Rugaha Caafimaadka",
                ["MarketStat"] = "Warbixinnada Suuqa",
                ["JobStat"] = "Shaqooyinka Bannaan",
                ["PostersHdr"] = "Ogeysiisyada Bulshada",
                ["WeatherHdr"] = "Dire Dawa, Itoobiya",
                ["EduHdr"] = "Wararka Waxbarashada",
                ["WaterHdr"] = "Raad-raaca Biyaha",
                ["HealthHdr"] = "Rugaha Caafimaadka",
                ["JobsHdr"] = "Bogga Shaqada Deegaanka",
                ["MarketHdr"] = "Suuqa Beeraha",
                ["SafetyHdr"] = "Digniinaha Amniga",
                ["StatsHdr"] = "Xogta Bulshada",
                ["WelcomePortal"] = "Ku soo dhawaada Bogga",
                ["PortalDesc"] = "Gali nidaamka maaraynta Hubka Bulshada ee Dire Dawa si aad u cusboonaysiiso agabka iyo xogta.",
                ["SignIn"] = "Gal",
                ["SignInDesc"] = "Gali aqoonsigaaga si aad u maamusho hubka",
                ["Email"] = "Cinwaanka Imeelka",
                ["Password"] = "Erayga sirta ah",
                ["Remember"] = "Isii xasuuso",
                ["SignInBtn"] = "Gali Dashboard-ka",
                ["NeedShare"] = "Ma u baahan tahay inaad macluumaad wadaagto?",
                ["RegisterLink"] = "Isu diiwaangeli sidii Wax-ku-biiriye",
                ["RegHeader"] = "Diiwaangelinta Wax-ku-biiriyaha",
                ["RegSub"] = "Ku biir bulshada Dire Dawa Hub",
                ["DocReqs"] = "Shuruudaha Dukumentiga:",
                ["Req1"] = "• Soo rar sawir cad oo kaarka aqoonsiga shaqadaada ama aqoonsiga dawladda",
                ["Req2"] = "• Cabbirka faylka: ugu badnaan 5MB (JPG, PNG, PDF waa la aqbalayaa)",
                ["WorkIdNum"] = "Lambarka aqoonsiga shaqada",
                ["DocType"] = "Nooca Dukumentiga",
                ["UploadId"] = "Sawirka Dukumentiga Aqoonsiga",
                ["ConfPass"] = "Xaqiiji Erayga sirta ah",
                ["RegSubmitBtn"] = "U soo gudbi Xaqiijinta",
                ["AlreadyAcc"] = "Horey ma u lahayd akoon?",
                ["SignInLink"] = "Halkan ka gal"
            }
        };

        public static string Get(string key)
        {
            string lang = GetCurrentLanguage();
            if (translations.ContainsKey(lang) && translations[lang].ContainsKey(key))
            {
                return translations[lang][key];
            }
            // Fallback to English
            if (translations["en"].ContainsKey(key))
            {
                return translations["en"][key];
            }
            return key;
        }

        public static string GetCurrentLanguage()
        {
            if (HttpContext.Current.Session != null && HttpContext.Current.Session["Lang"] != null)
            {
                return HttpContext.Current.Session["Lang"].ToString();
            }
            return "en"; // Default
        }

        public static void SetLanguage(string lang)
        {
            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session["Lang"] = lang;
            }
        }
    }
}
