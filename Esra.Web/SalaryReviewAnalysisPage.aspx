<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysisPage.aspx.cs"
    Inherits="CAESDO.Esra.Web.SalaryReviewAnalysisPage" Title="ESRA - Salary Review Analysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
<h1 id="page_title"><asp:Label ID="lblPageTitle" runat="server" Text="Salary Review Analysis"></asp:Label></h1>
<%--<div class="left_col_empty"></div>--%>
<div class="right_col">
<div id="SRA_scale">
        <asp:ObjectDataSource ID="odsSalaryReviewAnalysis" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByProperty" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlReferenceNumber" DefaultValue="ReferenceNumber"
                    Name="propertyName" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter DefaultValue="" Name="propertyValue" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsESRAs" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllSalaryReviewAnalysis" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="UserID" Type="String" />
                <asp:SessionParameter DefaultValue="true" Name="isDepartmentUser" SessionField="IsDepartmentUser"
                    Type="Boolean" />
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsGvSalaryReviewAnalysis" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL" DeleteMethod="Delete">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="userId" SessionField="UserID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="false" Name="isDepartmentUser" 
                    SessionField="IsDepartmentUser" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlEmployee" DefaultValue="" Name="employeeID" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlCreatedBy" Name="reviewerLogin" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="tbCreationDate" Name="creationDate" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlReferenceNumber" 
                    Name="salaryReviewAnalysisID" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter DefaultValue="Employee.FullName" Name="propertyName" 
                    Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetEmployees" TypeName="CAESDO.Esra.BLL.EmployeeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="UserID" Type="String" />
                <asp:SessionParameter DefaultValue="true" Name="isDepartmentUser" SessionField="IsDepartmentUser"
                    Type="Boolean" />
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCreatedBy" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUsersInApplication" TypeName="CAESDO.Esra.Web.CatbertManager">
        </asp:ObjectDataSource>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vSelectSalaryReviewAnalysis" runat="server">
                &nbsp;<table id="SRA_table">
                    <tr>
                        <th colspan="4">
                                <h2><asp:Label ID="lblTblSearchCriteriaTitle" runat="server" Text="Search Parameters"></asp:Label></h2>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            &nbsp;Reference Number
                        </th>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlReferenceNumber" runat="server" AppendDataBoundItems="True"
                                AutoPostBack="True" DataSourceID="odsESRAs" 
                                DataTextField="ReferenceNumber" DataValueField="ID"
                                OnSelectedIndexChanged="ddlReferenceNumber_SelectedIndexChanged" 
                                ondatabound="ddlReferenceNumber_DataBound">
                                <asp:ListItem Value="0">-- Select a Reference Number --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlReferenceNumber_ListSearchExtender" runat="server"
                                TargetControlID="ddlReferenceNumber">
                            </ajax:ListSearchExtender>
                        </td>
                        <td colspan="2">
                            (Use today&#39;s date for any date)
                        </td>
                    </tr>
                    <tr>
                        <th>
                            &nbsp;Employee
                        </th>
                        <th>
                            &nbsp;Created By
                        </th>
                        <th>
                            &nbsp;Creation Date
                        </th>
                        <td rowspan="2">
                            <center>
                                <asp:Button ID="btnFindSRA" runat="server" OnClick="btnFindSRA_Click" Text="Find Salary Review Analysis" />
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" AppendDataBoundItems="True"
                                DataSourceID="odsFilteredEmployees" DataTextField="FullName" DataValueField="ID"
                                ondatabound="ddlEmployee_DataBound">
                                <asp:ListItem Value="">-- Any Employee --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlEmployee_ListSearchExtender" runat="server" TargetControlID="ddlEmployee">
                            </ajax:ListSearchExtender>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCreatedBy" runat="server" AppendDataBoundItems="True" DataSourceID="odsCreatedBy"
                                DataTextField="FullName" DataValueField="Login"
                                ondatabound="ddlCreatedBy_DataBound">
                                <asp:ListItem Value="">-- Any Reviewer --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlCreatedBy_ListSearchExtender" runat="server" TargetControlID="ddlCreatedBy">
                            </ajax:ListSearchExtender>
                        </td>
                        <td>
                            <ajax:CalendarExtender ID="ceCreationDate" runat="server" Format="MM/dd/yyyy" TargetControlID="tbCreationDate"
                                PopupPosition="BottomRight" PopupButtonID="btn_calendar" CssClass="calendar">
                            </ajax:CalendarExtender>
                            <img id="btn_calendar" alt="Calendar" longdesc="images/common/Calendar_scheduleHS.png"
                                src="images/common/Calendar_scheduleHS.png" style="width: 16px; height: 16px" />&nbsp;
                            <asp:TextBox ID="tbCreationDate" runat="server" 
                            ondatabound="tbCreationDate_DataBound"/>
                        </td>
                    </tr>
                </table>
                <div id="ESCR_table">
                <asp:GridView ID="gvSalaryReviewAnalysis" runat="server" AutoGenerateColumns="False"
                    EmptyDataText="No Data Found." OnSelectedIndexChanged="gvSalaryReviewAnalysis_SelectedIndexChanged"
                    DataKeyNames="ID" OnRowDeleting="gvSalaryReviewAnalysis_OnRowDeleting" 
                    OnRowDataBound="gvSalaryReviewAnalysis_OnRowDataBound" 
                    ondatabound="gvSalaryReviewAnalysis_DataBound"
                    AllowSorting="True"
		            OnSorting="gvSalaryReviewAnalysis_Sorting" 
                    DataSourceID="odsGvSalaryReviewAnalysis">
                    <HeaderStyle CssClass="tr_head" />
                    <AlternatingRowStyle CssClass="tr_alt" />
                    <Columns>
                        <asp:TemplateField ShowHeader="false">
                        <ItemStyle Width="50px" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnSelect" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="Select" ToolTip="Select" CssClass="buttons"><img src="images/common/edit.png" alt="select" /></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False"
                                 CommandName="Delete" CommandArgument='<%# ((CAESDO.Esra.Core.Domain.SalaryReviewAnalysis)Container.DataItem).ID %>'
                                    Text="Delete" ToolTip="Delete" CssClass="buttons" OnClientClick="return confirm('Are you sure you want to delete this analysis?');" OnClick="gvSalaryReviewAnalysis_OnRowDeleting">
                                    <img src="images/common/delete.png" alt="Delete" class="delete_button" /></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reference Number" SortExpression="ReferenceNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblReferenceNumber" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Originating Department" SortExpression="OriginatingDepartment">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OriginatingDepartment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOriginatingDepartment" runat="server" Text='<%# Eval("OriginatingDepartment.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee" SortExpression="Employee.FullName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Employee") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("Employee.FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title Code" SortExpression="Title">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbTitleCode" runat="server" Text='<%# Bind("Title.TitleCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTitleCode" runat="server" Text='<%# Eval("Title.TitleCode") +"*" %>' Visible='<%# ((bool)Eval("IsReclass") ? true : false ) %>' Font-Bold="true"></asp:Label>
                                <asp:Label ID="lblOriginalTitleCode" runat="server" Text='<%# Eval("CurrentTitleCode") %>'></asp:Label>
                                <%--<asp:Label ID="lblProposedTitleCodeNote" runat="server" Text="*Proposed Title Code." Visible='<%# ((bool)Eval("IsReclass") ? true : false ) %>'></asp:Label>--%>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" SortExpression="DateInitiated"
                            DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="InitiatedByReviewerName" HeaderText="Initiated By Reviewer Name"
                            SortExpression="InitiatedByReviewerName" />
                        <asp:BoundField DataField="DateApproved" HeaderText="Date Approved" SortExpression="DateApproved"
                         DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:TemplateField HeaderText="Approved Scenario" SortExpression="ApprovedScenario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ApprovedScenario.ScenarioNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblApprovedScenario" runat="server" Text='<%# Bind("ApprovedScenario.ScenarioNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" SortExpression="DepartmentComments" />
                        <asp:TemplateField SortExpression="DeansOfficeComments" HeaderText="Deans Office Comments">
                            <ItemTemplate>
                                    <asp:Label ID="lblDeansOfficeComments" runat="server" Text='<%# Eval("DeansOfficeComments" ) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="DeansOfficeComments" runat="server" Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                    
                </asp:GridView>
                </div>
                
                <asp:Panel ID="pnlProposedTitleCodeNote" runat="server">
                <asp:Label ID="lblProposedTitleCodeNote" runat="server" Text="*Proposed Title Code." ></asp:Label>
                </asp:Panel>
                <br />
                &nbsp;<asp:DropDownList ID="ddlNewSAREmployee" runat="server" AppendDataBoundItems="True"
                    DataTextField="FullName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlNewSAREmployee_SelectedIndexChanged"
                    DataSourceID="odsFilteredEmployees">
                    <asp:ListItem Value="0">-- Select an Employee to Create a New Salary Review Analysis --</asp:ListItem>
                </asp:DropDownList>
                <ajax:ListSearchExtender ID="lsexDdlNewSAREmployee" runat="server" TargetControlID="ddlNewSAREmployee">
                </ajax:ListSearchExtender>
                <%--&nbsp;<asp:Button ID="btnCreateNewSalaryReviewAnalysis" runat="server" Text="Create New Salary Review Analysis" OnClick="btnCreateNewSalaryReviewAnalysis_Click"/>--%>
                <%--<asp:LinkButton ID="lbtnCreateNewSalaryReviewAnalysis" runat="server" CssClass="buttons"><img alt="Create New SRA" class="new_button" src="images/common/120px-Document_new_svg.png"/></asp:LinkButton>--%>
            </asp:View>
            <asp:View ID="vNotAuthorized" runat="server">
            <table>
            <tr><td rowspan="2"><asp:Image ID="imgBackArrow" runat="server" 
                    AlternateText="back arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" 
                                OnClick="lbtnBack_Click" Text="Back" /></td><td>Error: Employee is 
                    outside of user&#39;s home or work department.</td></tr>
            <tr><td>Unable view or perform a Salary Review Analysis on this Individual.</td></tr>
            </table>
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
                <div id="divSalaryDetails">
                    <asp:GridView ID="gvSalaryScale" runat="server" AutoGenerateColumns="False" EmptyDataText="Salary Data Unavailable."
                        HeaderStyle-HorizontalAlign="Center" EnableViewState="False" GridLines="None">
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
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title.TitleCode") %>'></asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <asp:Label ID="lblPayrollTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                                            </td>
                                            <%--<td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" 
                                            Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>--%>
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
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </asp:GridView>
                </div>
                <asp:Panel ID="pnlProposedTitle" runat="server">
                <asp:Label ID="lblCurrentTitleCodeLabel" runat="server" Font-Bold="true">Proposed Title:</asp:Label> <asp:Label ID="lblCurrentTitleCode" runat="server" Text="[ProposedTitle]"></asp:Label>
                </asp:Panel>
</div>
<div id="SARP_table">             
                <asp:GridView ID="gvEmployeeTitle" runat="server" AutoGenerateColumns="False" EmptyDataText="Title Data Unavailable."
                    DataSourceID="odsSAREmployee" >
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
                    DataKeyNames="ID" EnableViewState="False" EnableTheming="False" DataSourceID="odsSAREmployee">
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
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DeansOfficeComments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="gvSARDetails" runat="server" AutoGenerateColumns="False" DataSourceID="odsSARDetails" OnRowDataBound="gvSARDetails_OnRowDataBound">
                    <HeaderStyle CssClass="tr_head"/>
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
                <asp:ObjectDataSource ID="odsSARDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByID" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CurrentSarID" Type="Int32" />
                    </SelectParameters> 
                </asp:ObjectDataSource>
                
                &nbsp;<asp:ObjectDataSource ID="odsSAREmployee" runat="server" TypeName="CAESDO.Esra.BLL.SRAEmployeeBLL"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetBySalaryReviewAnalysisID">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CurrentSarID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
                <asp:ObjectDataSource ID="odsTitle" runat="server" TypeName="CAESDO.Esra.BLL.TitleBLL"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CurrentTitleCode"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:LinkButton runat="server" ID="lbtnBack" OnClick="lbtnBack_Click" ToolTip="Back"
                    CssClass="buttons" Text="&lt;img alt=&quot;Back&quot; class=&quot;back_button&quot; 
                    src=&quot;images/common/arrow_left.jpg&quot;/&gt; Back"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbtnEdlt" runat="server" OnClick="lbtnEdit_Click" ToolTip="Edit"
                    CssClass="buttons">Edit <img id="imgEditButton" alt="Edit" class="edit_button" src="images/common/edit.png"/></asp:LinkButton>
                <%--<table style="width: 100%;">
                    <tr>
                        <th>
                            Scenario #
                        </th>
                        <th>
                            Criteria
                        </th>
                        <th>
                            % Increase
                        </th>
                        <th>
                            Salary $
                        </th>
                        <th>
                            Approved
                        </th>
                    </tr>
                    <tr>
                        <td class="style2">
                            1.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria1" runat="server" AutoPostBack="True" DataSourceID="odsCriteria"
                                DataTextField="Key" DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease1" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount1" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved1" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            2.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria2" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease2" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount2" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved2" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            3.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria3" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease3" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount3" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved3" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            4.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria4" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease4" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount4" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved4" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            5.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria5" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease5" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount5" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved5" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            6.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria6" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease6" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount6" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved6" runat="server" GroupName="rbApproved" Text="" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            7.
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCriteria7" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPercentIncrease7" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="tbSalaryAmount7" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbApproved7" runat="server" GroupName="rbApproved" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Dean&#39;s Office Comments:
                        </th>
                        <td colspan="4">
                            <asp:TextBox ID="tbDeansOfficeComments" runat="server" Width="867px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
            </asp:View>
        </asp:MultiView>
    <asp:ObjectDataSource ID="odsCriteria" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCriteriaListItems" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="titleCode" SessionField="titleCode"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFilteredEmployees" runat="server" TypeName="CAESDO.Esra.BLL.EmployeeBLL"
        SelectMethod="GetEmployees">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="UserID" Type="String" />
            <asp:SessionParameter DefaultValue="true" Name="isDepartmentUser" SessionField="IsDepartmentUser"
                Type="Boolean" />
            <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
