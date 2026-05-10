<%@ Page Title="Community Posters" Language="C#" MasterPageFile="~/Contributor.Master" AutoEventWireup="true" CodeBehind="CommunityPosters.aspx.cs" Inherits="DDCH.CommunityPosters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        <asp:Label ID="lblBreadcrumb" runat="server" Text="Home / Contributor / Community Posters" ForeColor="#64748B" Font-Size="12px" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>
        <asp:Label ID="lblHeaderTitle" runat="server" Text="Community Posters Data Entry" Font-Bold="true" Font-Size="22px" ForeColor="White" Style="position: absolute; left: 20px; top: 40px;"></asp:Label>

        <!-- Data Entry Form -->
        <asp:Panel ID="pnlEntryForm" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 90px; width: 820px; height: 260px; border-radius: 8px; padding: 20px;">
            <asp:Label ID="lblFormTitle" runat="server" Text="New Submission" Font-Bold="true" ForeColor="White" Font-Size="16px" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
            
            <asp:Label ID="lblPostTitle" runat="server" Text="Title:" ForeColor="#94A3B8" Font-Size="13px" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" BackColor="#0F172A" ForeColor="White" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 80px; width: 780px; padding: 8px; border-radius: 4px;"></asp:TextBox>
            
            <asp:Label ID="lblPostContent" runat="server" Text="Details/Data:" ForeColor="#94A3B8" Font-Size="13px" Style="position: absolute; left: 20px; top: 125px;"></asp:Label>
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="3" BackColor="#0F172A" ForeColor="White" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 145px; width: 780px; padding: 8px; border-radius: 4px; resize: none;"></asp:TextBox>
            
            <asp:Button ID="btnSubmit" runat="server" Text="Submit to Admin for Review" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 220px; padding: 10px 20px; border-radius: 6px; cursor: pointer; font-weight: bold;" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblSuccess" runat="server" ForeColor="#10B981" Visible="false" Style="position: absolute; right: 240px; top: 228px; font-weight: bold;"></asp:Label>
        </asp:Panel>

        <!-- My Recent Submissions -->
        <asp:Panel ID="pnlMyPosts" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 380px; width: 820px; height: 320px; border-radius: 8px; padding: 10px; overflow-y: auto;">
            <asp:Label ID="lblMyPostsTitle" runat="server" Text="My Recent Submissions" Font-Bold="true" ForeColor="White" Font-Size="16px" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
            
            <asp:Panel ID="pnlHeaderRow" runat="server" BackColor="#0F172A" Style="position: absolute; left: 0px; top: 50px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblHdrTitle" runat="server" Text="Post Title" Style="position: absolute; left: 20px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblHdrStatus" runat="server" Text="Status" Style="position: absolute; left: 550px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 90px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblRowTitle1" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 500px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblRowStatus1" runat="server" Text="Pending" Style="position: absolute; left: 550px; top: 20px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnDelete1" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete1_Click" />
                <asp:HiddenField ID="hdnId1" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 150px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblRowTitle2" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 500px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblRowStatus2" runat="server" Text="Pending" Style="position: absolute; left: 550px; top: 20px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnDelete2" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete2_Click" />
                <asp:HiddenField ID="hdnId2" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 210px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblRowTitle3" runat="server" Text="Title" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 500px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblRowStatus3" runat="server" Text="Pending" Style="position: absolute; left: 550px; top: 20px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnDelete3" runat="server" Text="Delete" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 15px; padding: 6px 12px; border-radius: 4px; cursor: pointer;" OnClick="btnDelete3_Click" />
                <asp:HiddenField ID="hdnId3" runat="server" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
