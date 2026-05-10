<%@ Page Title="Job Posting Management" Language="C#" MasterPageFile="~/Contributor.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Panel ID="pnlJobCanvas" runat="server" Style="position: relative; width: 860px; height: 850px; padding: 20px;">
        
        <asp:Panel ID="pnlHeader" runat="server" Style="position: absolute; left: 0px; top: 0px; width: 820px; height: 80px;">
            <asp:Label ID="lblTitle" runat="server" Text="💼 JOB POSTING MANAGEMENT" Font-Bold="true" Font-Size="24px" ForeColor="White" Style="position: absolute; left: 0px; top: 0px;"></asp:Label>
            <asp:Label ID="lblSubTitle" runat="server" Text="Create and manage job postings and training opportunities" Font-Size="14px" ForeColor="#94A3B8" Style="position: absolute; left: 0px; top: 40px;"></asp:Label>
            
            <asp:Button ID="btnAddJob" runat="server" Text="➕ Add New Job" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 0px; top: 20px; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

        <asp:Panel ID="pnlMyJobs" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 100px; width: 820px; height: 320px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblMyJobsTitle" runat="server" Text="💼 MY JOB POSTINGS" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            <asp:Label ID="lblJobCount" runat="server" Text="4 job postings" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 45px;"></asp:Label>
            
            <asp:Label ID="lblHeaderTitle" runat="server" Text="Job Title" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderCompany" runat="server" Text="Company" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderLocation" runat="server" Text="Location" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderPosted" runat="server" Text="Posted" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderStatus" runat="server" Text="Status" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; left: 550px; top: 80px;"></asp:Label>
            <asp:Label ID="lblHeaderActions" runat="server" Text="Actions" Font-Size="12px" Font-Bold="true" ForeColor="#94A3B8" Style="position: absolute; right: 20px; top: 80px;"></asp:Label>
            
            <asp:Panel ID="pnlJob1" runat="server" Style="position: absolute; left: 0px; top: 105px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle1" runat="server" Text="Senior Software Engineer" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType1" runat="server" Text="Full-time" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany1" runat="server" Text="TechCorp Solutions" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation1" runat="server" Text="📍 Dire Dawa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted1" runat="server" Text="2024-05-06" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus1" runat="server" Text="🟢 Published" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit1" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete1" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlJob2" runat="server" Style="position: absolute; left: 0px; top: 165px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle2" runat="server" Text="Marketing Manager" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType2" runat="server" Text="Full-time" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany2" runat="server" Text="Growth Industries" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation2" runat="server" Text="📍 Addis Ababa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted2" runat="server" Text="2024-05-05" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus2" runat="server" Text="⏳ Pending" BackColor="#F59E0B" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit2" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete2" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
            
            <asp:Panel ID="pnlJob3" runat="server" Style="position: absolute; left: 0px; top: 225px; width: 820px; height: 60px; border-bottom: 1px solid #0A0F1F;">
                <asp:Label ID="lblTitle3" runat="server" Text="IT Training Program" Font-Size="14px" Font-Bold="true" ForeColor="White" Style="position: absolute; left: 20px; top: 15px;"></asp:Label>
                <asp:Label ID="lblType3" runat="server" Text="Training" Font-Size="11px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 35px;"></asp:Label>
                <asp:Label ID="lblCompany3" runat="server" Text="Tech Academy" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 200px; top: 25px;"></asp:Label>
                <asp:Label ID="lblLocation3" runat="server" Text="📍 Dire Dawa" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 320px; top: 25px;"></asp:Label>
                <asp:Label ID="lblPosted3" runat="server" Text="2024-05-04" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 450px; top: 25px;"></asp:Label>
                <asp:Label ID="lblStatus3" runat="server" Text="🟢 Published" BackColor="#10B981" ForeColor="White" Style="position: absolute; left: 550px; top: 20px; padding: 4px 8px; border-radius: 6px; font-size: 11px;"></asp:Label>
                
                <asp:Button ID="btnEdit3" runat="server" Text="✏️" BackColor="#F59E0B" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 90px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
                <asp:Button ID="btnDelete3" runat="server" Text="🗑️" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 40px; top: 18px; width: 30px; height: 24px; border-radius: 6px; cursor: pointer; font-size: 11px;" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server" BackColor="#0F1E2A" BorderStyle="Solid" BorderColor="#334155" BorderWidth="1px" Style="position: absolute; left: 0px; top: 440px; width: 820px; height: 380px; border-radius: 20px; backdrop-filter: blur(15px);">
            <asp:Label ID="lblFormTitle" runat="server" Text="📝 ADD NEW JOB POSTING" Font-Bold="true" Font-Size="16px" ForeColor="White" Style="position: absolute; left: 20px; top: 20px;"></asp:Label>
            
            <asp:Label ID="lblTitleLabel" runat="server" Text="Job Title:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtJobTitle" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 80px; width: 360px; padding: 8px; border-radius: 8px;" placeholder="Enter job title"></asp:TextBox>
            
            <asp:Label ID="lblCompanyLabel" runat="server" Text="Company:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 400px; top: 60px;"></asp:Label>
            <asp:TextBox ID="txtCompany" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 400px; top: 80px; width: 200px; padding: 8px; border-radius: 8px;" placeholder="Enter company name"></asp:TextBox>
            
            <asp:Label ID="lblLocationLabel" runat="server" Text="Location:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" placeholder="Enter location"></asp:TextBox>
            
            <asp:Label ID="lblTypeLabel" runat="server" Text="Job Type:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 220px; top: 130px;"></asp:Label>
            <asp:DropDownList ID="ddlJobType" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 220px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;">
                <asp:ListItem Text="Full-time" Value="Full-time"></asp:ListItem>
                <asp:ListItem Text="Part-time" Value="Part-time"></asp:ListItem>
                <asp:ListItem Text="Training" Value="Training"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblSalaryLabel" runat="server" Text="Salary:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 420px; top: 130px;"></asp:Label>
            <asp:TextBox ID="txtSalary" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 420px; top: 150px; width: 180px; padding: 8px; border-radius: 8px;" placeholder="e.g., Competitive, 5000-8000"></asp:TextBox>
            
            <asp:Label ID="lblDescriptionLabel" runat="server" Text="Description:" Font-Size="12px" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 200px;"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" BackColor="#334155" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 220px; width: 580px; height: 80px; padding: 8px; border-radius: 8px;" TextMode="MultiLine" placeholder="Enter job description, requirements, and responsibilities..."></asp:TextBox>
            
            <asp:CheckBox ID="chkIsTraining" runat="server" Text=" This is a training opportunity" ForeColor="#94A3B8" Style="position: absolute; left: 20px; top: 310px;" />
            
            <asp:Button ID="btnSave" runat="server" Text="💾 Save Job Posting" BackColor="#10B981" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 20px; top: 320px; width: 160px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
            <asp:Button ID="btnCancel" runat="server" Text="❌ Cancel" BackColor="#EF4444" ForeColor="White" BorderStyle="None" Style="position: absolute; left: 200px; top: 320px; width: 100px; height: 35px; border-radius: 10px; cursor: pointer;" />
            <asp:Button ID="btnPreview" runat="server" Text="👁️ Preview" BackColor="#3B82F6" ForeColor="White" BorderStyle="None" Style="position: absolute; right: 20px; top: 320px; width: 120px; height: 35px; border-radius: 10px; cursor: pointer; font-weight: bold;" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server"></asp:Content>
