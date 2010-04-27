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
                <%-- <asp:TemplateField HeaderText="Salary Grade"><ItemTemplate><asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Eval("Title.SalaryGrade") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
                <asp:BoundField DataField="ID" HeaderText="EmployeeID" ReadOnly="True" 
                    SortExpression="ID" />
                <asp:TemplateField HeaderText="Title Code"><ItemTemplate><asp:Label ID="lblTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <asp:BoundField DataField="BargainingUnitCode" HeaderText="Bargaining Unit Code" 
                    SortExpression="BargainingUnitCode" />
                <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                    SortExpression="SalaryGrade" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                    SortExpression="FullName" />
                <asp:CheckBoxField DataField="DatesHaveBeenAdjusted" 
                    HeaderText="Dates Have Been Adjusted" SortExpression="DatesHaveBeenAdjusted" />
                <asp:BoundField DataField="CareerHireDate" HeaderText="Career Hire Date" 
                    SortExpression="CareerHireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="ApptHireDate" HeaderText="Appt Hire Date" 
                    SortExpression="ApptHireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="BeginDate" HeaderText="BeginDate" 
                    SortExpression="BeginDate" DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField DataField="YearsOfService" HeaderText="Years Of Service" 
                    SortExpression="YearsOfService" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="TimeInTitle" HeaderText="Time In Title" 
                    SortExpression="TimeInTitle" DataFormatString="{0:0.00}" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" 
                    SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="PayRate" HeaderText="Pay Rate" 
                    SortExpression="PayRate" DataFormatString="{0:c}" />
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
                <asp:TemplateField>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>Title Code</th><th colspan="2">Payroll Title</th><th colspan="2">Abbreviated Name</th></tr>
                            <tr><td><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                    <td colspan="2"><asp:Label ID="lblPayrollTitle" runat="server" Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                    <td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>
                            </tr>
                            <tr><th colspan="5">Salary Scales</th></tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Repeater runat="server" ID="rptSalaryScale" DataSource='<%# Eval("SalaryScales") %>'>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <th colspan="2">Effective Date:</th>
                                                <td colspan="3"><asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("SalaryGradeQuartiles.EffectiveDate","{0:MM/dd/yyyy}") %>'></asp:Label></td>
                                            
                                            
                                            </tr>
                                            <tr>
                                                <th>Salary Grade:</th>
                                                <td><asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Eval("SalaryGradeQuartiles.SalaryGrade") %>'></asp:Label></td>
                                                <th colspan="2">Bargaining Unit:</th>
                                                <td><asp:Label ID="lblBargainingUnitCode" runat="server" Text='<%# Eval("BargainingCode") %>'></asp:Label></td>
                                            
                                            
                                            </tr>
                                            <tr>
                                                <th>Min</th>
                                                <th>First</th>
                                                <th>Mid</th>
                                                <th>Third</th>
                                                <th>Max</th>
                                            </tr>
                                            <tr>
                                                <td><asp:Label ID="lblMin" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MinAnnual","{0:c}") %>'></asp:Label></td>
                                                <td><asp:Label ID="lbl1st" runat="server" Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleAnnual","{0:c}") %>'></asp:Label></td>
                                                <td><asp:Label ID="lblMid" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MidAnnual","{0:c}") %>'></asp:Label></td>
                                                <td><asp:Label ID="lbl3rd" runat="server" Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleAnnual","{0:c}") %>'></asp:Label></td>
                                                <td><asp:Label ID="lblMax" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MaxAnnual","{0:c}") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <table>
                                                        <asp:Repeater runat="server" ID="rptSalarySteps" DataSource='<%# Eval("SalarySteps") %>'><HeaderTemplate><tr><th>Step</th><th>Annual</th><th>Monthly</th><th>Hourly</th></tr></HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><asp:Label ID="lblStep" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label></td>
                                                                    <td><asp:Label ID="lblStepAnnual" runat="server" Text='<%# Eval("Annual","{0:c}") %>'></asp:Label></td>
                                                                    <td><asp:Label ID="lblStepMonthly" runat="server" Text='<%# Eval("Monthly","{0:c}") %>'></asp:Label></td>
                                                                   <td><asp:Label ID="lblStepHourly" runat="server" Text='<%# Eval("Hourly","{0:c}") %>'></asp:Label></td></tr>
                                                            </ItemTemplate> 
                                                        </asp:Repeater>
                                                    </table>
                                             </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                        </asp:Repeater></td></tr></table>
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
