<%@ Page Title="ESRA - Home Page" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAESDO.Esra.Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <center><asp:Label ID="lblPageTitle" runat="server" Text="ESRA Home" Font-Bold="true" Font-Size="Larger"></asp:Label></center>
 <br />
 <hr />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vDemo" runat="server">
            Select a Demonstration Mode:
            <asp:RadioButtonList ID="rblDemoMode" runat="server" AutoPostBack="True" 
                onselectedindexchanged="rblDemoMode_SelectedIndexChanged" >
                    <asp:ListItem Text="Administrator" Value="Admin"></asp:ListItem>
                     <asp:ListItem Text="Dean's Office User" Value="DOUser"></asp:ListItem>
                    <asp:ListItem Text="Reviewer" Value="Reviewer"></asp:ListItem>
                    <asp:ListItem Text="Department User" Value="User"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:View>
        <asp:View ID="vAdmin" runat="server">
        <dl>
            <dt><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Salary Scales</asp:HyperLink></dt><dd>View Titles and Their Respective Salary Scales.</dd>
            <dt><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Employee Salary Comparison</asp:HyperLink></dt><dd>Compare Employees' Salaries By Title.</dd>
            <dt><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/SalaryReviewAnalysisPage.aspx">Salary Review Analysis</asp:HyperLink></dt><dd>Create a New Salary Review Analysis or Search For and View an Existing Salary Review Analysis.</dd>
            <dt><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/TitleCode_UserInputForm.aspx">Title Code Averages Maintenance</asp:HyperLink></dt><dd>
            Enter a New or Edit an Existing Title Code Labor Market WAS/Mid Amount or Campus 
            Average.</dd>
            <dd>
                Add New Salary Steps or Edit Existing Salary Step Numbers or Amounts.</dd>
            <dt><asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="~/SalaryGradeQuartiles_UserInputForm.aspx">Salary Grade Maintenance</asp:HyperLink></dt><dd>
                Enter a New or Edit an Existing Title Code Salary Grade Quartile Amount.</dd>
            <dt><asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/SalaryStep_UserInputForm.aspx">Salary Step Maintenance</asp:HyperLink></dt><dd>
                Create a New Copy of/or Edit the Amounts of an Existing Set of Salary Steps.</dd>
            
            <dd>
                Note: This applies to titles, which currently have Salary Steps.</dd>
            <dt>
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="~/UserAdminPage.aspx">User Administration</asp:HyperLink>
            </dt>
            <dd>
                Add, Edit or Remove a User from the System.</dd>
            
        </dl>
        </asp:View>
        <asp:View ID="vDeansOffice" runat="server">
        <dl>
            <dt><asp:HyperLink ID="hlnkViewSalaryScales" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Salary Scales</asp:HyperLink></dt><dd>View Titles and Their Respective Salary Scales.</dd>
            <dt><asp:HyperLink ID="hlnkEmployeeSalaryComparisons" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Employee Salary Comparison</asp:HyperLink></dt><dd>Compare Employees' Salaries By Title.</dd>
            <dt><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SalaryReviewAnalysisPage.aspx">Salary Review Analysis</asp:HyperLink></dt><dd>Create a New Salary Review Analysis or Search For and View an Existing Salary Review Analysis.</dd>
            <dt><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/TitleCode_UserInputForm.aspx">Title Code Averages Maintenance</asp:HyperLink></dt><dd>Enter a New or Edit an Existing Title Code Labor Market WAS/Mid Amount or Campus Average.</dd>
            <dd>
                Add New Salary Steps or Edit Existing Salary Step Numbers or Amounts.</dd>
            <dd>
            </dd>
            <dt><asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/SalaryGradeQuartiles_UserInputForm.aspx">Salary Grade Maintenance</asp:HyperLink></dt><dd>
            Enter a New or Edit an Existing Title Code Salary Grade Quartile Amount.</dd>
            <dt><asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/SalaryStep_UserInputForm.aspx">Salary Step Maintenance</asp:HyperLink></dt><dd>
            Create a New Copy of/or Edit the Amounts of an Existing Set of Salary Steps.</dd>
            <dd>
                Note: This applies to titles, which currently have Salary Steps.</dd>
        </dl>
        </asp:View>
        <asp:View ID="vReviewer" runat="server">
        <dl>
            <dt><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Salary Scales</asp:HyperLink></dt><dd>View Titles and Their Respective Salary Scales.</dd>
            <dt><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Employee Salary Comparison</asp:HyperLink></dt><dd>Compare Employees' Salaries By Title.</dd>
            <dt><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/SalaryReviewAnalysisPage.aspx">Salary Review Analysis</asp:HyperLink></dt><dd>Create a New Salary Review Analysis or Search For and View an Existing Salary Review Analysis.</dd>
            <%--<dt><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/TitleCode_UserInputForm.aspx">Title Code Averages Maintenance</asp:HyperLink></dt><dd>Enter a New or Edit an Existing Title Code Labor Market WAS/Mid Amount or Campus Average.</dd>
            <dt><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/SalaryGradeQuartiles_UserInputForm.aspx">Salary Grade Maintenance</asp:HyperLink></dt><dd>Enter a New or an Edit Existing Title Code Salary Grade Quartile Amount.</dd>
            <dt><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/SalaryStep_UserInputForm.aspx">Salary Step Maintenance</asp:HyperLink></dt><dd>Enter a New or an Edit Existing Title Code Salary Step Amount.</dd>--%>
            <%--<dt><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/UserAdminPage.aspx">User Administration</asp:HyperLink></dt><dd>Add, Edit or Remove a User from the System.</dd>--%>
        </dl>
        </asp:View>
        <asp:View ID="vDepartments" runat="server">
        <dl>
            <dt>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Salary Scales</asp:HyperLink></dt><dd>View Titles and Their Respective Salary Scales.</dd>
            <dt><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Employee Salary Comparison</asp:HyperLink></dt><dd>Compare Employees' Salaries By Title.</dd>
            </dl>
        </asp:View>
    </asp:MultiView>
</asp:Content>
