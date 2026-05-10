<%@ Page Title="Audit Logs" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AuditLogs.aspx.cs" Inherits="DDCH.AuditLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .table-header {
            color: #94A3B8;
            font-size: 13px;
            font-weight: bold;
            border-bottom: 1px solid #334155;
            padding: 10px;
            text-align: left;
            text-transform: uppercase;
        }
        .table-cell {
            color: #F8FAFC;
            font-size: 14px;
            border-bottom: 1px solid #1E293B;
            padding: 15px 10px;
        }
        .time-group-header {
            background-color: #1E293B;
            color: #E2E8F0;
            font-weight: bold;
            padding: 10px;
            font-size: 14px;
            border-bottom: 1px solid #334155;
        }
        .badge-info {
            background-color: #1E3A8A;
            color: #93C5FD;
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }
        .badge-warning {
            background-color: #451A03;
            color: #FCD34D;
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }
        .badge-critical {
            background-color: #450A0A;
            color: #FCA5A5;
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlCanvas" runat="server" BackColor="#0F172A" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Label ID="lblBreadcrumb" runat="server" Text="Home / Admin / Audit Logs" ForeColor="#64748B" Font-Size="12px" Style="position: absolute; left: 20px; top: 10px;"></asp:Label>

        <asp:Label ID="lblHeaderTitle" runat="server" Text="Security Audit Logs" Font-Bold="true" Font-Size="22px" ForeColor="White" Style="position: absolute; left: 20px; top: 40px;"></asp:Label>
        <asp:Label ID="lblHeaderDesc" runat="server" Text="Complete record of all administrative actions and system events" ForeColor="#94A3B8" Font-Size="13px" Style="position: absolute; left: 20px; top: 75px;"></asp:Label>
        
        <asp:Button ID="btnExport" runat="server" Text="Export CSV" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 40px; width: 157px; height: 35px; border-radius: 6px; cursor: pointer;" />

        <asp:Panel ID="pnlStat1" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 110px; width: 190px; height: 80px; border-radius: 8px;">
            <asp:Label ID="lblStat1Value" runat="server" Text="1,420" Font-Size="24px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Title" runat="server" Text="TOTAL EVENTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 50px;"></asp:Label>
        </asp:Panel>
        
        <asp:Panel ID="pnlStat2" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 230px; top: 110px; width: 190px; height: 80px; border-radius: 8px;">
            <asp:Label ID="lblStat2Value" runat="server" Text="1,350" Font-Size="24px" Font-Bold="true" ForeColor="#60A5FA" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Title" runat="server" Text="INFO EVENTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 50px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 440px; top: 110px; width: 190px; height: 80px; border-radius: 8px;">
            <asp:Label ID="lblStat3Value" runat="server" Text="45" Font-Size="24px" Font-Bold="true" ForeColor="#FBBF24" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Title" runat="server" Text="WARNINGS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 50px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#1E293B" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 650px; top: 110px; width: 190px; height: 80px; border-radius: 8px;">
            <asp:Label ID="lblStat4Value" runat="server" Text="25" Font-Size="24px" Font-Bold="true" ForeColor="#F87171" Style="position: absolute; left: 15px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Title" runat="server" Text="CRITICAL" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 50px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlGrid" runat="server" BackColor="#0F172A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 210px; width: 820px; height: 500px; overflow-y: auto; border-radius: 8px;">
            
            <asp:Panel ID="pnlHeaderRow" runat="server" BackColor="#1E293B" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 40px; border-bottom: 1px solid #334155;">
                <asp:Label ID="lblHeaderTimestamp" runat="server" Text="Timestamp" Style="position: absolute; left: 10px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
                <asp:Label ID="lblHeaderAction" runat="server" Text="Action" Style="position: absolute; left: 160px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
                <asp:Label ID="lblHeaderDescription" runat="server" Text="Description" Style="position: absolute; left: 280px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
                <asp:Label ID="lblHeaderPerformedBy" runat="server" Text="Performed By" Style="position: absolute; left: 560px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
                <asp:Label ID="lblHeaderTarget" runat="server" Text="Target" Style="position: absolute; left: 680px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
                <asp:Label ID="lblHeaderSeverity" runat="server" Text="Severity" Style="position: absolute; left: 740px; top: 10px; color: #94A3B8; font-size: 13px; font-weight: bold; text-transform: uppercase;" />
            </asp:Panel>

            <asp:Panel ID="pnlRow1" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 40px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblTimestamp1" runat="server" Text="" Style="position: absolute; left: 10px; top: 15px; color: #94A3B8; font-size: 12px; font-family: Consolas, monospace;" />
                <asp:Label ID="lblAction1" runat="server" Text="" Style="position: absolute; left: 160px; top: 15px; color: #F8FAFC; font-size: 14px; font-weight: bold;" />
                <asp:Label ID="lblDescription1" runat="server" Text="" Style="position: absolute; left: 280px; top: 15px; color: #F8FAFC; font-size: 14px; width: 260px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" />
                <asp:Label ID="lblPerformedBy1" runat="server" Text="" Style="position: absolute; left: 560px; top: 15px; color: #F8FAFC; font-size: 13px;" />
                <asp:Label ID="lblTarget1" runat="server" Text="" Style="position: absolute; left: 680px; top: 15px; color: #F8FAFC; font-size: 11px; background: #334155; padding: 2px 5px; border-radius: 4px;" />
                <asp:Label ID="lblSeverity1" runat="server" Text="" Style="position: absolute; left: 740px; top: 12px; padding: 4px 8px; border-radius: 20px; font-size: 11px; font-weight: bold;" />
            </asp:Panel>

            <asp:Panel ID="pnlRow2" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 90px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblTimestamp2" runat="server" Text="" Style="position: absolute; left: 10px; top: 15px; color: #94A3B8; font-size: 12px; font-family: Consolas, monospace;" />
                <asp:Label ID="lblAction2" runat="server" Text="" Style="position: absolute; left: 160px; top: 15px; color: #F8FAFC; font-size: 14px; font-weight: bold;" />
                <asp:Label ID="lblDescription2" runat="server" Text="" Style="position: absolute; left: 280px; top: 15px; color: #F8FAFC; font-size: 14px; width: 260px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" />
                <asp:Label ID="lblPerformedBy2" runat="server" Text="" Style="position: absolute; left: 560px; top: 15px; color: #F8FAFC; font-size: 13px;" />
                <asp:Label ID="lblTarget2" runat="server" Text="" Style="position: absolute; left: 680px; top: 15px; color: #F8FAFC; font-size: 11px; background: #334155; padding: 2px 5px; border-radius: 4px;" />
                <asp:Label ID="lblSeverity2" runat="server" Text="" Style="position: absolute; left: 740px; top: 12px; padding: 4px 8px; border-radius: 20px; font-size: 11px; font-weight: bold;" />
            </asp:Panel>

            <asp:Panel ID="pnlRow3" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 140px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblTimestamp3" runat="server" Text="" Style="position: absolute; left: 10px; top: 15px; color: #94A3B8; font-size: 12px; font-family: Consolas, monospace;" />
                <asp:Label ID="lblAction3" runat="server" Text="" Style="position: absolute; left: 160px; top: 15px; color: #F8FAFC; font-size: 14px; font-weight: bold;" />
                <asp:Label ID="lblDescription3" runat="server" Text="" Style="position: absolute; left: 280px; top: 15px; color: #F8FAFC; font-size: 14px; width: 260px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" />
                <asp:Label ID="lblPerformedBy3" runat="server" Text="" Style="position: absolute; left: 560px; top: 15px; color: #F8FAFC; font-size: 13px;" />
                <asp:Label ID="lblTarget3" runat="server" Text="" Style="position: absolute; left: 680px; top: 15px; color: #F8FAFC; font-size: 11px; background: #334155; padding: 2px 5px; border-radius: 4px;" />
                <asp:Label ID="lblSeverity3" runat="server" Text="" Style="position: absolute; left: 740px; top: 12px; padding: 4px 8px; border-radius: 20px; font-size: 11px; font-weight: bold;" />
            </asp:Panel>

            <asp:Panel ID="pnlRow4" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 190px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblTimestamp4" runat="server" Text="" Style="position: absolute; left: 10px; top: 15px; color: #94A3B8; font-size: 12px; font-family: Consolas, monospace;" />
                <asp:Label ID="lblAction4" runat="server" Text="" Style="position: absolute; left: 160px; top: 15px; color: #F8FAFC; font-size: 14px; font-weight: bold;" />
                <asp:Label ID="lblDescription4" runat="server" Text="" Style="position: absolute; left: 280px; top: 15px; color: #F8FAFC; font-size: 14px; width: 260px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" />
                <asp:Label ID="lblPerformedBy4" runat="server" Text="" Style="position: absolute; left: 560px; top: 15px; color: #F8FAFC; font-size: 13px;" />
                <asp:Label ID="lblTarget4" runat="server" Text="" Style="position: absolute; left: 680px; top: 15px; color: #F8FAFC; font-size: 11px; background: #334155; padding: 2px 5px; border-radius: 4px;" />
                <asp:Label ID="lblSeverity4" runat="server" Text="" Style="position: absolute; left: 740px; top: 12px; padding: 4px 8px; border-radius: 20px; font-size: 11px; font-weight: bold;" />
            </asp:Panel>

            <asp:Panel ID="pnlRow5" runat="server" Visible="false" Style="position: absolute; left: 0px; top: 240px; width: 820px; height: 50px; border-bottom: 1px solid #1E293B;">
                <asp:Label ID="lblTimestamp5" runat="server" Text="" Style="position: absolute; left: 10px; top: 15px; color: #94A3B8; font-size: 12px; font-family: Consolas, monospace;" />
                <asp:Label ID="lblAction5" runat="server" Text="" Style="position: absolute; left: 160px; top: 15px; color: #F8FAFC; font-size: 14px; font-weight: bold;" />
                <asp:Label ID="lblDescription5" runat="server" Text="" Style="position: absolute; left: 280px; top: 15px; color: #F8FAFC; font-size: 14px; width: 260px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" />
                <asp:Label ID="lblPerformedBy5" runat="server" Text="" Style="position: absolute; left: 560px; top: 15px; color: #F8FAFC; font-size: 13px;" />
                <asp:Label ID="lblTarget5" runat="server" Text="" Style="position: absolute; left: 680px; top: 15px; color: #F8FAFC; font-size: 11px; background: #334155; padding: 2px 5px; border-radius: 4px;" />
                <asp:Label ID="lblSeverity5" runat="server" Text="" Style="position: absolute; left: 740px; top: 12px; padding: 4px 8px; border-radius: 20px; font-size: 11px; font-weight: bold;" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="pnlPagination" runat="server" BackColor="#0F172A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 20px; top: 730px; width: 820px; height: 50px; border-radius: 8px;">
            <asp:Label ID="lblPageInfo" runat="server" Text="Showing 1 - 25 of 1,420 events" ForeColor="#94A3B8" Font-Size="12px" Style="position: absolute; left: 20px; top: 18px;"></asp:Label>
            
            <asp:Button ID="btnPrev" runat="server" Text="Prev" OnClick="btnPrev_Click" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 80px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" BackColor="#1E293B" ForeColor="#94A3B8" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; right: 10px; top: 10px; width: 60px; height: 30px; border-radius: 4px; cursor: pointer;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
