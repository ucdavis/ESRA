<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs"
    Inherits="CAESDO.Esra.Web.Test" Title="ESRA - Employees Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="divSalaryDetails">
        <hr /><br />
        <center><asp:Label ID="lblSalaryDetails" runat="server" Text="Salary Scale Details" 
                Font-Bold="True" Font-Size="Large"></asp:Label></center><br />
        <asp:GridView ID="gvTitle" runat="server" AutoGenerateColumns="False" EmptyDataText="Salary Data Unavailable."
            HeaderStyle-HorizontalAlign="Center" EnableViewState="False">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Campus-wide Salary Scale</HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>
                                    Title Code
                                </th>
                                <th colspan="2">
                                    Payroll Title
                                </th>
                                <%--<th colspan="2">Abbreviated Name</th>--%></tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="lblPayrollTitle" runat="server" Text='<%# Eval("PayrollTitle") %>'></asp:Label>
                                </td>
                                <%--<td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" 
                                            Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>--%>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Repeater runat="server" ID="rptSalaryScale" DataSource='<%# Eval("SalaryScales") %>'>
                                        <HeaderTemplate>
                                            <tr>
                                                <th colspan="5">
                                                    Salary Scales
                                                </th>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <th colspan="2">
                                                        Effective Date:
                                                    </th>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("SalaryGradeQuartiles.EffectiveDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Salary Grade:
                                                    </th>
                                                    <td>
                                                        <asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Eval("SalaryGradeQuartiles.SalaryGrade") %>'></asp:Label>
                                                    </td>
                                                    <th colspan="2">
                                                        Bargaining Unit:
                                                    </th>
                                                    <td>
                                                        <asp:Label ID="lblBargainingUnitCode" runat="server" Text='<%# Eval("BargainingCode") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5">
                                                        <table>
                                                            <tr>
                                                                <th>
                                                                    Quartile
                                                                </th>
                                                                <th>
                                                                    Annual
                                                                </th>
                                                                <th>
                                                                    Monthly
                                                                </th>
                                                                <th>
                                                                    Hourly
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    Min
                                                                </th>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MinAnnual","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MinMonthly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MinHourly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    First
                                                                </th>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleAnnual","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleMonthly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("SalaryGradeQuartiles.FirstQrtleHourly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    Mid
                                                                </th>
                                                                <td>
                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MidAnnual","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MidMonthly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MidHourly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    Third
                                                                </th>
                                                                <td>
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleAnnual","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleMonthly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("SalaryGradeQuartiles.ThirdQrtleHourly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    Max
                                                                </th>
                                                                <td>
                                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MaxAnnual","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MaxMonthly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("SalaryGradeQuartiles.MaxHourly","{0:c}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="5">
                                                                    <table>
                                                                        <tr>
                                                                            <th>
                                                                                Labor Market WAS:
                                                                            </th>
                                                                            <td>
                                                                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("LaborMarketWAS","{0:c}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                Labor Market Mid:
                                                                            </th>
                                                                            <td>
                                                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("LaborMarketMidAnnual","{0:c}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                College Average:
                                                                            </th>
                                                                            <td>
                                                                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("CollegeAverageAnnual","{0:c}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                Campus Average:
                                                                            </th>
                                                                            <td>
                                                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("CampusAverageAnnual","{0:c}") %>'></asp:Label>
                                                                            </td>
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
                                                            <asp:Repeater runat="server" ID="rptSalarySteps" OnItemDataBound="rtpSalary_OnItemDataBound"
                                                                DataSource='<%# Eval("SalarySteps") %>'>
                                                                <HeaderTemplate>
                                                                    <tr>
                                                                        <th>
                                                                            Step
                                                                        </th>
                                                                        <th>
                                                                            Annual
                                                                        </th>
                                                                        <th>
                                                                            Monthly
                                                                        </th>
                                                                        <th>
                                                                            Hourly
                                                                        </th>
                                                                    </tr>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <th>
                                                                            <asp:Label ID="lblStep" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label>
                                                                        </th>
                                                                        <td>
                                                                            <asp:Label ID="lblStepAnnual" runat="server" Text='<%# Eval("Annual","{0:c}") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblStepMonthly" runat="server" Text='<%# Eval("Monthly","{0:c}") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblStepHourly" runat="server" Text='<%# Eval("Hourly","{0:c}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:GridView>
        <br />
    </div>
    <hr />
    <div id="divEmployeeDetails">
        <br />
        <center>
            <asp:Label ID="Label1" Font-Bold="True" runat="server" Text="Employee Details" Font-Size="Large"></asp:Label></center>
        <br />
        <asp:GridView ID="gvEmployeeTitle" runat="server" AutoGenerateColumns="False" EmptyDataText="Title Data Unavailable.">
            <HeaderStyle cssclass="tr_head" />
            <AlternatingRowStyle CssClass="tr_alt" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>Title Code</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeeTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Payroll Title</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeePayrollTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Salary Grade</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeeSalaryGrade" runat="server" Text='<%# Eval("Title.SalaryGrade") %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Salary Step</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeeSalaryStep" runat="server" Text='<%# Eval("SalaryStep") %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <HeaderTemplate>Bargaining Unit</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeeBargainingUnit" runat="server" Text='<%# Eval("Title.BargainingCode") %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Report Date</HeaderTemplate>
                    <EditItemTemplate></EditItemTemplate>
                    <ItemTemplate><asp:Label ID="lblEmployeeReportDate" runat="server" Text='<%# String.Format("{0:MM/dd/yyyy}", DateTime.Today) %>'></asp:Label></ItemTemplate>
                </asp:TemplateField>
             </Columns>
        </asp:GridView>
        <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" EmptyDataText="Employee Data Unavailable."
            DataKeyNames="ID" EnableViewState="False" EnableTheming="False">
            <HeaderStyle cssclass="tr_head" />
            <AlternatingRowStyle CssClass="tr_alt" />
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
                    <EditItemTemplate>
                        <asp:Label ID="lblEditTitleCode" runat="server" Text='<%# Eval("TitleCode") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bargaining Unit">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
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
                     <ajax:CalendarExtender ID="ceAdjustedCareerHireDate" runat="server" CssClass="calendar" TargetControlID="tbAdjustedCareerHireDate" Format="MM/dd/yyyy">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbAdjustedCareerHireDate" runat="server" Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>' ReadOnly="true"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAdjustedCareerHireDate" runat="server" Text='<%# Eval("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'
                            BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White ) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Years Of Service">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Begin Date (in Title)">
                    <EditItemTemplate>
                        <ajax:CalendarExtender ID="ceAdjustedApptHireDate" runat="server" CssClass="calendar" TargetControlID="tbAdjustedApptHireDate" Format="MM/dd/yyyy">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbAdjustedApptHireDate" runat="server" Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>' ReadOnly="true"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAdjustedApptHireDate" runat="server" Text='<%# Eval("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'
                            BackColor='<%# ((bool)Eval("ApptDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White )  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time In Title">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay Rate">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeePayRate" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DepartmentComments") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("DepartmentComments") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dean's Office Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        &nbsp;<asp:ObjectDataSource ID="odsEmployee" runat="server" TypeName="CAESDO.Esra.BLL.EmployeeBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByID" UpdateMethod="UpdateRecord">
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
        <asp:ObjectDataSource ID="odsTitle" runat="server" TypeName="CAESDO.Esra.BLL.TitleBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    </div>
    <div id="divSAR">
        <table id="tblSARMain" border="1" cellpadding="2" cellspacing="0" width="100%">
           <%-- <tr>
                <th>
                    TitleCode
                </th>
                <th colspan="4">
                    Payroll Title
                </th>
                <th>
                    Salary Grade
                </th>
                <th>
                    Salary Step
                </th>
                <th>
                    Bargaining Unit
                </th>
                <th class="style1">
                    Report Date
                </th>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblTblTitleHeaderTitleCode"></asp:Label>
                </td>
                <td colspan="4">
                    <asp:Label runat="server" ID="lblTblTitleHeaderPayrollTitle"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblTitleHeaderSalaryGrade"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblTitleHeaderSalaryStep"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblTitleHeaderBargainingUnit"></asp:Label>
                </td>
                <td class="style1">
                    <asp:Label runat="server" ID="lblTblTitleHeaderReportDate"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>
                    Department Name
                </th>
                <th>
                    Employee Name
                </th>
                <th>
                    Hire Date
                </th>
                <th>
                    Years of Service
                </th>
                <th>
                    Begin Date (in Title)
                </th>
                <th>
                    Tile in Title
                </th>
                <th>
                    Pay Rate
                </th>
                <th>
                    Department Comments
                </th>
                <th>
                    Dean's Office Comments
                </th>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsDeptName"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsEmpName"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsHireDate"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsYearsOfService"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsBeginDate"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsTimeInTitle"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsPayRate"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsDepartmentComments"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblTblEmpDetailsDeansOfficeComments"></asp:Label>
                </td>
            </tr>--%>
            <tr>
                <td colspan="9">
                    <asp:UpdatePanel runat="server" ID="upScenarios">
                        <ContentTemplate>
                            <asp:Repeater runat="server" ID="rptScenarios">
                                <HeaderTemplate>
                                    <table border="1" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <th>
                                                Scenario No.
                                            </th>
                                            <th>
                                                Criteria
                                            </th>
                                            <th>
                                                Percent Increase (%)
                                            </th>
                                            <th>
                                                New Annual Salary ($)
                                            </th>
                                            <th>
                                                Approved
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# (Container.ItemIndex + 1) + "."%><%--<asp:HiddenField ID="scenarioId" runat="server"
                                                Value='<%# Eval("ID") %>' />--%>
                                        </th>
                                        <td>
                                            <asp:DropDownList ID="ddlCriteria" runat="server" AutoPostBack="True" DataSourceID="odsCriteria"
                                                DataTextField="Key" DataValueField="Value" AppendDataBoundItems="true"  OnSelectedIndexChanged="ddlCriteria_SelectedIndexChanged"><%--<asp:ListItem Text="-- Select Target Criteria --" Value=""></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbPercentIncrease" runat="server" Text='<%# Eval("PercentIncrease") %>' OnTextChanged="tbPercentIncrease_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbSalaryAmount" runat="server" Text='<%# Eval("SalaryAmount") %>' OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="upRBApproved" runat="server">
                                            <ContentTemplate><asp:RadioButton ID="rbApproved" runat="server" GroupName="rbApproved" Text="" />
                                            <asp:Button ID="btnReset" runat="server" Text="Reset" CommandName="rptScenarios_ItemCommand" CommandArgument="resetApproved" /></ContentTemplate>
                                            
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr>
                                        <th>
                                            <%# (Container.ItemIndex + 1) + "."%><%--<asp:HiddenField ID="scenarioId" runat="server"
                                                Value='<%# Eval("ID") %>' />--%>
                                        </th>
                                        <td>
                                            <asp:DropDownList ID="ddlCriteriaAlt" runat="server" AutoPostBack="True" DataSourceID="odsCriteria"
                                                DataTextField="Key" DataValueField="Value"  AppendDataBoundItems="true"  OnSelectedIndexChanged="ddlCriteria_SelectedIndexChanged" ><%--<asp:ListItem Text="-- Select Target Criteria --" Value=""></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbPercentIncrease" runat="server" Text='<%# Eval("PercentIncrease") %>' OnTextChanged="tbPercentIncrease_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbSalaryAmount" runat="server" Text='<%# Eval("SalaryAmount") %>' OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="upRBApprovedAlt" runat="server">
                                            <ContentTemplate><asp:RadioButton ID="rbApprovedAlt" runat="server" GroupName="rbApproved" Text="" />
                                            <asp:Button ID="btnResetAlt" runat="server" Text="Reset" CommandName="rptScenarios_ItemCommand" CommandArgument="resetApproved" /></ContentTemplate>
                                            
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    <tr>
                                        <th>
                                            Comments
                                        </th>
                                        <td colspan="4">
                                            <asp:TextBox ID="tbDeansOfficeComments" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="odsCriteria" runat="server" OldValuesParameterFormatString="original_{0}"
            TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
            SelectMethod="GetCriteriaListItems">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="titleCode" SessionField="TitleCode" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #tblTitleHeader
        {
            width: 1219px;
        }
        .style1
        {
            width: 203px;
        }
    </style>
</asp:Content>
