<%@ Page Title="Emergency Broadcast" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlEmergencyCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="🚨 EMERGENCY BROADCAST" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Send critical alerts to all system users" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnRefresh" runat="server" Text="🔄 Refresh" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
            <asp:Button ID="btnTestBroadcast" runat="server" Text="📡 Test" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlStats" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 120px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStatsTitle" runat="server" Text="📊 BROADCAST STATISTICS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Panel ID="pnlStat1" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 60px; width: 180px; height: 40px; border-radius: 12px;">
                <asp:Label ID="lblStat1Icon" runat="server" Text="🚨" Font-Size="20px" Style="position: absolute; left: 10px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat1Value" runat="server" Text="3" Font-Size="20px" Font-Bold="true" ForeColor="#EF4444" Style="position: absolute; left: 50px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat1Label" runat="server" Text="Active Alerts" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 50px; top: 25px;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlStat2" runat="server" BackColor="#1E293B" Style="position: absolute; left: 220px; top: 60px; width: 180px; height: 40px; border-radius: 12px;">
                <asp:Label ID="lblStat2Icon" runat="server" Text="👥" Font-Size="20px" Style="position: absolute; left: 10px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat2Value" runat="server" Text="1,247" Font-Size="20px" Font-Bold="true" ForeColor="#10B981" Style="position: absolute; left: 50px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat2Label" runat="server" Text="Total Users" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 50px; top: 25px;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlStat3" runat="server" BackColor="#1E293B" Style="position: absolute; left: 420px; top: 60px; width: 180px; height: 40px; border-radius: 12px;">
                <asp:Label ID="lblStat3Icon" runat="server" Text="✅" Font-Size="20px" Style="position: absolute; left: 10px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat3Value" runat="server" Text="892" Font-Size="20px" Font-Bold="true" ForeColor="#10B981" Style="position: absolute; left: 50px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat3Label" runat="server" Text="Acknowledged" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 50px; top: 25px;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlStat4" runat="server" BackColor="#1E293B" Style="position: absolute; left: 620px; top: 60px; width: 180px; height: 40px; border-radius: 12px;">
                <asp:Label ID="lblStat4Icon" runat="server" Text="📤" Font-Size="20px" Style="position: absolute; left: 10px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat4Value" runat="server" Text="5" Font-Size="20px" Font-Bold="true" ForeColor="#3B82F6" Style="position: absolute; left: 50px; top: 8px;"></asp:Label>
                <asp:Label ID="lblStat4Label" runat="server" Text="Sent Today" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 50px; top: 25px;"></asp:Label>
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlNewBroadcast" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 240px; width: 400px; height: 280px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblNewTitle" runat="server" Text="📡 SEND NEW BROADCAST" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblMessageLabel" runat="server" Text="Emergency Message:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 80px; width: 360px; height: 80px; padding: 8px; border-radius: 8px;" TextMode="MultiLine" placeholder="Enter emergency message..."></asp:TextBox>
            
            <asp:Label ID="lblSeverityLabel" runat="server" Text="Severity Level:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 170px;"></asp:Label>
            <asp:DropDownList ID="ddlSeverity" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 190px; width: 360px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                <asp:ListItem Text="Warning" Value="Warning"></asp:ListItem>
                <asp:ListItem Text="Info" Value="Info"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblExpiryLabel" runat="server" Text="Expires At:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 230px;"></asp:Label>
            <asp:TextBox ID="txtExpiresAt" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 250px; width: 360px; padding: 8px; border-radius: 8px;" Text="2024-05-07 23:59"></asp:TextBox>
            
            <asp:Button ID="btnSendBroadcast" runat="server" Text="🚨 SEND BROADCAST" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 290px; width: 360px; height: 30px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

        <asp:Panel ID="pnlActiveBroadcasts" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 240px; width: 400px; height: 280px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblActiveTitle" runat="server" Text="🚨 ACTIVE BROADCASTS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Panel ID="pnlBroadcast1" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 60px; width: 360px; height: 80px; border-radius: 12px;">
                <asp:Label ID="lblBroadcast1Severity" runat="server" Text="🚨 CRITICAL" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 10px; top: 10px; padding: 4px 8px; border-radius: 6px; font-size: 10px;"></asp:Label>
                <asp:Label ID="lblBroadcast1Message" runat="server" Text="Water supply disruption in downtown area" Font-Size="12px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 10px; top: 30px;"></asp:Label>
                <asp:Label ID="lblBroadcast1Time" runat="server" Text="Sent: 2024-05-06 14:32" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 10px; top: 50px;"></asp:Label>
                <asp:Label ID="lblBroadcast1Expiry" runat="server" Text="Expires: 2024-05-07 14:32" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 10px; top: 65px;"></asp:Label>
                
                <asp:Button ID="btnDeactivate1" runat="server" Text="🛑 Deactivate" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 50px; width: 80px; height: 20px; border-radius: 6px; cursor: pointer; font-size: 10px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlBroadcast2" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 150px; width: 360px; height: 80px; border-radius: 12px;">
                <asp:Label ID="lblBroadcast2Severity" runat="server" Text="⚠️ WARNING" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 10px; top: 10px; padding: 4px 8px; border-radius: 6px; font-size: 10px;"></asp:Label>
                <asp:Label ID="lblBroadcast2Message" runat="server" Text="Traffic congestion on main highway" Font-Size="12px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 10px; top: 30px;"></asp:Label>
                <asp:Label ID="lblBroadcast2Time" runat="server" Text="Sent: 2024-05-06 10:15" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 10px; top: 50px;"></asp:Label>
                <asp:Label ID="lblBroadcast2Expiry" runat="server" Text="Expires: 2024-05-06 22:15" Font-Size="10px" ForeColor="#94A3B8" Style="position: absolute; left: 10px; top: 65px;"></asp:Label>
                
                <asp:Button ID="btnDeactivate2" runat="server" Text="🛑 Deactivate" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 50px; width: 80px; height: 20px; border-radius: 6px; cursor: pointer; font-size: 10px;" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlHistory" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 540px; width: 820px; height: 280px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblHistoryTitle" runat="server" Text="📜 BROADCAST HISTORY" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblHeaderSeverity" runat="server" Text="Severity" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderMessage" runat="server" Text="Message" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 100px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderSent" runat="server" Text="Sent At" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderAck" runat="server" Text="Acknowledged" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 520px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderStatus" runat="server" Text="Status" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 60px;"></asp:Label>
            
            <asp:Panel ID="pnlHistory1" runat="server" Style="position: absolute; left: 0px; top: 85px; width: 820px; height: 40px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblHistory1Severity" runat="server" Text="🚨" Font-Size="16px" Style="position: absolute; left: 20px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory1Message" runat="server" Text="Emergency maintenance scheduled for water system" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 100px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory1Sent" runat="server" Text="2024-05-05 16:45" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory1Ack" runat="server" Text="1,247/1,247" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 520px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory1Status" runat="server" Text="✅ Completed" BackColor="#10B981" ForeColor="White" Style="position: absolute; right: 20px; top: 8px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlHistory2" runat="server" Style="position: absolute; left: 0px; top: 125px; width: 820px; height: 40px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblHistory2Severity" runat="server" Text="⚠️" Font-Size="16px" Style="position: absolute; left: 20px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory2Message" runat="server" Text="Weather alert: Heavy rainfall expected" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 100px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory2Sent" runat="server" Text="2024-05-04 09:30" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory2Ack" runat="server" Text="1,234/1,247" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 520px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory2Status" runat="server" Text="✅ Completed" BackColor="#10B981" ForeColor="White" Style="position: absolute; right: 20px; top: 8px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlHistory3" runat="server" Style="position: absolute; left: 0px; top: 165px; width: 820px; height: 40px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblHistory3Severity" runat="server" Text="ℹ️" Font-Size="16px" Style="position: absolute; left: 20px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory3Message" runat="server" Text="Community health fair this weekend" Font-Size="12px" ForeColor="White" Style="position: absolute; left: 100px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory3Sent" runat="server" Text="2024-05-03 14:20" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory3Ack" runat="server" Text="856/1,247" Font-Size="12px" ForeColor="#F59E0B" Style="position: absolute; left: 520px; top: 12px;"></asp:Label>
                <asp:Label ID="lblHistory3Status" runat="server" Text="✅ Completed" BackColor="#10B981" ForeColor="White" Style="position: absolute; right: 20px; top: 8px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
            </asp:Panel>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
