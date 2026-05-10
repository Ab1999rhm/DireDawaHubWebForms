<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DDCH.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        :root {
            --admin-primary: #3b82f6;
            --admin-accent: #10b981;
            --admin-dark: #0f172a;
            --glass-bg: rgba(15, 23, 42, 0.75);
            --glass-border: rgba(255, 255, 255, 0.1);
        }
        
        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(15px);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            color: #f8fafc;
        }
        
        .integrity-bar {
            height: 6px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        
        .integrity-fill {
            height: 100%;
            background: var(--admin-primary);
            transition: width 1s ease-in-out;
        }
        
        .alert-input {
            background: rgba(0, 0, 0, 0.2);
            border: 1px solid var(--glass-border);
            color: white;
            border-radius: 10px;
        }
        
        .alert-input:focus {
            background: rgba(0, 0, 0, 0.3);
            color: white;
            border-color: var(--admin-primary);
            box-shadow: none;
        }
        
        .audit-table {
            width: 98%;
            border-collapse: collapse;
            font-size: 13px;
            color: #e2e8f0;
        }
        
        .audit-table th {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: #94a3b8;
        }
        
        .audit-table td {
            padding: 10px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }
        
        .auto-style1 {
            height: 37px;
        }
    </style>
    <script type="text/javascript">
        function CloseModalAndRefresh() {
            // Close modal and refresh the page to update the list
            window.location.href = window.location.href;
        }
        function CloseModalOnly() {
            // Hide the modal overlay without refreshing
            document.getElementById('<%= pnlModalOverlay.ClientID %>').style.display = 'none';
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlDashboardCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 1100px; height: 880px; padding: 20px; top: 0px; left: 0px;">
        
        <asp:Label ID="lblTitle" runat="server" Text="️ HUB COMMAND CENTER" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
        <asp:Label ID="lblSubTitle" runat="server" Text="Global Synchronization & System Governance" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 55px;"></asp:Label>
        
        <asp:Button ID="btnLogout" runat="server" Text="Logout" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; width: 100px;" OnClick="btnLogout_Click" />

        <!-- Stats Row -->
        <asp:Panel ID="pnlStat1" runat="server" CssClass="glass-card" Style="position: absolute; left: 20px; top: 110px; width: 190px; height: 100px; text-align: center;">
            <asp:Label ID="lblStat1Title" runat="server" Text="PENDING USERS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 35px; width: 160px;"></asp:Label>
            <asp:Label ID="lblPendingUsersCount" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#F59E0B" Style="position: absolute; left: 15px; top: 55px; width: 160px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" CssClass="glass-card" Style="position: absolute; left: 230px; top: 110px; width: 190px; height: 100px; text-align: center;">
            <asp:Label ID="lblStat2Title" runat="server" Text="PENDING POSTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 35px; width: 160px;"></asp:Label>
            <asp:Label ID="lblPendingPostsCount" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#F59E0B" Style="position: absolute; left: 15px; top: 55px; width: 160px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" CssClass="glass-card" Style="position: absolute; left: 440px; top: 110px; width: 190px; height: 100px; text-align: center;">
            <asp:Label ID="lblStat3Title" runat="server" Text="ACTIVE POSTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 35px; width: 160px;"></asp:Label>
            <asp:Label ID="lblActivePostsCount" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 55px; width: 160px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" CssClass="glass-card" Style="position: absolute; left: 650px; top: 110px; width: 190px; height: 100px; text-align: center;">
            <asp:Label ID="lblStat4Title" runat="server" Text="ADMIN STATUS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 35px; width: 160px;"></asp:Label>
            <asp:Label ID="lblAdminStatus" runat="server" Text="ONLINE" Font-Size="24px" Font-Bold="true" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 55px; width: 160px;"></asp:Label>
        </asp:Panel>

        <!-- User Management -->
        <asp:Panel ID="pnlUserManagement" runat="server" CssClass="glass-card" Style="position: absolute; left: 20px; top: 230px; width: 820px; height: 250px; padding: 20px; overflow-y: auto;">
            <asp:Label ID="lblUserMgtTitle" runat="server" Text=" Contributor Approval Queue" Font-Bold="true" Font-Size="16px" ForeColor="White"></asp:Label>
            <hr style="border: 0; border-top: 1px solid rgba(255,255,255,0.1); margin: 10px 0;" />
            <asp:Panel ID="pnlUserHeader" runat="server" BackColor="#0F172A" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 30px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblUserEmailHdr" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 5px; color: #94A3B8; font-size: 12px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblUserWorkIdHdr" runat="server" Text="Work ID" Style="position: absolute; left: 250px; top: 5px; color: #94A3B8; font-size: 12px; font-weight: bold;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlUserRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 70px; width: 820px; height: 40px; border-bottom: 1px solid rgba(255,255,255,0.05);">
                <asp:Label ID="lblUserEmail1" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblUserWorkId1" runat="server" Text="WorkID" Style="position: absolute; left: 250px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Button ID="btnApproveUser1" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 153px; top: 2px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveUser1_Click" />
                <asp:Button ID="btnRejectUser1" runat="server" Text="Reject" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnRejectUser1_Click" />
                <asp:HiddenField ID="hdnUserId1" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlUserRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 110px; width: 820px; height: 40px; border-bottom: 1px solid rgba(255,255,255,0.05);">
                <asp:Label ID="lblUserEmail2" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblUserWorkId2" runat="server" Text="WorkID" Style="position: absolute; left: 250px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Button ID="btnApproveUser2" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 154px; top: 4px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveUser2_Click" />
                <asp:Button ID="btnRejectUser2" runat="server" Text="Reject" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnRejectUser2_Click" />
                <asp:HiddenField ID="hdnUserId2" runat="server" />
            </asp:Panel>
        </asp:Panel>

        <!-- Post Management -->
        <asp:Panel ID="pnlPostManagement" runat="server" CssClass="glass-card" Style="position: absolute; left: 20px; top: 500px; width: 820px; height: 350px; padding: 20px; overflow-y: auto;">
            <asp:Label ID="lblPostMgtTitle" runat="server" Text=" Content Moderation Queue" Font-Bold="true" Font-Size="16px" ForeColor="White"></asp:Label>
            <hr style="border: 0; border-top: 1px solid rgba(255,255,255,0.1); margin: 10px 0;" />
            <asp:Panel ID="pnlPostHeader" runat="server" BackColor="#0F172A" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 30px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblPostCatHdr" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 5px; color: #94A3B8; font-size: 12px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblPostTitleHdr" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 5px; color: #94A3B8; font-size: 12px; font-weight: bold;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlPostRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 70px; width: 820px; height: 40px; border-bottom: 1px solid rgba(255,255,255,0.05);">
                <asp:Label ID="lblPostCat1" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblPostTitle1" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Button ID="btnApprovePost1" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 80px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApprovePost1_Click" />
                <asp:Button ID="btnRejectPost1" runat="server" Text="Reject" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnRejectPost1_Click" />
                <asp:HiddenField ID="hdnPostId1" runat="server" />
            </asp:Panel>
            
            <asp:Panel ID="pnlPostRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 110px; width: 820px; height: 40px; border-bottom: 1px solid rgba(255,255,255,0.05);">
                <asp:Label ID="lblPostCat2" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblPostTitle2" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 10px; color: white; font-size: 13px;"></asp:Label>
                <asp:Button ID="btnApprovePost2" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 80px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApprovePost2_Click" />
                <asp:Button ID="btnRejectPost2" runat="server" Text="Reject" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 5px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnRejectPost2_Click" />
                <asp:HiddenField ID="hdnPostId2" runat="server" />
            </asp:Panel>
        </asp:Panel>
        
        <!-- Modal Overlay -->
        <asp:Panel ID="pnlModalOverlay" runat="server" Visible="false" Style="position: absolute; top: 0px; left: 0px; width: 1100px; height: 880px; background: rgba(0,0,0,0.6); z-index: 1000; backdrop-filter: blur(5px);">
            <!-- Iframe Modal Box -->
            <iframe id="iframeModal" runat="server" style="border-style: none; border-color: inherit; border-width: medium; position: absolute; top: 229px; left: 118px; width: 592px; height: 311px; border-radius: 20px; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5); background: transparent;"></iframe>
        </asp:Panel>

    </asp:Panel>
</asp:Content>

