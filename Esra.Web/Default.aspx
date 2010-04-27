<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAESDO.Esra.Web._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Employees Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Employees:
        <asp:GridView ID="gvEmployees" runat="server" DataSourceID="odsEmployee" 
            AutoGenerateColumns="False" EmptyDataText="No Data Found.">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="EmployeeID" ReadOnly="True" 
                    SortExpression="ID" />
                <asp:CheckBoxField DataField="DatesHaveBeenAdjusted" 
                    HeaderText="Dates Have Been Adjusted" SortExpression="DatesHaveBeenAdjusted" />
                <asp:BoundField DataField="CareerHireDate" HeaderText="Career Hire Date" 
                    SortExpression="CareerHireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="ApptHireDate" HeaderText="Appt Hire Date" 
                    SortExpression="ApptHireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="BeginDate" HeaderText="BeginDate" 
                    SortExpression="BeginDate" />
                <asp:BoundField DataField="YearsOfService" HeaderText="Years Of Service" 
                    SortExpression="YearsOfService" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="TimeInTitle" HeaderText="Time In Title" 
                    SortExpression="TimeInTitle" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                    SortExpression="FullName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" 
                    SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="PayRate" HeaderText="Pay Rate" 
                    SortExpression="PayRate" DataFormatString="{0:c}" />
                <asp:TemplateField HeaderText="Title Code"><ItemTemplate><asp:Label ID="lblTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <%-- <asp:TemplateField HeaderText="Salary Grade"><ItemTemplate><asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Eval("Title.SalaryGrade") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
                <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                    SortExpression="SalaryGrade" />
                <asp:BoundField DataField="BargainingUnitCode" HeaderText="Bargaining Unit Code" 
                    SortExpression="BargainingUnitCode" />
                <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" 
                    SortExpression="DepartmentComments" />
                <asp:BoundField DataField="DeansOfficeComments" HeaderText="Dean's Office Comments" 
                    SortExpression="DeansOfficeComments" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll">
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        Title Code:
        <asp:DropDownList ID="ddlTitleCode" runat="server" DataSourceID="odsTitles" 
            DataTextField="TitleCode" DataValueField="id" AutoPostBack="True">
        </asp:DropDownList>
        
        <asp:GridView ID="gvTitle" runat="server" DataSourceID="odsTitle" 
            AutoGenerateColumns="False" EmptyDataText="No Data Found.">
            <Columns>
                <asp:BoundField DataField="TitleCode" HeaderText="Title Code" 
                    SortExpression="TitleCode" />
                <asp:BoundField DataField="PayrollTitle" HeaderText="Payroll Title" 
                    SortExpression="PayrollTitle" />
                <asp:BoundField DataField="AbbreviatedName" HeaderText="Abbreviated Name" 
                    SortExpression="AbbreviatedName" />
                <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Unit Code" 
                    SortExpression="BargainingCode" />
                <asp:TemplateField>
                    <HeaderTemplate>Salary Scales</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Repeater runat="server" ID="rptSalaryScale" DataSource='<%# Eval("SalaryScales") %>'>
                        <ItemTemplate>
                            <asp:Repeater runat="server" ID="rptSalaryGradeQuartile" DataSource='<%# Eval("SalaryGradeQuartiles") %>'>
                                <ItemTemplate>
                                    <asp:Label ID="lblTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label>
                                </ItemTemplate>
                                <SeparatorTemplate><br /></SeparatorTemplate>
                             </asp:Repeater>
                           </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
        <asp:ObjectDataSource ID="odsTitle" runat="server"  
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTitleCode" Name="id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsTitles" runat="server" 
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll">
            <SelectParameters>
                <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
            
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
