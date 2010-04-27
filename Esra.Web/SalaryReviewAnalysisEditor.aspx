<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysisEditor.aspx.cs"
    Inherits="CAESDO.Esra.Web.SalaryReviewAnalysisEditor" Title="ESRA - Salary Review Analysis Editor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">

    <script type="text/javascript">
        function ConfirmMe() {
            //if (Page_ClientValidate())
            return confirm('Are you sure you want to save this salary review analysis?');

            return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <center>
        <asp:Label ID="lblPageTitle" runat="server" Text="Salary Review Analysis Editor"
            Font-Bold="True" Font-Size="Larger"></asp:Label></center>
    <br />
    <div id="divSalaryDetails">
        <hr />
        <br />
        <center>
            <asp:Label ID="lblSalaryDetails" runat="server" Text="Salary Scale Details" Font-Bold="True"
                Font-Size="Large"></asp:Label></center>
        <br />
        <asp:GridView ID="gvTitle" runat="server" AutoGenerateColumns="False" EmptyDataText="Salary Data Unavailable."
            HeaderStyle-HorizontalAlign="Center" EnableViewState="False" DataSource='<%# Titles %>'>
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
                             <asp:Panel ID="pnlNoSalaryScale" runat="server" Visible='<%# ((int)Eval("SalaryScales.Count") == 0 ? true : false) %>'>
                            <tr><th colspan="5">Salary Scales</th></tr>
                            <tr>
                            <td colspan="5">
                                No Data Available.
                            </td>
                            </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnlSalaryScale" runat="server" Visible='<%# ((int)Eval("SalaryScales.Count") > 0 ? true : false) %>'>
                            
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
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            </asp:Panel>
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
        <asp:GridView ID="gvEmployeeTitle" runat="server" AutoGenerateColumns="False" Width="100%"
            DataSource='<%# Employees %>'>
            <HeaderStyle CssClass="tr_head" />
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
                        <asp:Label ID="lblEmployeeSalaryGrade" runat="server" Text='<%# Eval("Title.SalaryGrade") %>'></asp:Label></ItemTemplate>
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
                        <asp:Label ID="lblEmployeeBargainingUnit" runat="server" Text='<%# Eval("Title.BargainingCode") %>'></asp:Label></ItemTemplate>
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
            DataKeyNames="ID" EnableViewState="False" EnableTheming="False" DataSource='<%# Employees %>'>
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
                        <ajax:CalendarExtender ID="ceAdjustedCareerHireDate" runat="server" CssClass="calendar"
                            TargetControlID="tbAdjustedCareerHireDate" Format="MM/dd/yyyy">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbAdjustedCareerHireDate" runat="server" Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'
                            ReadOnly="true"></asp:TextBox>
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
                        <ajax:CalendarExtender ID="ceAdjustedApptHireDate" runat="server" CssClass="calendar"
                            TargetControlID="tbAdjustedApptHireDate" Format="MM/dd/yyyy">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbAdjustedApptHireDate" runat="server" Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'
                            ReadOnly="true"></asp:TextBox>
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
                        <asp:TextBox ID="tbEmployeeDeansOfficeCommentsEdit" runat="server" Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="tbEmployeeDeansOfficeComments" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
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
        <center>
            <asp:Label runat="server" ID="lblSalaryReviewAnalysisTitle" Text="Salary Review Analysis"
                Font-Bold="True" Font-Size="Large"></asp:Label>
        </center>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vNoSalaryDataAvailable" runat="server">
            <table>
            <tr><td rowspan="2"><asp:Image ID="Image2" runat="server" 
                    AlternateText="back arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" 
                                OnClick="btnCancelSalaryReviewAnalysis_Click" Text="Cancel/Back" /></td><td>Error: Salary Scale Data Unavailable for this Title Code.</td></tr>
            <tr><td>Unable to perform a Salary Review Analysis on this Individual.</td></tr>
            </table>
                <%--Error: Salary Scale Data Unavailable for this Title Code.<br />
                Unable to perform a Salary Review Analysis on this Individual.<br /><br />
                <asp:Image ID="imgArrowBack" runat="server" 
                    AlternateText="back arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />&nbsp;&nbsp;
                <asp:Button ID="btnCancelSalaryReviewAnalysis1" runat="server" 
                                OnClick="btnCancelSalaryReviewAnalysis_Click" Text="Cancel/Back" />--%>
            </asp:View>
            <asp:View ID="vNotAuthorized" runat="server">
            <table>
            <tr><td rowspan="2"><asp:Image ID="imgBackArrow" runat="server" 
                    AlternateText="back arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" 
                                OnClick="btnCancelSalaryReviewAnalysis_Click" Text="Back" /></td><td>Error: Employee is 
                    outside of user&#39;s home or work department.</td></tr>
            <tr><td>Unable view or perform a Salary Review Analysis on this Individual.</td></tr>
            </table>
            </asp:View>
            <asp:View ID="vSelectSalaryReviewType" runat="server">
                <asp:Label ID="lblOriginalTitleCodeLabel" runat="server" Font-Bold="true">Current Title Code:</asp:Label> <asp:Label ID="lblOriginalTitleCode" runat="server" Text="Title Code"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblCurrentTitleCodeLabel" runat="server" Font-Bold="true">Proposed Title Code:</asp:Label> <asp:Label ID="lblCurrentTitleCode" runat="server" Text="Title Code"></asp:Label>
                <br />
                <br />
                <table id="tblCurrentProposedTitleCodes">
                    <tr>
                        <td><asp:DropDownList ID="ddlProposedTitleCode" runat="server" AutoPostBack="True" DataSourceID="odsProposedTitleCodes"
                    DataTextField="TitleCode_Name" DataValueField="TitleCode" OnSelectedIndexChanged="ddlProposedTitleCode_SelectedIndexChanged">
                </asp:DropDownList></td>
                <td><asp:Image ID="imgReclassArrow" runat="server" 
                    AlternateText="reclass arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />
                &nbsp;Select a different Title Code to conduct a Reclassification Review.</td>
                    </tr>
                    <tr>
                        <td ><center>-- or --</center></td><td></td>
                    </tr>
                    <tr>
                        <th><asp:Button ID="Button1" runat="server" Text="Perform Equity Review" OnClick="btnDoEquityReview_Click" /></th>
                        <td><asp:Image ID="Image1" runat="server" AlternateText="equity arrow" 
                    CssClass="buttons" ImageUrl="~/images/common/arrow_left.jpg" />
                &nbsp;Select &quot;Perform Equity Review&quot; to conduct an Equity Review.</td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="btnCancelSalaryReviewAnalysis0" runat="server" 
                                OnClick="btnCancelSalaryReviewAnalysis_Click" Text="Cancel/Back" />
                        </th>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <%--<asp:DropDownList ID="ddlProposedTitleCode" runat="server" AutoPostBack="True" DataSourceID="odsProposedTitleCodes"
                    DataTextField="TitleCode_Name" DataValueField="TitleCode" OnSelectedIndexChanged="ddlProposedTitleCode_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;<asp:Image ID="imgReclassLeftArrow" runat="server" 
                    AlternateText="reclass arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />
                &nbsp;Select a different Title Code to conduct a Reclassification Review.<br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- or --<br />
                <br />
                <asp:Button ID="btnDoEquityReview" runat="server" Text="Perform Equity Review" OnClick="btnDoEquityReview_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="imgEquityLeftArrow" runat="server" AlternateText="equity arrow" 
                    CssClass="buttons" ImageUrl="~/images/common/arrow_left.jpg" />
                &nbsp;Select &quot;Perform Equity Review&quot; to conduct an Equity Review.--%>
                <asp:ObjectDataSource ID="odsProposedTitleCodes" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                    TypeName="CAESDO.Esra.BLL.TitleBLL">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
               
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
                <table id="tblSRAMain" border="1" cellpadding="2" cellspacing="0" width="100%">
                    <%--<th colspan="2">Abbreviated Name</th>--%>
                    <%--<tr>
                        <td>
                            <asp:Label ID="lblTblSRAMain_CurrentTitleCodeTitle" runat="server" Text="Original Title Code:"
                                Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblTblSRAMain_CurrentTitleCode" runat="server"></asp:Label>
                        </td>
                    </tr>--%>
                    <asp:Panel ID="pnlProposedTitle" runat="server">
                    <tr>
                        <td>
                            <asp:Label ID="blTblSRAMain_ProposedTitleCodeTitle" runat="server" Text="Proposed Title:"
                                Font-Bold="True"></asp:Label>&nbsp;
                            <asp:Label ID="lblTblSRAMain_TitleCode" runat="server"></asp:Label>
                        </td>
                    </tr>
                    </asp:Panel>
                    <tr>
                        <td>
                            <asp:GridView ID="gvSalaryReviewAnaysis" runat="server" AutoGenerateColumns="False"
                                DataSourceID="odsSalaryReviewAnalysis"
                                 EmptyDataText="Salary Review Analysis has yet to be saved."
                                Width="100%"
                                OnRowUpdating="gvSalaryReviewAnaysis_OnRowUpdating">
                                <HeaderStyle CssClass="tr_head" />
                                <AlternatingRowStyle CssClass="tr_alt" />
                                <Columns>
                                    <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference Number" SortExpression="ReferenceNumber" />
                                    <asp:BoundField DataField="DateInitiated" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date Initiated"
                                        SortExpression="DateInitiated" />
                                    <asp:TemplateField HeaderText="Date Approved" SortExpression="DateApproved">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbDateApproved" runat="server" Text='<%# Bind("DateApproved") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                        <asp:UpdatePanel ID="upDateApproved" runat="server" UpdateMode="Conditional"><ContentTemplate>
                                            <img id="button_calendar" alt="Calendar" src="images/common/Calendar_scheduleHS.png" />&nbsp;
                                            <asp:TextBox ID="tbDateApproved" runat="server" Text='<%# Bind("DateApproved", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajax:CalendarExtender ID="tbDateApproved_CalendarExtender" runat="server" Format="MM/dd/yyyy"
                                                TargetControlID="tbDateApproved" CssClass="calendar" PopupButtonID="button_calendar">
                                            </ajax:CalendarExtender>
                                            <%--<asp:Label ID="lblDateApproved" runat="server" 
                                    Text='<%# Bind("DateApproved", "{0:MM/dd/yyyy}") %>'></asp:Label>--%>
                                    </ContentTemplate>
                                        </asp:UpdatePanel>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Initiated By (Reviewer Name)" SortExpression="InitiatedByReviewerName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("InitiatedByReviewerName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("InitiatedByReviewerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="upScenarios">
                                <ContentTemplate>
                                    <asp:Repeater runat="server" ID="rptScenarios">
                                        <HeaderTemplate>
                                            <table border="1" cellpadding="2" cellspacing="0" width="100%">
                                                <tr class="tr_subhead">
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
                                                    <th>
                                                        &nbsp
                                                    </th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="lblScenarioNumber" runat="server" Text='<%# (Container.ItemIndex + 1) + "."%>'></asp:Label><asp:HiddenField
                                                        ID="scenarioId" runat="server" Value='<%# Eval("ID") %>' />
                                                </th>
                                                <td>
                                                    <asp:DropDownList ID="ddlCriteria" runat="server" AutoPostBack="True" DataSource='<%# Criteria %>'
                                                        DataTextField="Key" DataValueField="Value" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCriteria_SelectedIndexChanged"
                                                        SelectedValue='<%# GetSelectedValue(Container) %>'>
                                                        <%--<asp:ListItem Text="-- Select Target Criteria --" Value=""></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbPercentIncrease" runat="server" Text='<%# Eval("PercentIncrease", "{0:p}") %>'
                                                        OnTextChanged="tbPercentIncrease_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbSalaryAmount" runat="server" Text='<%# Eval("SalaryAmount", "{0:c}") %>'
                                                        OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <%--<asp:RadioButton ID="rbApproved" runat="server" GroupName="rbApproved" Text="" />&nbsp;--%>
                                                    <asp:CheckBox ID="cbxApproved" runat="server" OnCheckedChanged="cbxApproved_CheckChanged"
                                                        Checked='<%# Eval("Approved") %>' AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnReset" runat="server" Text="Reset" CommandName="rptScenarios_ItemCommand"
                                                        CommandArgument="resetFields" />&nbsp;
                                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="buttons" CommandName="remove"
                                                        CommandArgument='<%# Container.ItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this scenario?');"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="lblScenarioNumberAlt" runat="server" Text='<%# (Container.ItemIndex + 1) + "."%>' /><asp:HiddenField
                                                        ID="scenarioIdAlt" runat="server" Value='<%# Eval("ID") %>
                                                ' />
                                                </th>
                                                <td>
                                                    <asp:DropDownList ID="ddlCriteriaAlt" runat="server" AutoPostBack="True" DataSource='<%# Criteria %>'
                                                        DataTextField="Key" DataValueField="Value" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCriteria_SelectedIndexChanged"
                                                        SelectedValue='<%# GetSelectedValue(Container) %>'>
                                                        <%--<asp:ListItem Text="-- Select Target Criteria --" Value=""></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbPercentIncreaseAlt" runat="server" Text='<%# Eval("PercentIncrease", "{0:p}") %>'
                                                        OnTextChanged="tbPercentIncrease_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbSalaryAmountAlt" runat="server" Text='<%# Eval("SalaryAmount", "{0:c}") %>'
                                                        OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <%-- <asp:RadioButton ID="rbApprovedAlt" runat="server" GroupName="rbApproved" Text="" />&nbsp;--%>
                                                    <asp:CheckBox ID="cbxApprovedAlt" runat="server" OnCheckedChanged="cbxApproved_CheckChanged"
                                                        Checked='<%# Eval("Approved") %>' AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnResetAlt" runat="server" Text="Reset" CommandName="rptScenarios_ItemCommand"
                                                        CommandArgument="resetFields" />&nbsp;
                                                    <asp:LinkButton ID="btnDeleteAlt" runat="server" CssClass="buttons" CommandName="remove"
                                                        CommandArgument='<%# Container.ItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this scenario?');"><img src="images/common/delete.png" alt="Delete" class="delete_button" /></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                        <FooterTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblDepartmentCommentsFooter" runat="server" Font-Bold="True" Text='<%# (IsDepartmentUser() ? "Comments:" : "Department Comments:") %>'></asp:Label>
                                                </td>
                                                <td colspan="5">
                                                    <asp:TextBox ID="tbSalaryReviewAnalysisDepartmentCommentsFooter" runat="server" TextMode="MultiLine"
                                                        CssClass="comments" Text='<%# ViewState[KEY_DEPARTMENT_COMMENTS] %>' OnTextChanged="tbSalaryReviewAnalysisDepartmentCommentsFooter_TextChanged"
                                                        AutoPostBack="True" Visible='<%# IsDepartmentUser() %>'></asp:TextBox>
                                                    <asp:Label ID="lblSalaryReviewAnalysisDepartmentCommentsFooter" runat="server" CssClass="comments"
                                                        Visible='<%# !IsDepartmentUser() %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="pnlDeansOfficeComments" runat="server" Visible='<%# !IsDepartmentUser() %>'>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCommentFooter" runat="server" Font-Bold="True">Comments:</asp:Label>
                                                    </td>
                                                    <td colspan="5">
                                                        <asp:TextBox ID="tbSalaryReviewAnalysisDeansOfficeCommentsFooter" runat="server"
                                                            TextMode="MultiLine" CssClass="comments" Text='<%# ViewState[KEY_DEANS_OFFICE_COMMENTS] %>'
                                                            OnTextChanged="tbSalaryReviewAnalysisDeansOfficeCommentsFooter_TextChanged" AutoPostBack="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:LinkButton ID="btnAddAnotherScenario" runat="server" Text="Add another scenario"
                                                        OnClick="btnAddAnotherScenario_Click" />
                                                </td>
                                            </tr>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <%--&nbsp;<asp:Button ID="btnSubmitSalaryReviewAnalysis" runat="server" OnClick="btnSubmitSalaryReviewAnalysis_Click"
                                Text="Save Salary Review Analysis" ValidationGroup="saveSalaryReviewAnalysis"
                                OnClientClick="return ConfirmMe()" />
                            &nbsp;--%>
                            &nbsp;<asp:Button ID="btnSubmitSalaryReviewAnalysis" runat="server" OnClick="btnSubmitSalaryReviewAnalysis_Click"
                                Text="Save Salary Review Analysis" ValidationGroup="saveSalaryReviewAnalysis"/>
                            &nbsp;
                            <asp:Button ID="btnCancelSalaryReviewAnalysis" runat="server" OnClick="btnCancelSalaryReviewAnalysis_Click"
                                Text="Cancel/Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <asp:ObjectDataSource ID="odsCriteria" runat="server" OldValuesParameterFormatString="original_{0}"
            TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" SelectMethod="GetCriteriaListItems">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="titleCode" SessionField="TitleCode"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSalaryReviewAnalysis" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByProperty" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="propertyValue" SessionField="ReferenceNumber"
                    Type="Object" />
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
    </style>
</asp:Content>
