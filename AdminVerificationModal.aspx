<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminVerificationModal.aspx.cs" Inherits="DDCH.AdminVerificationModal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verification Modal</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: transparent;
        }
        .glass-card {
            background: rgba(15, 23, 42, 0.9);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            color: #f8fafc;
        }
    </style>
    <script type="text/javascript">
        function closeAndRefresh() {
            if (window.parent && window.parent.CloseModalAndRefresh) {
                window.parent.CloseModalAndRefresh();
            }
        }
        function closeOnly() {
            if (window.parent && window.parent.CloseModalOnly) {
                window.parent.CloseModalOnly();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlModalBox" runat="server" CssClass="glass-card" Style="position: absolute; top: 0px; left: 0px; width: 350px; height: 300px; padding: 25px; box-sizing: border-box;">
            <asp:Label ID="lblModalTitle" runat="server" Text="Review Details" Font-Bold="true" Font-Size="20px" ForeColor="White"></asp:Label>
            <hr style="border: 0; border-top: 1px solid rgba(255,255,255,0.1); margin: 15px 0;" />
            
            <asp:Label ID="lblModalDetail1Title" runat="server" Text="Field 1" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8"></asp:Label><br />
            <asp:Label ID="lblModalDetail1Value" runat="server" Text="Value 1" Font-Size="14px" ForeColor="White" Style="margin-bottom: 15px; display: inline-block;"></asp:Label><br />

            <asp:Label ID="lblModalDetail2Title" runat="server" Text="Field 2" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8"></asp:Label><br />
            <asp:Label ID="lblModalDetail2Value" runat="server" Text="Value 2" Font-Size="14px" ForeColor="White" Style="margin-bottom: 15px; display: inline-block;"></asp:Label><br />

            <asp:Label ID="lblModalDetail3Title" runat="server" Text="Field 3" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8"></asp:Label><br />
            <asp:Label ID="lblModalDetail3Value" runat="server" Text="Value 3" Font-Size="14px" ForeColor="White" Style="margin-bottom: 25px; display: inline-block;"></asp:Label><br />

            <div style="text-align: right; position: absolute; bottom: 25px; right: 25px;">
                <asp:Button ID="btnModalCancel" runat="server" Text="Cancel" BackColor="Transparent" ForeColor="#94A3B8" BorderStyle="None" Style="padding: 8px 15px; border-radius: 8px; cursor: pointer; margin-right: 10px;" OnClientClick="closeOnly(); return false;" />
                <asp:Button ID="btnModalApprove" runat="server" Text="Approve" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="padding: 8px 20px; border-radius: 8px; cursor: pointer; font-weight: bold;" OnClick="btnModalApprove_Click" />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
