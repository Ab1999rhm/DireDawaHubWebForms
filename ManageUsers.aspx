<%@ Page Title="Identity Registry" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="DDCH.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .table-header {
            color: #94A3B8;
            font-size: 13px;
            font-weight: bold;
            border-bottom: 1px solid #334155;
            padding: 10px;
            text-align: left;
        }
        .table-cell {
            color: #F8FAFC;
            font-size: 14px;
            border-bottom: 1px solid #1E293B;
            padding: 15px 10px;
        }
        .badge-admin {
            background-color: #450A0A;
            color: #FCA5A5;
            border: 1px solid #991B1B;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
        }
        .badge-contrib {
            background-color: #1E3A8A;
            color: #93C5FD;
            border: 1px solid #1E40AF;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
        }
        .badge-pending {
            background-color: #451A03;
            color: #FCD34D;
            border: 1px solid #92400E;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        function CloseModalAndRefresh() {
            window.location.href = window.location.href;
        }
        function CloseModalOnly() {
            document.getElementById('<%= pnlModalOverlay.ClientID %>').style.display = 'none';
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Label ID="lblBreadcrumb" runat="server" Text="Home / Admin / Identity Registry" ForeColor="#64748B" Font-Size="12px" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>

        <asp:Panel ID="pnlHeader" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 40px; width: 820px; height: 100px; border-radius: 8px;">
            <asp:Label ID="lblHeaderTitle" runat="server" Text="Identity & Role Manager" Font-Bold="true" Font-Size="22px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            <asp:Label ID="lblHeaderSub" runat="server" Text="Verify municipal work IDs and authorize contributor credentials." Font-Size="13px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 55px;"></asp:Label>
            
            <asp:Button ID="btnExport" runat="server" Text="Export CSV" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 120px; top: 35px; width: 141px; height: 35px; border-radius: 6px; cursor: pointer;" />
            <asp:Label ID="lblTotalTitle" runat="server" Text="Total Users" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 25px; text-align: right; width: 80px;"></asp:Label>
            <asp:Label ID="lblTotalUsers" runat="server" Text="1,245" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; right: 20px; top: 40px; text-align: right; width: 80px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlFilterBar" runat="server" BackColor="#0F172A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 160px; width: 820px; height: 70px; border-radius: 8px 8px 0px 0px;">
            
            <asp:Label ID="lblSearch" runat="server" Text="Search" Font-Size="11px" ForeColor="#64748B" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" BackColor="#1E293B" ForeColor="White" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 25px; width: 250px; height: 30px; border-radius: 4px; padding-left: 10px;"></asp:TextBox>
            
            <asp:Label ID="lblFilterRole" runat="server" Text="Quick Filters" Font-Size="11px" ForeColor="#64748B" Style="position: absolute; left: 290px; top: 10px;"></asp:Label>
            <asp:DropDownList ID="ddlRoleFilter" runat="server" BackColor="#1E293B" ForeColor="White" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 290px; top: 25px; width: 150px; height: 34px; border-radius: 4px;">
                <asp:ListItem Text="All Users" Value="All"></asp:ListItem>
                <asp:ListItem Text="Admins" Value="Admin"></asp:ListItem>
                <asp:ListItem Text="Contributors" Value="Contributor"></asp:ListItem>
                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblPerPage" runat="server" Text="Per Page" Font-Size="11px" ForeColor="#64748B" Style="position: absolute; left: 460px; top: 10px;"></asp:Label>
            <asp:DropDownList ID="ddlPerPage" runat="server" BackColor="#1E293B" ForeColor="White" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 460px; top: 25px; width: 80px; height: 34px; border-radius: 4px;">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="25" Value="25"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnApplyFilter" runat="server" Text="Apply Filter" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 560px; top: 25px; width: 100px; height: 34px; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="btnClearFilter" runat="server" Text="Clear" BackColor="Transparent" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 670px; top: 25px; width: 80px; height: 34px; border-radius: 4px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlGrid" runat="server" CssClass="glass-card" Style="position: absolute; left: 20px; top: 229px; width: 820px; height: 500px; overflow-y: auto; border-radius: 0px 0px 8px 8px; padding: 10px;">
            <asp:Panel ID="pnlUserHeader" runat="server" BackColor="#1E293B" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblUserEmailHdr" runat="server" Text="Email / Identity" Style="position: absolute; left: 10px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblUserWorkIdHdr" runat="server" Text="Work Verification ID" Style="position: absolute; left: 250px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblUserStatusHdr" runat="server" Text="Auth Status" Style="position: absolute; left: 450px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlUserRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblUserEmail1" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserWorkId1" runat="server" Text="WorkID" Style="position: absolute; left: 250px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserStatus1" runat="server" Text="Pending Approval" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; border: 1px solid #92400E; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveUser1" runat="server" Text="Approve" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 100px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveUser1_Click" />
                <asp:Button ID="btnDeactivateUser1" runat="server" Text="Deactivate" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivateUser1_Click" />
                <asp:HiddenField ID="hdnUserId1" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlUserRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 90px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblUserEmail2" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserWorkId2" runat="server" Text="WorkID" Style="position: absolute; left: 250px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserStatus2" runat="server" Text="Pending Approval" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; border: 1px solid #92400E; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveUser2" runat="server" Text="Approve" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 100px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveUser2_Click" />
                <asp:Button ID="btnDeactivateUser2" runat="server" Text="Deactivate" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivateUser2_Click" />
                <asp:HiddenField ID="hdnUserId2" runat="server" />
            </asp:Panel>
            
            <asp:Panel ID="pnlUserRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 140px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblUserEmail3" runat="server" Text="Email" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserWorkId3" runat="server" Text="WorkID" Style="position: absolute; left: 250px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblUserStatus3" runat="server" Text="Pending Approval" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; border: 1px solid #92400E; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveUser3" runat="server" Text="Approve" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 100px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveUser3_Click" />
                <asp:Button ID="btnDeactivateUser3" runat="server" Text="Deactivate" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivateUser3_Click" />
                <asp:HiddenField ID="hdnUserId3" runat="server" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlPagination" runat="server" BackColor="#0F172A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 740px; width: 820px; height: 50px; border-radius: 8px;">
            <asp:Label ID="lblPageInfo" runat="server" Text="Showing 1 - 10 of 1,245 users" ForeColor="#94A3B8" Font-Size="12px" Style="position: absolute; left: 20px; top: 18px;"></asp:Label>
            
            <asp:Button ID="btnPrev" runat="server" Text="Prev" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 80px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="btnNext" runat="server" Text="Next" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 10px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
        </asp:Panel>

    </asp:Panel>

    <!-- Modal Overlay -->
    <asp:Panel ID="pnlModalOverlay" runat="server" Visible="false" onclick="CloseModalOnly()" Style="position: absolute; top: 0px; left: 0px; width: 1100px; height: 880px; background: rgba(0,0,0,0.6); z-index: 1000; backdrop-filter: blur(5px);">
        <!-- Iframe Modal Box -->
        <iframe id="iframeModal" runat="server" style="position: absolute; top: 250px; left: 350px; width: 350px; height: 300px; border: none; border-radius: 20px; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5); background: transparent;"></iframe>
    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
