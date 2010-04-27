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
        <asp:View ID="vDeansOffice" runat="server">
        <dl>
            <dt>
                <asp:HyperLink ID="hlnkViewSalaryScales" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Salary Scales</asp:HyperLink></dt><dd>View Titles and Their Respective Salary Scales.</dd>
            <dt><asp:HyperLink ID="hlnkEmployeeSalaryComparisons" runat="server" NavigateUrl="~/EmployeeSalaryComparisonPage.aspx">Employee Salary Comparison</asp:HyperLink></dt><dd>Compare Employees' Salaries By Title.</dd>
            <dt><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SalaryReviewAnalysisPage.aspx">Salary Review Analysis</asp:HyperLink></dt><dd>Create a New Salary Review Analysis or Search For and View an Existing Salary Review Analysis.</dd>
            <dt><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/TitleCode_UserInputForm.aspx">Title Code Averages Maintenance</asp:HyperLink></dt><dd>Enter a New or Edit an Existing Title Code Labor Market WAS/Mid Amount or Campus Average.</dd>
            <dt><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/SalaryGradeQuartiles_UserInputForm.aspx">Salary Grade Maintenance</asp:HyperLink></dt><dd>Enter a New or an Edit Existing Title Code Salary Grade Quartile Amount.</dd>
            <dt><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/SalaryStep_UserInputForm.aspx">Salary Step Maintenance</asp:HyperLink></dt><dd>Enter a New or an Edit Existing Title Code Salary Step Amount.</dd>
            <dt><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/UserAdminPage.aspx">User Administration</asp:HyperLink></dt><dd>Add, Edit or Remove a User from the System.</dd>
       
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
