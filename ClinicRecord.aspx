<%@ Page Title="Clinic Record Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlClinicCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="🏥 CLINIC RECORD MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Create and manage healthcare facility records" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddClinic" runat="server" Text="➕ Add New Clinic" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

        <asp:Panel ID="pnlMyClinics" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 320px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblMyClinicsTitle" runat="server" Text="🏥 MY CLINIC RECORDS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            <asp:Label ID="lblClinicCount" runat="server" Text="4 clinic records" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 45px;"></asp:Label>
            
            <asp:Label ID="lblHeaderClinicName" runat="server" Text="Clinic Name" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderDoctors" runat="server" Text="Doctors" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderMedicines" runat="server" Text="Medicines" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderContact" runat="server" Text="Emergency Contact" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderUpdated" runat="server" Text="Updated" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 80px;"></asp:Label>
            
            <asp:Panel ID="pnlClinic1" runat="server" Style="position: absolute; left: 0px; top: 105px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinicName1" runat="server" Text="Dire Dawa General Hospital" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation1" runat="server" Text="📍 Downtown" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors1" runat="server" Text="45" Font-Size="14px" ForeColor="#10B981" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines1" runat="server" Text="✅ Available" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact1" runat="server" Text="+251 911 123 456" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated1" runat="server" Text="2 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlClinic2" runat="server" Style="position: absolute; left: 0px; top: 165px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinicName2" runat="server" Text="Community Health Center" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation2" runat="server" Text="📍 Residential Area" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors2" runat="server" Text="12" Font-Size="14px" ForeColor="#F59E0B" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines2" runat="server" Text="⚠️ Limited" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact2" runat="server" Text="+251 911 789 012" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated2" runat="server" Text="5 hours ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlClinic3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblClinicName3" runat="server" Text="Industrial Zone Medical Center" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblLocation3" runat="server" Text="📍 Industrial Zone" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblDoctors3" runat="server" Text="8" Font-Size="14px" ForeColor="#EF4444" Style="position: absolute; left: 220px; top: 25px;"></asp:Label>
                <asp:Label ID="lblMedicines3" runat="server" Text="❌ Out of Stock" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 320px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                <asp:Label ID="lblContact3" runat="server" Text="+251 911 345 678" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblUpdated3" runat="server" Text="1 day ago" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 600px; top: 25px;"></asp:Label>
                
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 440px; width: 820px; height: 380px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFormTitle" runat="server" Text="📝 ADD NEW CLINIC" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblClinicNameLabel" runat="server" Text="Clinic Name:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtClinicName" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 80px; width: 360px; padding: 8px; border-radius: 8px;" placeholder="Enter clinic name"></asp:TextBox>
            
            <asp:Label ID="lblLocationLabel" runat="server" Text="Location:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 400px; top: 80px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Enter location"></asp:TextBox>
            
            <asp:Label ID="lblDoctorsLabel" runat="server" Text="Available Doctors:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtDoctors" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" placeholder="Number of doctors"></asp:TextBox>
            
            <asp:Label ID="lblMedicinesLabel" runat="server" Text="Essential Medicines:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 130px;"></asp:Label>
            <asp:DropDownList ID="ddlMedicines" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 220px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Available" Value="true"></asp:ListItem>
                <asp:ListItem Text="Not Available" Value="false"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblEmergencyLabel" runat="server" Text="Emergency Contact:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 420px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtEmergencyContact" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 420px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" placeholder="Emergency number"></asp:TextBox>
            
            <asp:Label ID="lblPhoneLabel" runat="server" Text="Contact Phone:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 200px;"></asp:Label>
            <asp:TextBox ID="txtContactPhone" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 220px; width: 180px; padding: 8px; border-radius: 8px;" placeholder="Contact number"></asp:TextBox>
            
            <asp:Label ID="lblServicesLabel" runat="server" Text="Services:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 200px;"></asp:Label>
            <asp:TextBox ID="txtServices" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 220px; top: 220px; width: 380px; padding: 8px; border-radius: 8px;" placeholder="Available services (e.g., General Medicine, Surgery, Pediatrics)"></asp:TextBox>
            
            <asp:Button ID="btnSave" runat="server" Text="💾 Save Clinic" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 320px; width: 150px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnCancel" runat="server" Text="❌ Cancel" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 190px; top: 320px; width: 100px; height: 35px; border-radius: 10px; cursor: pointer;" />
            <asp:Button ID="btnUpdateStatus" runat="server" Text="🔄 Update Status" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 320px; width: 180px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
