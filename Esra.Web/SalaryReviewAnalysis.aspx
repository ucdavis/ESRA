<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysis.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryAnalysisReview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Salary Review Analysis</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="odsSalaryReviewAnalysis" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByProperty" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlReferenceNumber" 
                    DefaultValue="ReferenceNumber" Name="propertyName" PropertyName="SelectedValue" 
                    Type="String" />
                <asp:Parameter DefaultValue="" Name="propertyValue" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsESRAs" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" 
                    Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
                <asp:DropDownList ID="ddlReferenceNumber" runat="server" AutoPostBack="True" 
                    DataSourceID="odsESRAs" DataTextField="ReferenceNumber" DataValueField="ID">
                    <asp:ListItem>-- Select a Reference Number --</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" 
                    DataSourceID="odsEmployee" DataTextField="FullName" DataValueField="ID">
                    <asp:ListItem>-- Select an Employee --</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="ddl" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsSalaryReviewAnalysis">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Reference Number" 
                            SortExpression="ReferenceNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Originating Department" 
                            SortExpression="OriginatingDepartment">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("OriginatingDepartment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Bind("OriginatingDepartment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee" SortExpression="Employee">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Employee") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Employee") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" 
                            SortExpression="DateInitiated" />
                        <asp:BoundField DataField="InitiatedByReviewerName" 
                            HeaderText="Initiated By Reviewer Name" 
                            SortExpression="InitiatedByReviewerName" />
                        <asp:BoundField DataField="DateApproved" HeaderText="Date Approved" 
                            SortExpression="DateApproved" />
                        <asp:TemplateField HeaderText="ApprovedScenario" 
                            SortExpression="ApprovedScenario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" 
                                    Text='<%# Bind("ApprovedScenario") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ApprovedScenario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" 
                            SortExpression="DepartmentComments" />
                        <asp:BoundField DataField="DeansOfficeComments" 
                            HeaderText="Deans Office Comments" SortExpression="DeansOfficeComments" />
                    </Columns>
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
