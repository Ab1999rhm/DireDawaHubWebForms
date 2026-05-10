<%@ Page Title="Health Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlHealthCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="🏥 HEALTH MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Manage clinic records and healthcare facilities" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddClinic" runat="server" Text="➕ Add Clinic" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnExport" runat="server" Text="📊 Export" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlStat1" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat1Icon" runat="server" Text="🏥" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Title" runat="server" Text="TOTAL CLINICS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat1Value" runat="server" Text="124" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat1Unit" runat="server" Text="Facilities" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 210px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat2Icon" runat="server" Text="👨‍⚕️" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Title" runat="server" Text="DOCTORS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat2Value" runat="server" Text="456" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat2Unit" runat="server" Text="Available" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat3Icon" runat="server" Text="💊" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Title" runat="server" Text="MEDICINES" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat3Value" runat="server" Text="89%" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat3Unit" runat="server" Text="Stocked" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 630px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat4Icon" runat="server" Text="🚑" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Title" runat="server" Text="EMERGENCY" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat4Value" runat="server" Text="98" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat4Unit" runat="server" Text="Ready" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlFilters" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 220px; width: 820px; height: 80px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFiltersTitle" runat="server" Text="🔍 FILTERS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblSearchLabel" runat="server" Text="Search:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 50px;"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 70px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Search clinic name or location"></asp:TextBox>
            
            <asp:Label ID="lblMedicineLabel" runat="server" Text="Medicines:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 240px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlMedicines" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 240px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All" Value="all"></asp:ListItem>
                <asp:ListItem Text="Available" Value="true"></asp:ListItem>
                <asp:ListItem Text="Not Available" Value="false"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblLocationLabel" runat="server" Text="Location:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 380px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlLocation" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 380px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Locations" Value=""></asp:ListItem>
                <asp:ListItem Text="Downtown" Value="Downtown"></asp:ListItem>
                <asp:ListItem Text="Residential" Value="Residential"></asp:ListItem>
                <asp:ListItem Text="Industrial" Value="Industrial"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Button ID="btnApplyFilter" runat="server" Text="🔍 Apply" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 520px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
            <asp:Button ID="btnClearFilter" runat="server" Text="🔄 Clear" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 600px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlClinicList" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 320px; width: 820px; height: 480px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblListTitle" runat="server" Text="🏥 CLINIC RECORDS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblHeaderClinic" runat="server" Text="Clinic Name" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderDoctors" runat="server" Text="Doctors" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderMedicines" runat="server" Text="Medicines" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderContact" runat="server" Text="Emergency Contact" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderUpdated" runat="server" Text="Updated" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 60px;"></asp:Label>
            
            <asp:Panel ID="pnlClinic1" runat="server" Style="position: absolute; left: 0px; top: 85px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinic1" runat="server" Text="Dire Dawa General Hospital" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation1" runat="server" Text="📍 Downtown" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors1" runat="server" Text="45" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines1" runat="server" Text="✅ Available" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact1" runat="server" Text="+251 911 123 456" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated1" runat="server" Text="2 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView1" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlClinic2" runat="server" Style="position: absolute; left: 0px; top: 155px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinic2" runat="server" Text="Community Health Center" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation2" runat="server" Text="📍 Residential Area" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors2" runat="server" Text="12" Font-Size="14px" ForeColor="#F59E0B" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines2" runat="server" Text="⚠️ Limited" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact2" runat="server" Text="+251 911 789 012" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated2" runat="server" Text="5 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView2" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlClinic3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinic3" runat="server" Text="Industrial Zone Medical Center" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation3" runat="server" Text="📍 Industrial Zone" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors3" runat="server" Text="8" Font-Size="14px" ForeColor="#EF4444" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines3" runat="server" Text="❌ Out of Stock" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact3" runat="server" Text="+251 911 345 678" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated3" runat="server" Text="1 day ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView3" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlClinic4" runat="server" Style="position: absolute; left: 0px; top: 295px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinic4" runat="server" Text="Children's Hospital" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation4" runat="server" Text="📍 Downtown" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors4" runat="server" Text="28" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines4" runat="server" Text="✅ Available" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact4" runat="server" Text="+251 911 234 567" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated4" runat="server" Text="3 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView4" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit4" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete4" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
