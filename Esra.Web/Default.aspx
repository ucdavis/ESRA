<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAESDO.Esra.Web._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Employees Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        Title Code:
        <asp:DropDownList ID="ddlTitleCode" runat="server" DataSourceID="odsTitles" 
            DataTextField="TitleCode" DataValueField="id" AutoPostBack="True" 
            AppendDataBoundItems="True">
            <asp:ListItem Value="0">-- Select a Title Code --</asp:ListItem>
        </asp:DropDownList>
        
        &nbsp;<asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="odsDepartments" DataTextField="Name" 
            DataValueField="ID">
            <asp:ListItem Value="0">-- Select a Department --</asp:ListItem>
        </asp:DropDownList>
        
        &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="odsEmployee" 
            DataTextField="FullName" DataValueField="ID" 
            >
            <asp:ListItem Value="0">-- Select an Employee Name --</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Get Employee" />
        
        &nbsp;&nbsp;<br />
        
        <asp:GridView ID="gvTitle" runat="server" DataSourceID="odsTitle" 
            AutoGenerateColumns="False" EmptyDataText="No Title Code selected.">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>Title Code</th><th colspan="2">Payroll Title</th><%--<th colspan="2">Abbreviated Name</th>--%></tr>
                            <tr><td><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                    <td colspan="2"><asp:Label ID="lblPayrollTitle" runat="server" 
                                            Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                    <%--<td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" 
                                            Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>--%>
                            </tr>
                            <tr><th colspan="5">Salary Scales</th></tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Repeater runat="server" ID="rptSalaryScale" 
                                        DataSource='<%# Eval("SalaryScales") %>'>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <th colspan="2">Effective Date:</th>
                                                <td colspan="3"><asp:Label ID="lblEffectiveDate" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.EffectiveDate","{0:MM/dd/yyyy}") %>'></asp:Label></td>
                                            
                                            
                                            </tr>
                                            <tr>
                                                <th>Salary Grade:</th>
                                                <td><asp:Label ID="lblSalaryGrade" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.SalaryGrade") %>'></asp:Label></td>
                                                <th colspan="2">Bargaining Unit:</th>
                                                <td><asp:Label ID="lblBargainingUnitCode" runat="server" 
                                                        Text='<%# Eval("BargainingCode") %>'></asp:Label></td>
                                            
                                            
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <table>
                                                        <tr>
                                                            <th>Quartile</th><th>Annual</th><th>Monthly</th><th>Hourly</th>
                                                        </tr>
                                                        <tr>
                                                            <th>Min</th><td><asp:Label ID="Label2" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MinAnnual","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label4" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MinMonthly","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label5" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MinHourly","{0:c}") %>'></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <th>First</th><td><asp:Label ID="Label3" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleAnnual","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label6" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleMonthly","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label7" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleHourly","{0:c}") %>'></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Mid</th><td><asp:Label ID="Label8" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MidAnnual","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label9" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MidMonthly","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label10" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MidHourly","{0:c}") %>'></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Third</th><td><asp:Label ID="Label11" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleAnnual","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label12" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleMonthly","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label13" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleHourly","{0:c}") %>'></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Max</th><td><asp:Label ID="Label14" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MaxAnnual","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label15" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MaxMonthly","{0:c}") %>'></asp:Label></td><td><asp:Label ID="Label16" runat="server" 
                                                        Text='<%# Eval("SalaryGradeQuartiles.MaxHourly","{0:c}") %>'></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                        <td colspan="5">
                                                            <table>
                                                                <tr>
                                                                    <th>Labor Market WAS:</th><td><asp:Label ID="Label17" runat="server" 
                                                        Text='<%# Eval("LaborMarketWAS","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Labor Market Mid:</th><td><asp:Label ID="Label18" runat="server" 
                                                        Text='<%# Eval("LaborMarketMidAnnual","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>College Average:</th><td><asp:Label ID="Label19" runat="server" 
                                                        Text='<%# Eval("CollegeAverageAnnual","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Campus Average:</th><td><asp:Label ID="Label20" runat="server" 
                                                        Text='<%# Eval("CampusAverageAnnual","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="5">
                                                    <table>
                                                        <asp:Repeater runat="server" ID="rptSalarySteps" 
                                                            DataSource='<%# Eval("SalarySteps") %>'><HeaderTemplate><tr><th>Step</th><th>Annual</th><th>Monthly</th><th>Hourly</th></tr></HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th><asp:Label ID="lblStep" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label></th>
                                                                    <td><asp:Label ID="lblStepAnnual" runat="server" 
                                                                            Text='<%# Eval("Annual","{0:c}") %>'></asp:Label></td>
                                                                    <td><asp:Label ID="lblStepMonthly" runat="server" 
                                                                            Text='<%# Eval("Monthly","{0:c}") %>'></asp:Label></td>
                                                                   <td><asp:Label ID="lblStepHourly" runat="server" 
                                                                           Text='<%# Eval("Hourly","{0:c}") %>'></asp:Label></td></tr>
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
        
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vEmployees" runat="server" >
                Report Date:

                <script type="text/javascript" language="JavaScript">
<!-- //Script courtesy of http://www.web-source.net - Your Guide to Professional Web Site Design and Development -->
var today_date= new Date()
var month=today_date.getMonth()+1
var today=today_date.getDate()
var year=today_date.getYear() + 1900
//document.write("Today's date is: ")
document.write(month+"/"+today+"/"+year)
</script> 

                <br />
                Employees:<br />
                <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsEmployee" EmptyDataText="No Data Found." 
                    OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" AllowSorting="True" 
                    DataKeyNames="ID" OnSorting="gvEmployees_Sorting" 
                    onrowupdated="gvEmployees_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField HeaderText="Department Name" SortExpression="HomeDepartment">
                            <EditItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>' />
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HomeDepartment") %>'></asp:TextBox>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title Code" SortExpression="Title">
                            <EditItemTemplate><asp:Label ID="lblEditTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") %>'/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTitleCode" runat="server" 
                                    Text='<%# Eval("Title.TitleCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bargaining Unit">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Bind("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee Name" SortExpression="FullName">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hire Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>' 
                                    BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Years Of Service" 
                            SortExpression="YearsOfService">
                            <EditItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Bind("YearsOfService", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Begin Date (in Title)">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" 
                                    Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>' BackColor='<%# ((bool)Eval("ApptDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White )  %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time In Title" SortExpression="TimeInTitle">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" 
                                    Text='<%# Bind("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pay Rate" SortExpression="PayRate">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PayRate", "{0:c}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="PayRate" DataFormatString="{0:c}" 
                            HeaderText="Pay Rate" SortExpression="PayRate" ReadOnly="true" ApplyFormatInEditMode="false" />--%>
                        <asp:TemplateField HeaderText="Department Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" 
                                    Text='<%# Bind("DepartmentComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("DepartmentComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dean's Office Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" 
                                    Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("DeansOfficeComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
            
            </asp:View>
        </asp:MultiView>
    
    
&nbsp;<asp:ObjectDataSource ID="odsEmployee" runat="server" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetEmployees" 
            UpdateMethod="UpdateRecord">
            <UpdateParameters>
                <asp:Parameter Name="AdjustedCareerHireDate" Type="String" />
                <asp:Parameter Name="AdjustedApptHireDate" Type="String" />
                <asp:Parameter Name="DepartmentComments" Type="String" />
                <asp:Parameter Name="DeansOfficeComments" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlTitleCode" DefaultValue="0" 
                    Name="titleCode" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlEmployee" DefaultValue="0" 
                    Name="employeeID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" 
                    Name="departmentID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
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
        <asp:ObjectDataSource ID="odsDepartments" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.DepartmentBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    </div>
    </form>
</body>
</html>
