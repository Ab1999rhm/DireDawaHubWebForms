<%@ Page Title="Water Tracker Moderation" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminWaterTracker.aspx.cs" Inherits="DDCH.AdminWaterTracker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        <asp:Label ID="lblBreadcrumb" runat="server" Text="Home / Admin / Water Tracker Moderation" ForeColor="#64748B" Font-Size="12px" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>
        <asp:Label ID="lblHeaderTitle" runat="server" Text="[WT] Water Tracker Moderation" Font-Bold="true" Font-Size="22px" ForeColor="White" Style="position: absolute; left: 20px; top: 40px;"></asp:Label>

        <asp:Panel ID="pnlContent" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 100px; width: 820px; height: 600px; border-radius: 8px; padding: 10px; overflow-y: auto;">
            
            <asp:Panel ID="pnlHeaderRow" runat="server" BackColor="#0F172A" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblHdrTitle" runat="server" Text="Post Title" Style="position: absolute; left: 20px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblHdrStatus" runat="server" Text="Status" Style="position: absolute; left: 450px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblTitle1" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="Pending" Style="position: absolute; left: 337px; top: 19px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApprove1" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 260px; top: 11px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnApprove1_Click" />
                <asp:Button ID="btnDeactivate1" runat="server" Text="Deactivate" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 70px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivate1_Click" />
                <asp:Button ID="btnDelete1" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete1_Click" />
                <asp:HiddenField ID="hdnId1" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblTitle2" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="Pending" Style="position: absolute; left: 450px; top: 20px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApprove2" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnApprove2_Click" />
                <asp:Button ID="btnDeactivate2" runat="server" Text="Deactivate" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 70px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivate2_Click" />
                <asp:Button ID="btnDelete2" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete2_Click" />
                <asp:HiddenField ID="hdnId2" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 160px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblTitle3" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="Pending" Style="position: absolute; left: 450px; top: 20px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApprove3" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnApprove3_Click" />
                <asp:Button ID="btnDeactivate3" runat="server" Text="Deactivate" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 70px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDeactivate3_Click" />
                <asp:Button ID="btnDelete3" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete3_Click" />
                <asp:HiddenField ID="hdnId3" runat="server" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
