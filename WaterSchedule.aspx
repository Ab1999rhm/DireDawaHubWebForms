<%@ Page Title="Water Schedule Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlWaterCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="💧 WATER SCHEDULE MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Create and manage water supply schedules" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddSchedule" runat="server" Text="➕ Add New Schedule" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

        <asp:Panel ID="pnlMySchedules" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 320px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblMySchedulesTitle" runat="server" Text="📅 MY WATER SCHEDULES" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            <asp:Label ID="lblScheduleCount" runat="server" Text="3 active schedules" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 45px;"></asp:Label>
            
            <asp:Label ID="lblHeaderLocation" runat="server" Text="Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderTime" runat="server" Text="Schedule Time" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderDuration" runat="server" Text="Duration" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 350px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderStatus" runat="server" Text="Status" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 80px;"></asp:Label>
            
            <asp:Panel ID="pnlSchedule1" runat="server" Style="position: absolute; left: 0px; top: 105px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation1" runat="server" Text="Downtown District" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblTime1" runat="server" Text="06:00 - 10:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration1" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="🟢 Active" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlSchedule2" runat="server" Style="position: absolute; left: 0px; top: 165px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation2" runat="server" Text="Residential Area B" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblTime2" runat="server" Text="14:00 - 18:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration2" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="⏰ Scheduled" BackColor="#3B82F6" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlSchedule3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblLocation3" runat="server" Text="Industrial Zone" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblTime3" runat="server" Text="22:00 - 02:00" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDuration3" runat="server" Text="4 hours" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 350px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="🟢 Active" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 450px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 440px; width: 820px; height: 380px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFormTitle" runat="server" Text="📝 ADD NEW SCHEDULE" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblLocationLabel" runat="server" Text="Location:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 80px; width: 360px; padding: 8px; border-radius: 8px;" placeholder="Enter location name"></asp:TextBox>
            
            <asp:Label ID="lblZoneLabel" runat="server" Text="Zone:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 60px;"></asp:Label>
            <asp:DropDownList ID="ddlZone" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 400px; top: 80px; width: 200px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Select Zone" Value=""></asp:ListItem>
                <asp:ListItem Text="Zone A" Value="Zone A"></asp:ListItem>
                <asp:ListItem Text="Zone B" Value="Zone B"></asp:ListItem>
                <asp:ListItem Text="Zone C" Value="Zone C"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblStartTimeLabel" runat="server" Text="Start Time:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtStartTime" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" Text="06:00"></asp:TextBox>
            
            <asp:Label ID="lblEndTimeLabel" runat="server" Text="End Time:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtEndTime" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 220px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" Text="10:00"></asp:TextBox>
            
            <asp:Label ID="lblStatusLabel" runat="server" Text="Status:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 420px; top: 130px;"></asp:Label>
            <asp:DropDownList ID="ddlStatus" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 420px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Scheduled" Value="Scheduled"></asp:ListItem>
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Delayed" Value="Delayed"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblNotesLabel" runat="server" Text="Notes:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 200px;"></asp:Label>
            <asp:TextBox ID="txtNotes" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 220px; width: 580px; height: 80px; padding: 8px; border-radius: 8px;" TextMode="MultiLine" placeholder="Enter any additional notes or notifications..."></asp:TextBox>
            
            <asp:Button ID="btnSave" runat="server" Text="💾 Save Schedule" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 320px; width: 150px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnCancel" runat="server" Text="❌ Cancel" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 190px; top: 320px; width: 100px; height: 35px; border-radius: 10px; cursor: pointer;" />
            <asp:Button ID="btnNotify" runat="server" Text="📢 Send Notification" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 320px; width: 180px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
