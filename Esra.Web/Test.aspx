<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CAESDO.Esra.Web.Test" Title="ESRA - Employees Page"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
<div>
        <br />
        <br />
        &nbsp;<asp:GridView ID="gvTitle" runat="server" 
            AutoGenerateColumns="False" EmptyDataText="Salary Data Unavailable." 
            HeaderStyle-HorizontalAlign="Center" EnableViewState="False">
            <Columns>
                <asp:TemplateField>
                <HeaderTemplate>Campus-wide Salary Scale</HeaderTemplate>
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
                            <tr>
                                <td colspan="5">
                                    <asp:Repeater runat="server" ID="rptSalaryScale" 
                                        DataSource='<%# Eval("SalaryScales") %>'>
                                        <HeaderTemplate><tr><th colspan="5">Salary Scales</th></tr></HeaderTemplate>
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
                                            <%--</tr>
                                            
                                            <tr>--%>
                                                <td colspan="5">
                                                    <table>
                                                        <asp:Repeater runat="server" ID="rptSalarySteps"  OnItemDataBound="rtpSalary_OnItemDataBound" DataSource='<%# Eval("SalarySteps") %>'><HeaderTemplate><tr><th>Step</th><th>Annual</th><th>Monthly</th><th>Hourly</th></tr></HeaderTemplate>
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

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:GridView>
        <br />
    </div>
    <hr />
    <div>
        <br />
                <center><asp:Label ID="Label1" Font-Bold="True" runat="server" 
                        Text="Employee Details" Font-Size="Large"></asp:Label></center><br />
                <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" EmptyDataText="Employee Data Unavailable." 
                    DataKeyNames="ID"  
                    EnableViewState="False" EnableTheming="False">
                    <Columns>
                        
                        <asp:TemplateField HeaderText="Department Name">
  
                            <EditItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>' />
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HomeDepartment") %>'></asp:TextBox>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title Code">
                            <EditItemTemplate><asp:Label ID="lblEditTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTitleCode" runat="server" 
                                    Text='<%# Eval("TitleCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bargaining Unit">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee Name">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hire Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                    
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Eval("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>' 
                                    BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Years Of Service">
                            <EditItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Begin Date (in Title)">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" 
                                    Text='<%# Eval("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>' BackColor='<%# ((bool)Eval("ApptDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White )  %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time In Title">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pay Rate">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" 
                                    Text='<%# Bind("DepartmentComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("DepartmentComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dean's Office Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" 
                                    Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
                            </ItemTemplate>
                        
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
    
&nbsp;<asp:ObjectDataSource ID="odsEmployee" runat="server" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetByID" 
            UpdateMethod="UpdateRecord">
            <UpdateParameters>
                <asp:Parameter Name="AdjustedCareerHireDate" Type="String" />
                <asp:Parameter Name="AdjustedApptHireDate" Type="String" />
                <asp:Parameter Name="DepartmentComments" Type="String" />
                <asp:Parameter Name="DeansOfficeComments" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsTitle" runat="server"  
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <br />
    </div>
</asp:Content>
