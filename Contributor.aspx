<%@ Page Title="Contributor Dashboard" Language="C#" MasterPageFile="~/Contributor.Master" AutoEventWireup="true" CodeBehind="Contributor.aspx.cs" Inherits="DDCH.ContributorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlContributorCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 900px; padding: 20px;">
        
        <asp:Label ID="lblTitle" runat="server" Text="Contributor Workspace" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
        <asp:Label ID="lblSubTitle" runat="server" Text="Data Management and Content Creation Hub" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 55px;"></asp:Label>

        <!-- Quick Stats -->
        <asp:Panel ID="pnlStat1" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 100px; width: 185px; height: 90px; border-radius: 8px;">
            <asp:Label ID="lblStat1Title" runat="server" Text="TOTAL POSTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Value" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 40px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 220px; top: 100px; width: 185px; height: 90px; border-radius: 8px;">
            <asp:Label ID="lblStat2Title" runat="server" Text="APPROVED" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Value" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 40px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 100px; width: 185px; height: 90px; border-radius: 8px;">
            <asp:Label ID="lblStat3Title" runat="server" Text="PENDING" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Value" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#FCD34D" Style="position: absolute; left: 15px; top: 40px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 620px; top: 100px; width: 200px; height: 90px; border-radius: 8px;">
            <asp:Label ID="lblStat4Title" runat="server" Text="DEACTIVATED" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Value" runat="server" Text="0" Font-Size="28px" Font-Bold="true" ForeColor="#EF4444" Style="position: absolute; left: 15px; top: 40px;"></asp:Label>
        </asp:Panel>

        <!-- Quick Action Buttons -->
        <asp:Panel ID="pnlQuickActions" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 210px; width: 820px; height: 80px; border-radius: 8px;">
            <asp:Label ID="lblQATitle" runat="server" Text="Quick Actions" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 10px; font-size: 13px;"></asp:Label>
            <asp:HyperLink ID="lnkGoPosters" runat="server" NavigateUrl="~/CommunityPosters.aspx" ForeColor="White" BackColor="#1D4ED8" Style="position: absolute; left: 20px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Posters</asp:HyperLink>
            <asp:HyperLink ID="lnkGoWater" runat="server" NavigateUrl="~/WaterTracker.aspx" ForeColor="White" BackColor="#0F766E" Style="position: absolute; left: 100px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Water</asp:HyperLink>
            <asp:HyperLink ID="lnkGoHealth" runat="server" NavigateUrl="~/HealthDirectory.aspx" ForeColor="White" BackColor="#065F46" Style="position: absolute; left: 175px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Health</asp:HyperLink>
            <asp:HyperLink ID="lnkGoJobs" runat="server" NavigateUrl="~/JobBoard.aspx" ForeColor="White" BackColor="#6D28D9" Style="position: absolute; left: 253px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Jobs</asp:HyperLink>
            <asp:HyperLink ID="lnkGoAgri" runat="server" NavigateUrl="~/Agriculture.aspx" ForeColor="White" BackColor="#92400E" Style="position: absolute; left: 315px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Agriculture</asp:HyperLink>
            <asp:HyperLink ID="lnkGoSafety" runat="server" NavigateUrl="~/PublicSafety.aspx" ForeColor="White" BackColor="#991B1B" Style="position: absolute; left: 410px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Safety</asp:HyperLink>
            <asp:HyperLink ID="lnkGoStats" runat="server" NavigateUrl="~/Statistics.aspx" ForeColor="White" BackColor="#1E40AF" Style="position: absolute; left: 492px; top: 30px; padding: 8px 12px; border-radius: 6px; font-size: 12px; text-decoration: none; font-weight: bold;">Statistics</asp:HyperLink>
        </asp:Panel>

        <!-- Recent Activities Panel (Designer-Safe Manual Rows) -->
        <asp:Panel ID="pnlRecentActivities" runat="server" BackColor="#1E293B" Style="position: absolute; left: 20px; top: 315px; width: 820px; height: 545px; border-radius: 8px; overflow-y: auto;">
            <asp:Label ID="lblRecentTitle" runat="server" Text="Recent Activities" Font-Bold="true" ForeColor="White" Font-Size="18px" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Panel ID="pnlHdrRow" runat="server" BackColor="#0F172A" Style="position: absolute; left: 0px; top: 55px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblHdrTitle" runat="server" Text="Post Title" Style="position: absolute; left: 20px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblHdrCategory" runat="server" Text="Category" Style="position: absolute; left: 400px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblHdrStatus" runat="server" Text="Status" Style="position: absolute; left: 600px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
            </asp:Panel>

            <!-- Row 1 -->
            <asp:Panel ID="pnlActRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 95px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblActTitle1" runat="server" Text="" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 360px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblActCategory1" runat="server" Text="" Style="position: absolute; left: 400px; top: 20px; color: #94A3B8; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblActStatus1" runat="server" Text="" Style="position: absolute; left: 600px; top: 15px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
            </asp:Panel>

            <!-- Row 2 -->
            <asp:Panel ID="pnlActRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 155px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblActTitle2" runat="server" Text="" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 360px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblActCategory2" runat="server" Text="" Style="position: absolute; left: 400px; top: 20px; color: #94A3B8; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblActStatus2" runat="server" Text="" Style="position: absolute; left: 600px; top: 15px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
            </asp:Panel>

            <!-- Row 3 -->
            <asp:Panel ID="pnlActRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 215px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblActTitle3" runat="server" Text="" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 360px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblActCategory3" runat="server" Text="" Style="position: absolute; left: 400px; top: 20px; color: #94A3B8; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblActStatus3" runat="server" Text="" Style="position: absolute; left: 600px; top: 15px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
            </asp:Panel>

            <!-- Row 4 -->
            <asp:Panel ID="pnlActRow4" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 275px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblActTitle4" runat="server" Text="" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 360px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblActCategory4" runat="server" Text="" Style="position: absolute; left: 400px; top: 20px; color: #94A3B8; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblActStatus4" runat="server" Text="" Style="position: absolute; left: 600px; top: 15px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
            </asp:Panel>

            <!-- Row 5 -->
            <asp:Panel ID="pnlActRow5" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 335px; width: 820px; height: 60px; border-bottom: 1px solid #0F172A;">
                <asp:Label ID="lblActTitle5" runat="server" Text="" Style="position: absolute; left: 20px; top: 20px; color: #F8FAFC; font-size: 14px; width: 360px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblActCategory5" runat="server" Text="" Style="position: absolute; left: 400px; top: 20px; color: #94A3B8; font-size: 13px;"></asp:Label>
                <asp:Label ID="lblActStatus5" runat="server" Text="" Style="position: absolute; left: 600px; top: 15px; font-size: 12px; padding: 4px 8px; border-radius: 4px;"></asp:Label>
            </asp:Panel>

            <asp:Label ID="lblNoActivity" runat="server" Text="No activity yet. Start by submitting a post using the sidebar links above!" ForeColor="#64748B" Font-Size="14px" Visible="false" Style="position: absolute; left: 20px; top: 120px;"></asp:Label>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>

