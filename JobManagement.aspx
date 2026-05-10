<%@ Page Title="Job Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlJobCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="💼 JOB MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Manage job postings and employment opportunities" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddJob" runat="server" Text="➕ Add Job" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 160px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnExport" runat="server" Text="📊 Export" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlStat1" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat1Icon" runat="server" Text="💼" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat1Title" runat="server" Text="TOTAL JOBS" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat1Value" runat="server" Text="387" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat1Unit" runat="server" Text="Postings" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat2" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 210px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat2Icon" runat="server" Text="🟢" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat2Title" runat="server" Text="ACTIVE" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat2Value" runat="server" Text="342" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat2Unit" runat="server" Text="Published" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat3" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 420px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat3Icon" runat="server" Text="⏳" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat3Title" runat="server" Text="PENDING" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat3Value" runat="server" Text="45" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat3Unit" runat="server" Text="Approval" Font-Size="12px" ForeColor="#F59E0B" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlStat4" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 630px; top: 100px; width: 190px; height: 100px; text-align: center; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblStat4Icon" runat="server" Text="🎓" Font-Size="24px" Style="position: absolute; left: 85px; top: 15px;"></asp:Label>
            <asp:Label ID="lblStat4Title" runat="server" Text="TRAINING" Font-Size="11px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 15px; top: 45px;"></asp:Label>
            <asp:Label ID="lblStat4Value" runat="server" Text="28" Font-Size="28px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 15px; top: 65px;"></asp:Label>
            <asp:Label ID="lblStat4Unit" runat="server" Text="Opportunities" Font-Size="12px" ForeColor="#10B981" Style="position: absolute; left: 15px; top: 95px;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlFilters" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 220px; width: 820px; height: 80px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFiltersTitle" runat="server" Text="🔍 FILTERS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblSearchLabel" runat="server" Text="Search:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 50px;"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 70px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Search job title or company"></asp:TextBox>
            
            <asp:Label ID="lblStatusLabel" runat="server" Text="Status:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 240px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlStatus" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 240px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All" Value="all"></asp:ListItem>
                <asp:ListItem Text="Published" Value="published"></asp:ListItem>
                <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                <asp:ListItem Text="Rejected" Value="rejected"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblTypeLabel" runat="server" Text="Type:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 380px; top: 50px;"></asp:Label>
            <asp:DropDownList ID="ddlJobType" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 380px; top: 70px; width: 120px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="All Types" Value=""></asp:ListItem>
                <asp:ListItem Text="Full-time" Value="Full-time"></asp:ListItem>
                <asp:ListItem Text="Part-time" Value="Part-time"></asp:ListItem>
                <asp:ListItem Text="Training" Value="Training"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Button ID="btnApplyFilter" runat="server" Text="🔍 Apply" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 520px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
            <asp:Button ID="btnClearFilter" runat="server" Text="🔄 Clear" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 600px; top: 70px; width: 70px; height: 30px; border-radius: 8px; cursor: pointer;" />
        </asp:Panel>

        <asp:Panel ID="pnlJobList" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 320px; width: 820px; height: 480px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblListTitle" runat="server" Text="💼 JOB POSTINGS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblHeaderTitle" runat="server" Text="Job Title" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderCompany" runat="server" Text="Company" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderLocation" runat="server" Text="Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderPosted" runat="server" Text="Posted" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderStatus" runat="server" Text="Status" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 60px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 60px;"></asp:Label>
            
            <asp:Panel ID="pnlJob1" runat="server" Style="position: absolute; left: 0px; top: 85px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle1" runat="server" Text="Senior Software Engineer" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType1" runat="server" Text="Full-time" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany1" runat="server" Text="TechCorp Solutions" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation1" runat="server" Text="📍 Dire Dawa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted1" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="🟢 Published" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView1" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlJob2" runat="server" Style="position: absolute; left: 0px; top: 155px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle2" runat="server" Text="Marketing Manager" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType2" runat="server" Text="Full-time" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany2" runat="server" Text="Growth Industries" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation2" runat="server" Text="📍 Addis Ababa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted2" runat="server" Text="2024-05-05" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="⏳ Pending" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView2" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlJob3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle3" runat="server" Text="IT Training Program" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType3" runat="server" Text="Training" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany3" runat="server" Text="Tech Academy" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation3" runat="server" Text="📍 Dire Dawa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted3" runat="server" Text="2024-05-04" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="🟢 Published" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView3" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlJob4" runat="server" Style="position: absolute; left: 0px; top: 295px; width: 820px; height: 70px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle4" runat="server" Text="Healthcare Assistant" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType4" runat="server" Text="Part-time" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany4" runat="server" Text="City Hospital" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation4" runat="server" Text="📍 Dire Dawa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted4" runat="server" Text="2024-05-03" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus4" runat="server" Text="❌ Rejected" BackColor="#EF4444" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnView4" runat="server" Text="👁️" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 140px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnEdit4" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete4" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 22px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
