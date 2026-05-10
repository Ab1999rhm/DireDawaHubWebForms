<%@ Page Title="Agriculture Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlAgricultureCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="🌾 AGRICULTURE MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Manage crop prices, market data, and disease alerts" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddMarket" runat="server" Text="➕ Add Market Data" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnExport" runat="server" Text="📊 Export" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlStat1" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat1Icon" runat="server" Text="🌾" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Title" runat="server" Text="MARKETS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat1Value" runat="server" Text="24" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat1Unit" runat="server" Text="Active" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 210px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat2Icon" runat="server" Text="🌱" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Title" runat="server" Text="CROPS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat2Value" runat="server" Text="156" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat2Unit" runat="server" Text="Varieties" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat3Icon" runat="server" Text="💰" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Title" runat="server" Text="AVG PRICE" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat3Value" runat="server" Text="45" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat3Unit" runat="server" Text="Birr/kg" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 630px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat4Icon" runat="server" Text="⚠️" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Title" runat="server" Text="ALERTS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat4Value" runat="server" Text="3" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat4Unit" runat="server" Text="Active" Font-Size="12px" ForeColor="#F59E0B" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlFilters" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 220px; width: 820px; height: 80px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFiltersTitle" runat="server" Text="🔍 FILTERS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblSearchLabel" runat="server" Text="Search:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 50px;"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 70px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Search crop or location"></asp:TextBox>
            
            <asp:Label ID="lblCropLabel" runat="server" Text="Crop:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 240px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlCrop" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 240px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Crops" Value=""></asp:ListItem>
                <asp:ListItem Text="Wheat" Value="Wheat"></asp:ListItem>
                <asp:ListItem Text="Maize" Value="Maize"></asp:ListItem>
                <asp:ListItem Text="Sorghum" Value="Sorghum"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblMarketLabel" runat="server" Text="Market:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 380px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlMarket" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 380px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Markets" Value=""></asp:ListItem>
                <asp:ListItem Text="Downtown" Value="Downtown"></asp:ListItem>
                <asp:ListItem Text="Residential" Value="Residential"></asp:ListItem>
                <asp:ListItem Text="Industrial" Value="Industrial"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblPriceLabel" runat="server" Text="Price Range:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 520px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlPriceRange" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 520px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Prices" Value=""></asp:ListItem>
                <asp:ListItem Text="0-20 Birr" Value="0-20"></asp:ListItem>
                <asp:ListItem Text="20-50 Birr" Value="20-50"></asp:ListItem>
                <asp:ListItem Text="50+ Birr" Value="50+"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Button ID="btnApplyFilter" runat="server" Text="🔍 Apply" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 660px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
            <asp:Button ID="btnClearFilter" runat="server" Text="🔄 Clear" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 740px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlMarketList" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 320px; width: 820px; height: 480px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblListTitle" runat="server" Text="🌾 MARKET DATA" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblHeaderCrop" runat="server" Text="Crop" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderPrice" runat="server" Text="Price/kg" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 150px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderMarket" runat="server" Text="Market Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderDate" runat="server" Text="Recorded" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderAlerts" runat="server" Text="Disease Alerts" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 520px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 60px;"></asp:Label>
            
            <asp:Panel ID="pnlMarket1" runat="server" Style="position: absolute; left: 0px; top: 85px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop1" runat="server" Text="🌾 Wheat" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice1" runat="server" Text="42.50 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket1" runat="server" Text="📍 Downtown Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate1" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts1" runat="server" Text="✅ None" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView1" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlMarket2" runat="server" Style="position: absolute; left: 0px; top: 155px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop2" runat="server" Text="🌽 Maize" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice2" runat="server" Text="38.75 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket2" runat="server" Text="📍 Residential Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate2" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts2" runat="server" Text="⚠️ Mildew" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView2" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlMarket3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop3" runat="server" Text="🌾 Sorghum" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice3" runat="server" Text="52.00 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket3" runat="server" Text="📍 Industrial Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate3" runat="server" Text="2024-05-05" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts3" runat="server" Text="❌ Pests" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView3" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlMarket4" runat="server" Style="position: absolute; left: 0px; top: 295px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblCrop4" runat="server" Text="🥬 Vegetables" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblPrice4" runat="server" Text="28.30 Birr" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 150px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMarket4" runat="server" Text="📍 Downtown Market" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 250px; top: 25px;"></asp:Label>
                <asp:Label ID="lblDate4" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 25px;"></asp:Label>
                <asp:Label ID="lblAlerts4" runat="server" Text="✅ None" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 520px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView4" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit4" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete4" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
