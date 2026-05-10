<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDb.aspx.cs" Inherits="DDCH.TestDb" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Database Test</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>SQLite Database Test</h2>
            <asp:Label ID="lblStatus" runat="server" Text="Testing..."></asp:Label>
            <br /><br />
            <asp:GridView ID="gvUsers" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
