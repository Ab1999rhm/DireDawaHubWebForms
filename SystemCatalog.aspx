<%@ Page Title="System Catalog" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SystemCatalog.aspx.cs" Inherits="DDCH.SystemCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .tab-btn {
            background-color: transparent;
            color: #94A3B8;
            border: none;
            border-bottom: 2px solid transparent;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }
        .tab-btn.active {
            color: #3B82F6;
            border-bottom: 2px solid #3B82F6;
        }
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
        .badge-pending {
            background-color: #451A03;
            color: #FCD34D;
            padding: 3px 6px;
            border-radius: 4px;
            font-size: 11px;
        }
        .badge-live {
            background-color: #064E3B;
            color: #6EE7B7;
            padding: 3px 6px;
            border-radius: 4px;
            font-size: 11px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Label ID="lblBreadcrumb" runat="server" Text="Home / Admin / System Catalog" ForeColor="#64748B" Font-Size="12px" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>

        <asp:Label ID="lblHeaderTitle" runat="server" Text="System Catalog Management" Font-Bold="true" Font-Size="22px" ForeColor="White" Style="position: absolute; left: 20px; top: 40px;"></asp:Label>
        
        <asp:Button ID="btnExport" runat="server" Text="Export Data ▼" BackColor="Transparent" ForeColor="#3B82F6" BorderStyle="Solid" BorderColor="#3B82F6" BorderWidth="1px" Style="position: absolute; right: 20px; top: 40px; width: 120px; height: 35px; border-radius: 6px; cursor: pointer;" />

        <asp:Panel ID="pnlTabs" runat="server" BackColor="Transparent" Style="position: absolute; left: 20px; top: 90px; width: 820px; height: 45px; border-bottom: 1px solid #334155;">
            <asp:Button ID="btnTabJobs" runat="server" Text="Jobs (45)" CssClass="tab-btn active" Style="position: absolute; left: 0px; top: 0px; height: 44px;" OnClick="btnTabJobs_Click" />
            <asp:Button ID="btnTabWater" runat="server" Text="Water (12)" CssClass="tab-btn" Style="position: absolute; left: 145px; top: 0px; height: 44px; width: 143px;" OnClick="btnTabWater_Click" />
            <asp:Button ID="btnTabClinics" runat="server" Text="Clinics (8)" CssClass="tab-btn" Style="position: absolute; left: 284px; top: 0px; height: 44px; width: 161px;" OnClick="btnTabClinics_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlJobsContent" runat="server" CssClass="glass-card" Style="position: absolute; left: 20px; top: 150px; width: 820px; height: 500px; border-radius: 8px; padding: 10px; overflow-y: auto;">
            <asp:Panel ID="pnlCatalogHeader" runat="server" BackColor="#1E293B" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblCatHdr" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblTitleHdr" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
                <asp:Label ID="lblStatusHdr" runat="server" Text="Status" Style="position: absolute; left: 450px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold;"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlCatalogRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblCat1" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblTitle1" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 15px; color: #F8FAFC; font-size: 14px; width: 280px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="Pending" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveCat1" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 80px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveCat1_Click" />
                <asp:Button ID="btnPurgeCat1" runat="server" Text="Purge" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnPurgeCat1_Click" />
                <asp:HiddenField ID="hdnCatId1" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlCatalogRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 90px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblCat2" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblTitle2" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 15px; color: #F8FAFC; font-size: 14px; width: 280px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="Pending" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveCat2" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 80px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveCat2_Click" />
                <asp:Button ID="btnPurgeCat2" runat="server" Text="Purge" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnPurgeCat2_Click" />
                <asp:HiddenField ID="hdnCatId2" runat="server" />
            </asp:Panel>
            
            <asp:Panel ID="pnlCatalogRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 140px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblCat3" runat="server" Text="Category" Style="position: absolute; left: 10px; top: 15px; color: #F8FAFC; font-size: 14px;"></asp:Label>
                <asp:Label ID="lblTitle3" runat="server" Text="Title" Style="position: absolute; left: 150px; top: 15px; color: #F8FAFC; font-size: 14px; width: 280px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="Pending" Style="position: absolute; left: 450px; top: 15px; color: #FCD34D; font-size: 12px; background-color: #451A03; padding: 5px 10px; border-radius: 4px;"></asp:Label>
                <asp:Button ID="btnApproveCat3" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 80px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnApproveCat3_Click" />
                <asp:Button ID="btnPurgeCat3" runat="server" Text="Purge" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 10px; top: 10px; padding: 5px 10px; border-radius: 4px; cursor: pointer;" OnClick="btnPurgeCat3_Click" />
                <asp:HiddenField ID="hdnCatId3" runat="server" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlPagination" runat="server" BackColor="#0F172A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 660px; width: 820px; height: 50px; border-radius: 8px;">
            <asp:Label ID="lblPageInfo" runat="server" Text="Page 1 of 5 (45 total)" ForeColor="#94A3B8" Font-Size="12px" Style="position: absolute; left: 20px; top: 18px;"></asp:Label>
            
            <asp:Button ID="btnPrev" runat="server" Text="Prev" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 80px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="btnNext" runat="server" Text="Next" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 10px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
