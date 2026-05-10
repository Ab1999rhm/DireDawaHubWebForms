<%@ Page Title="Water Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlWaterCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="💧 WATER MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Manage water supply schedules and distribution" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddSchedule" runat="server" Text="➕ Add Schedule" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnExport" runat="server" Text="📊 Export" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlStat1" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat1Icon" runat="server" Text="📅" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Title" runat="server" Text="TOTAL SCHEDULES" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat1Value" runat="server" Text="8,432" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat1Unit" runat="server" Text="Records" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 210px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat2Icon" runat="server" Text="🟢" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Title" runat="server" Text="ACTIVE" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat2Value" runat="server" Text="156" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat2Unit" runat="server" Text="Currently Running" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat3Icon" runat="server" Text="⏰" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Title" runat="server" Text="DELAYED" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat3Value" runat="server" Text="23" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat3Unit" runat="server" Text="Need Attention" Font-Size="12px" ForeColor="#F59E0B" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 630px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat4Icon" runat="server" Text="📍" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Title" runat="server" Text="ZONES" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat4Value" runat="server" Text="12" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat4Unit" runat="server" Text="Coverage Areas" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlFilters" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 220px; width: 820px; height: 80px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFiltersTitle" runat="server" Text="🔍 FILTERS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblSearchLabel" runat="server" Text="Search:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 50px;"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 70px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Search by location or zone"></asp:TextBox>
            
            <asp:Label ID="lblStatusLabel" runat="server" Text="Status:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 240px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlStatus" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 240px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All" Value="all"></asp:ListItem>
                <asp:ListItem Text="Scheduled" Value="scheduled"></asp:ListItem>
                <asp:ListItem Text="Active" Value="active"></asp:ListItem>
                <asp:ListItem Text="Delayed" Value="delayed"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblZoneLabel" runat="server" Text="Zone:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 380px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlZone" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 380px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Zones" Value=""></asp:ListItem>
                <asp:ListItem Text="Zone A" Value="Zone A"></asp:ListItem>
                <asp:ListItem Text="Zone B" Value="Zone B"></asp:ListItem>
                <asp:ListItem Text="Zone C" Value="Zone C"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblDateLabel" runat="server" Text="Date:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 520px; top: 50px;"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 520px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;" Text="2024-05-06"></asp:TextBox>
            
            <asp:Button ID="btnApplyFilter" runat="server" Text="🔍 Apply" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 660px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
            <asp:Button ID="btnClearFilter" runat="server" Text="🔄 Clear" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 740px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlScheduleList" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 320px; width: 820px; height: 480px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblListTitle" runat="server" Text="💧 WATER SCHEDULES" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblHeaderLocation" runat="server" Text="Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderZone" runat="server" Text="Zone" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 150px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderTime" runat="server" Text="Schedule Time" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderDuration" runat="server" Text="Duration" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 350px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderStatus" runat="server" Text="Status" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderUpdated" runat="server" Text="Updated" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 60px;"></asp:Label>
            
            <asp:Panel ID="pnlSchedule1" runat="server" Style="position: absolute; left: 0px; top: 85px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation1" runat="server" Text="Downtown District" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblZone1" runat="server" Text="Zone A" BackColor="#1E293B" ForeColor="#60A5FA" Style="position: absolute; left: 150px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblTime1" runat="server" Text="06:00 - 10:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration1" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="🟢 Active" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblUpdated1" runat="server" Text="2 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView1" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlSchedule2" runat="server" Style="position: absolute; left: 0px; top: 155px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation2" runat="server" Text="Residential Area B" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblZone2" runat="server" Text="Zone B" BackColor="#1E293B" ForeColor="#F59E0B" Style="position: absolute; left: 150px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblTime2" runat="server" Text="14:00 - 18:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration2" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="⏰ Delayed" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblUpdated2" runat="server" Text="5 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView2" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlSchedule3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation3" runat="server" Text="Industrial Zone" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblZone3" runat="server" Text="Zone C" BackColor="#1E293B" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblTime3" runat="server" Text="22:00 - 02:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration3" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="📅 Scheduled" BackColor="#3B82F6" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblUpdated3" runat="server" Text="1 day ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnView3" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
