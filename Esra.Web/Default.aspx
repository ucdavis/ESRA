<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAESDO._Default" %>

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
                <asp:CheckBoxField DataField="DatesHaveBeenAdjusted" 
                    HeaderText="DatesHaveBeenAdjusted" SortExpression="DatesHaveBeenAdjusted" />
                <asp:BoundField DataField="CareerHireDate" HeaderText="CareerHireDate" 
                    SortExpression="CareerHireDate" />
                <asp:BoundField DataField="ApptHireDate" HeaderText="ApptHireDate" 
                    SortExpression="ApptHireDate" />
                <asp:BoundField DataField="YearsOfService" HeaderText="YearsOfService" 
                    SortExpression="YearsOfService" />
                <asp:BoundField DataField="TimeInTitle" HeaderText="TimeInTitle" 
                    SortExpression="TimeInTitle" />
                <asp:BoundField DataField="DepartmentComments" HeaderText="DepartmentComments" 
                    SortExpression="DepartmentComments" />
                <asp:BoundField DataField="DeansOfficeComments" 
                    HeaderText="DeansOfficeComments" SortExpression="DeansOfficeComments" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    SortExpression="EmployeeID" />
                <asp:CheckBoxField DataField="Different" HeaderText="Different" 
                    SortExpression="Different" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" 
                    SortExpression="FullName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" 
                    SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="HireDate" HeaderText="HireDate" 
                    SortExpression="HireDate" />
                <asp:BoundField DataField="BeginDate" HeaderText="BeginDate" 
                    SortExpression="BeginDate" />
                <asp:BoundField DataField="YearsInTitle" HeaderText="YearsInTitle" 
                    SortExpression="YearsInTitle" />
                <asp:BoundField DataField="PayRate" HeaderText="PayRate" 
                    SortExpression="PayRate" />
                <asp:BoundField DataField="SalaryGrade" HeaderText="SalaryGrade" 
                    SortExpression="SalaryGrade" />
                <asp:BoundField DataField="BargainingUnitCode" HeaderText="BargainingUnitCode" 
                    SortExpression="BargainingUnitCode" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID" />
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
    </div>
    </form>
</body>
</html>
