<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysisViewer.aspx.cs"
    Inherits="CAESDO.Esra.Web.SalaryReviewAnalysisViewer" Title="ESRA - Salary Review Analysis Viewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <h1 id="page_title">
        <asp:Label ID="lblPageTitle" runat="server" Text="Salary Review Analysis Viewer"></asp:Label></h1>
    <div class="left_col_empty"></div>
    <div class="right_col">
        <div id="SRA_scale">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="vNotAuthorized" runat="server">
                    <table>
                        <tr>
                            <td rowspan="2">
                                <asp:Image ID="imgBackArrow" runat="server" AlternateText="back arrow" CssClass="buttons"
                                    ImageUrl="~/images/common/arrow_left.jpg" Style="width: 14px" /><asp:Button ID="btnBack"
                                        runat="server" OnClick="lbtnBack_Click" Text="Back" />
                            </td>
                            <td>
                                Error: Employee is outside of user&#39;s home or work department.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Unable view or perform a Salary Review Analysis on this Individual.
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vSalaryReviewAnalysis" runat="server">
                    <div id="divSalaryDetails">
                        <asp:GridView ID="gvSalaryScale" runat="server" AutoGenerateColumns="False" EmptyDataText="Salary Data Unavailable."
                            HeaderStyle-HorizontalAlign="Center" EnableViewState="False" GridLines="None">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Campus-wide Salary Scale<br />
                                        <br />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <th>
                                                    Title Code
                                                </th>
                                                <th colspan="2">
                                                    Payroll Title
                                                </th>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:Label ID="lblPayrollTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5">
                                                        <tr>
                                                            <th colspan="5">
                                                                Salary Scales
                                                            </th>
                                                        </tr>
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
                                                                        <asp:Panel ID="pnlQuartiles" runat="server" Visible='<%# !HasSalarySteps(Container) %>'>
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
                                                                        </asp:Panel>
                                                                        <tr>
                                                                            <td colspan="5">
                                                                                <table>
                                                                                    <asp:Panel ID="pnlLM_CollegeAverages" runat="server" Visible='<%# !IsDepartmentUser() %>'>
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
                                                                                    </asp:Panel>
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
                                                                                        <asp:Label ID="lblStepAnnual" runat="server" Text='<%# Eval("Annual","{0:c}") %>'
                                                                                            Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblStepMonthly" runat="server" Text='<%# Eval("Monthly","{0:c}") %>'
                                                                                            Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblStepHourly" runat="server" Text='<%# Eval("Hourly","{0:c}") %>'
                                                                                            Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:GridView>
                    </div>
                    <div id="pnlProposedTitle" runat="server">
                        <asp:Label ID="lblCurrentTitleCodeLabel" runat="server" Font-Bold="true">Proposed Title:</asp:Label>
                        <asp:Label ID="lblCurrentTitleCode" runat="server" Text="[ProposedTitle]"></asp:Label>
                    </div>
        </div>
        <div id="SARP_table">
            <asp:GridView ID="gvEmployeeTitle" runat="server" AutoGenerateColumns="False" EmptyDataText="Title Data Unavailable."
                DataSourceID="odsSAREmployee" GridLines="Both" BorderColor="Black" BorderStyle="Solid">
                <HeaderStyle CssClass="tr_head" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                <AlternatingRowStyle CssClass="tr_alt" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Title Code</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Payroll Title</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeePayrollTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Salary Grade</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Salary Step</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeSalaryStep" runat="server" Text='<%# Eval("SalaryStep") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Bargaining Unit</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeBargainingUnit" runat="server" Text='<%# Eval("BargainingUnitCode") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Report Date</HeaderTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeReportDate" runat="server" Text='<%# String.Format("{0:MM/dd/yyyy}", DateTime.Today) %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" EmptyDataText="Employee Data Unavailable."
                DataKeyNames="ID" EnableViewState="False" EnableTheming="False" DataSourceID="odsSAREmployee"
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                <HeaderStyle CssClass="tr_head" />
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
                            <ajax:CalendarExtender ID="ceAdjustedCareerHireDate" runat="server" CssClass="calendar"
                                TargetControlID="tbAdjustedCareerHireDate" Format="MM/dd/yyyy">
                            </ajax:CalendarExtender>
                            <asp:TextBox ID="tbAdjustedCareerHireDate" runat="server" Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'
                                ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAdjustedCareerHireDate" runat="server" Text='<%# Eval("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'
                                BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.FromName("#97d092") : System.Drawing.Color.Transparent ) %>'
                                CssClass="light_green_edit"></asp:Label>
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
                            <ajax:CalendarExtender ID="ceAdjustedApptHireDate" runat="server" CssClass="calendar"
                                TargetControlID="tbAdjustedApptHireDate" Format="MM/dd/yyyy">
                            </ajax:CalendarExtender>
                            <asp:TextBox ID="tbAdjustedApptHireDate" runat="server" Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'
                                ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAdjustedApptHireDate" runat="server" Text='<%# Eval("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'
                                BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.FromName("#97d092") : System.Drawing.Color.Transparent ) %>'
                                CssClass="light_green_edit"></asp:Label>
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
            <asp:GridView ID="gvSARDetails" runat="server" AutoGenerateColumns="False" DataSourceID="odsSARDetails"
                OnRowDataBound="gvSARDetails_OnRowDataBound" BorderColor="Black" BorderStyle="Solid"
                BorderWidth="1px">
                <HeaderStyle CssClass="tr_head" />
                <AlternatingRowStyle CssClass="tr_alt" />
                <Columns>
                    <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference Number" SortExpression="ReferenceNumber" />
                    <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" SortExpression="DateInitiated"
                        DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:TemplateField HeaderText="Initiated By (Reviewer Name)" SortExpression="InitiatedByReviewerName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InitiatedByReviewerName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("InitiatedByReviewerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Scenarios" SortExpression="Scenarios">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Scenarios") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Repeater runat="server" DataSource='<%# Eval("Scenarios") %>'>
                                <HeaderTemplate>
                                    <table>
                                        <tr class="tr_subhead">
                                            <th>
                                                Scenario
                                            </th>
                                            <th>
                                                Criteria
                                            </th>
                                            <th>
                                                % Increase
                                            </th>
                                            <th>
                                                New Salary $
                                            </th>
                                            <th>
                                                Approved
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td style="font-weight: bold">
                                            <%# Eval("ScenarioNumber") %>.
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddlSelectionType" DataValueField="Key" DataTextField="Key"
                                                DataSourceID="odsCriteria" Enabled="false" SelectedValue='<%# Eval("SelectionType") %>'>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <%# Eval("PercentIncrease", "{0:p}") %>
                                        </td>
                                        <td>
                                            <%# Eval("SalaryAmount", "{0:c}") %>
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" Checked='<%# Convert.ToBoolean(Eval("Approved")) %>'
                                                Enabled="false" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table></FooterTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" SortExpression="DepartmentComments" />
                    <asp:TemplateField HeaderText="Deans Office Comments" SortExpression="DeansOfficeComments">
                        <ItemTemplate>
                            <asp:Label ID="lblDeansOfficeComments" runat="server" Text='<%# Eval("DeansOfficeComments" ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Approved" SortExpression="DateApproved">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbDateApproved" runat="server" Text='<%# Bind("DateApproved") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDateApproved" runat="server" Text='<%# ((Eval("DateApproved") as DateTime?) == null  ? "" : Eval("DateApproved", "{0:MM/dd/yyyy}")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hiddenCurrentSarID" runat="server" />
        <asp:ObjectDataSource ID="odsSARDetails" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByID" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="hiddenCurrentSarID" DefaultValue="0" Name="id" PropertyName="Value"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSAREmployee" runat="server" TypeName="CAESDO.Esra.BLL.SRAEmployeeBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetBySalaryReviewAnalysisID">
            <SelectParameters>
                <asp:ControlParameter ControlID="hiddenCurrentSarID" DefaultValue="0" Name="id" PropertyName="Value"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hiddenCurrentTitleCode" runat="server" />
        <asp:ObjectDataSource ID="odsTitle" runat="server" TypeName="CAESDO.Esra.BLL.TitleBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="hiddenCurrentTitleCode" DefaultValue="0" Name="id"
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:LinkButton runat="server" ID="lbtnBack" OnClick="lbtnBack_Click" ToolTip="Back"
            CssClass="buttons" Text="&lt;img alt=&quot;Back&quot; class=&quot;back_button&quot; 
                    src=&quot;images/common/arrow_left.jpg&quot;/&gt; Back"></asp:LinkButton>
        <asp:LinkButton ID="lbtnEdlt" runat="server" OnClick="lbtnEdit_Click" ToolTip="Edit"
            CssClass="buttons">Edit <img id="imgEditButton" alt="Edit" class="edit_button" src="images/common/edit.png"/></asp:LinkButton>
        <asp:LinkButton ID="lbtnPrint" runat="server" OnClientClick="window.print();return false;"
            ToolTip="Print" CssClass="buttons">Print <img id="imgPrintButton" alt="Print" class="print_button" src="images/common/printer.gif"/></asp:LinkButton>
        </asp:View> </asp:MultiView>
        <asp:ObjectDataSource ID="odsCriteria" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetCriteriaListItems" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="hiddenCurrentTitleCode" DefaultValue="0" Name="titleCode"
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
