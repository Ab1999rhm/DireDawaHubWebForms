<%@ Page Title="Agriculture Market Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlAgricultureCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="🌾 AGRICULTURE MARKET MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Create and manage crop prices and market data" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddMarket" runat="server" Text="➕ Add Market Data" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

        <asp:Panel ID="pnlMyMarkets" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 320px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblMyMarketsTitle" runat="server" Text="🌾 MY MARKET DATA" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            <asp:Label ID="lblMarketCount" runat="server" Text="4 market entries" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 45px;"></asp:Label>
            
            <asp:Label ID="lblHeaderCrop" runat="server" Text="Crop" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderPrice" runat="server" Text="Price/kg" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 150px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderMarket" runat="server" Text="Market Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderDate" runat="server" Text="Recorded" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderAlerts" runat="server" Text="Disease Alerts" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 520px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 80px;"></asp:Label>
            
            <asp:Panel ID="pnlMarket1" runat="server" Style="position: absolute; left: 0px; top: 105px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop1" runat="server" Text="🌾 Wheat" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice1" runat="server" Text="42.50 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket1" runat="server" Text="📍 Downtown Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate1" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts1" runat="server" Text="✅ None" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlMarket2" runat="server" Style="position: absolute; left: 0px; top: 165px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop2" runat="server" Text="🌽 Maize" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice2" runat="server" Text="38.75 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket2" runat="server" Text="📍 Residential Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate2" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts2" runat="server" Text="⚠️ Mildew" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlMarket3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop3" runat="server" Text="🌾 Sorghum" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice3" runat="server" Text="52.00 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket3" runat="server" Text="📍 Industrial Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate3" runat="server" Text="2024-05-05" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts3" runat="server" Text="❌ Pests" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 440px; width: 820px; height: 380px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFormTitle" runat="server" Text="📝 ADD MARKET DATA" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblCropLabel" runat="server" Text="Crop Name:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtCropName" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 80px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Enter crop name"></asp:TextBox>
            
            <asp:Label ID="lblPriceLabel" runat="server" Text="Price per kg:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 240px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtPricePerKg" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 240px; top: 80px; width: 120px; padding: 8px; border-radius: 8px;" placeholder="0.00"></asp:TextBox>
            
            <asp:Label ID="lblMarketLabel" runat="server" Text="Market Location:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 380px; top: 60px;"></asp:Label>
            <asp:DropDownList ID="ddlMarketLocation" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 380px; top: 80px; width: 140px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Select Market" Value=""></asp:ListItem>
                <asp:ListItem Text="Downtown Market" Value="Downtown Market"></asp:ListItem>
                <asp:ListItem Text="Residential Market" Value="Residential Market"></asp:ListItem>
                <asp:ListItem Text="Industrial Market" Value="Industrial Market"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblDateLabel" runat="server" Text="Recorded Date:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 540px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtRecordedDate" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 540px; top: 80px; width: 120px; padding: 8px; border-radius: 8px;" Text="2024-05-06"></asp:TextBox>
            
            <asp:Label ID="lblAlertsLabel" runat="server" Text="Disease Alerts:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtDiseaseAlerts" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 150px; width: 360px; padding: 8px; border-radius: 8px;" placeholder="Enter any disease alerts or pest information"></asp:TextBox>
            
            <asp:Label ID="lblImageLabel" runat="server" Text="Product Image:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 130px;"></asp:Label>
            <asp:FileUpload ID="fuProductImage" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 400px; top: 150px; width: 260px; padding: 8px; border-radius: 8px;" />
            
            <asp:Image ID="imgPreview" runat="server" Style="position: absolute; left: 400px; top: 200px; width: 100px; height: 100px; border-radius: 8px; display: none;" />
            <asp:Label ID="lblImageInfo" runat="server" Text="No image selected" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 310px;"></asp:Label>
            
            <asp:Button ID="btnSave" runat="server" Text="💾 Save Market Data" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 320px; width: 160px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnCancel" runat="server" Text="❌ Cancel" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 200px; top: 320px; width: 100px; height: 35px; border-radius: 10px; cursor: pointer;" />
            <asp:Button ID="btnUploadImage" runat="server" Text="📷 Upload Image" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 320px; width: 140px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
