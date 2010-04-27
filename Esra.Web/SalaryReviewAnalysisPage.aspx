<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysisPage.aspx.cs"
    Inherits="CAESDO.Esra.Web.SalaryReviewAnalysisPage" Title="ESRA - Salary Review Analysis Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
  <center><asp:Label ID="lblPageTitle" runat="server" Text="Salary Review Analysis" Font-Bold="true" Font-Size="Larger"></asp:Label></center>
 <br />
 <hr />
 <br />
    <div>
        <asp:ObjectDataSource ID="odsSalaryReviewAnalysis" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByProperty" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlReferenceNumber" DefaultValue="ReferenceNumber"
                    Name="propertyName" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter DefaultValue="" Name="propertyValue" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsESRAs" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAll" TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAll" TypeName="CAESDO.Esra.BLL.EmployeeBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
         <asp:ObjectDataSource ID="odsCreatedBy" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUsersInApplication" 
            TypeName="CAESDO.Esra.Web.CatbertManager">
           
        </asp:ObjectDataSource>
       
 
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vSelectSalaryReviewAnalysis" runat="server">
                &nbsp;<table style="width: 75%;" id="tblSearchCriteria" border="1" cellpadding="2" cellspacing="0">
                    <tr>
                        <td colspan="4"><center>
                            <asp:Label ID="lblTblSearchCriteriaTitle" runat="server" 
                                Text="Search Parameters" Font-Size="Large" Font-Bold="True"></asp:Label></center></td>
                    </tr>
                    <tr>
                        <th>
                            &nbsp;Reference Number
                        </th>
                        <td>&nbsp;<asp:DropDownList ID="ddlReferenceNumber" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="odsESRAs" 
                                DataTextField="ReferenceNumber" DataValueField="ID" 
                                onselectedindexchanged="ddlReferenceNumber_SelectedIndexChanged">
                            <asp:ListItem Value="0">-- Select a Reference Number --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlReferenceNumber_ListSearchExtender" 
                                runat="server" TargetControlID="ddlReferenceNumber">
                            </ajax:ListSearchExtender>
                        </td>
                        <td colspan="2">(Use today&#39;s date for any date)</td>
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
                                <asp:Button ID="btnFindSRA" runat="server" onclick="btnFindSRA_Click" 
                                    Text="Find Salary Review Analysis" />
                            </center>
                        </td>
                        
                    </tr>
                  
                    <tr>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" AppendDataBoundItems="True" 
                                DataSourceID="odsEmployee" DataTextField="FullName" DataValueField="ID">
                                <asp:ListItem Value="">-- Any Employee --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlEmployee_ListSearchExtender" runat="server" 
                                TargetControlID="ddlEmployee">
                            </ajax:ListSearchExtender>
                        </td>
                        <td>
                            &nbsp;<br />
                            <asp:DropDownList ID="ddlCreatedBy" runat="server" AppendDataBoundItems="True" 
                                DataSourceID="odsCreatedBy" DataTextField="FullName" DataValueField="Login">
                                <asp:ListItem Value="">-- Any Reviewer --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlCreatedBy_ListSearchExtender" runat="server" 
                                TargetControlID="ddlCreatedBy">
                            </ajax:ListSearchExtender>
                        </td>
                        <td>
                            <ajax:CalendarExtender ID="ceCreationDate" runat="server"  
                                Format="MM/dd/yyyy" TargetControlID="tbCreationDate" 
                                PopupPosition="BottomRight" PopupButtonID="btn_calendar" CssClass="calendar">
                            </ajax:CalendarExtender><img id="btn_calendar" alt="Calendar" longdesc="images/common/Calendar_scheduleHS.png" 
                                src="images/common/Calendar_scheduleHS.png" style="width: 16px; height: 16px" />&nbsp;
                            <asp:TextBox ID="tbCreationDate" runat="server" />
                            </td>
                    </tr>
                  
                </table>
                <br />
                <asp:GridView ID="gvSalaryReviewAnalysis" runat="server" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No Data Found." 
                    onselectedindexchanged="gvSalaryReviewAnalysis_SelectedIndexChanged" 
                    DataKeyNames="ID" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Reference Number" SortExpression="ReferenceNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Employee" SortExpression="Employee">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Employee") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("Employee.FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" SortExpression="DateInitiated" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="InitiatedByReviewerName" HeaderText="Initiated By Reviewer Name"
                            SortExpression="InitiatedByReviewerName" />
                        <asp:BoundField DataField="DateApproved" HeaderText="Date Approved" SortExpression="DateApproved" />
                        <asp:TemplateField HeaderText="ApprovedScenario" SortExpression="ApprovedScenario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ApprovedScenario.ScenarioNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblApprovedScenario" runat="server" Text='<%# Bind("ApprovedScenario.ScenarioNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" SortExpression="DepartmentComments" />--%>
                        <asp:BoundField DataField="DeansOfficeComments" HeaderText="Deans Office Comments"
                            SortExpression="DeansOfficeComments" />
                    </Columns>
                </asp:GridView>
                <br />
                <hr />
                <br />
                &nbsp;<asp:DropDownList ID="ddlNewSAREmployee" runat="server" AppendDataBoundItems="True" 
                                DataSourceID="odsEmployee" DataTextField="FullName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlNewSAREmployee_SelectedIndexChanged">
                                <asp:ListItem Value="0">-- Select an Employee to Create a New Salary Review Analysis --</asp:ListItem>
                            </asp:DropDownList>
                <ajax:ListSearchExtender ID="lsexDdlNewSAREmployee" runat="server" TargetControlID="ddlNewSAREmployee">
                </ajax:ListSearchExtender>
                <%--&nbsp;<asp:Button ID="btnCreateNewSalaryReviewAnalysis" runat="server" Text="Create New Salary Review Analysis" OnClick="btnCreateNewSalaryReviewAnalysis_Click"/>--%>
                <%--<asp:LinkButton ID="lbtnCreateNewSalaryReviewAnalysis" runat="server" CssClass="buttons"><img alt="Create New SRA" class="new_button" src="images/common/120px-Document_new_svg.png"/></asp:LinkButton>--%>
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
                <asp:GridView ID="gvEmployeeTitle" runat="server" AutoGenerateColumns="False" 
                    EmptyDataText="Title Data Unavailable." DataSourceID="odsSAREmployee" Width="100%">
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
            DataKeyNames="ID" EnableViewState="False" EnableTheming="False" 
                    DataSourceID="odsSAREmployee">
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
                <asp:GridView ID="gvSARDetails" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsSARDetails" >
                     <HeaderStyle cssclass="tr_head" />
                    <AlternatingRowStyle CssClass="tr_alt" />
                    <Columns>
                        <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference Number" 
                            SortExpression="ReferenceNumber" />
                        <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" 
                            SortExpression="DateInitiated" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:TemplateField HeaderText="Initiated By (Reviewer Name)" 
                            SortExpression="InitiatedByReviewerName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("InitiatedByReviewerName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Bind("InitiatedByReviewerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Scenarios" SortExpression="Scenarios">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Scenarios") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Repeater runat="server" DataSource='<%# Eval("Scenarios") %>'>
                                <HeaderTemplate><table>
                                <tr class="tr_subhead"><th>Scenario</th>
                                <th>Criteria</th>
                                <th>% Increase</th>
                                <th>New Salary $</th>
                                <th>Approved</th></tr></HeaderTemplate>
                                
                                <ItemTemplate>
                                <tr><td style="font-weight:bold"><%# Eval("ScenarioNumber") %>.</td>
                                <td><asp:DropDownList runat="server" ID="ddlSelectionType"  DataValueField="Key" DataTextField="Key" DataSourceID="odsCriteria" Enabled="false" SelectedValue='<%# Eval("SelectionType") %>'></asp:DropDownList></td>
                                <td><%# Eval("PercentIncrease", "{0:p}") %></td>
                                <td><%# Eval("SalaryAmount", "{0:c}") %></td>
                                <td><asp:CheckBox runat="server" Checked='<%# Convert.ToBoolean(Eval("Approved")) %>' Enabled="false"/></td></tr></ItemTemplate>
                                
                                <FooterTemplate></table></FooterTemplate>
                                </asp:Repeater>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" 
                            SortExpression="DepartmentComments" />--%>
                        <asp:BoundField DataField="DeansOfficeComments" 
                            HeaderText="Deans Office Comments" SortExpression="DeansOfficeComments" />
                        <asp:TemplateField HeaderText="Date Approved" SortExpression="DateApproved">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbDateApproved" runat="server" Text='<%# Bind("DateApproved") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateApproved" runat="server" 
                                    Text='<%# ((Eval("DateApproved") as DateTime?) == null  ? "" : Eval("DateApproved", "{0:MM/dd/yyyy}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsSARDetails" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetByID" 
                    TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CurrentSarID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
        &nbsp;<asp:ObjectDataSource ID="odsSAREmployee" runat="server" TypeName="CAESDO.Esra.BLL.EmployeeBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByID" 
                    UpdateMethod="UpdateRecord">
            <UpdateParameters>
                <asp:Parameter Name="AdjustedCareerHireDate" Type="String" />
                <asp:Parameter Name="AdjustedApptHireDate" Type="String" />
                <asp:Parameter Name="DepartmentComments" Type="String" />
                <asp:Parameter Name="DeansOfficeComments" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" 
                    SessionField="CurrentEmployeeID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsTitle" runat="server" TypeName="CAESDO.Esra.BLL.TitleBLL"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" 
                    SessionField="CurrentTitleCode" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
                
        <br />
         <asp:LinkButton runat="server" ID="lbtnBack" 
                    onclick="lbtnBack_Click" ToolTip="Back" CssClass="buttons" Text="&lt;img alt=&quot;Back&quot; class=&quot;back_button&quot; 
                    src=&quot;images/common/arrow_left.jpg&quot;/&gt; Back"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnEdlt" runat="server" onclick="lbtnEdit_Click" ToolTip="Edit" CssClass="buttons">Edit <img id="imgEditButton" alt="Edit" class="edit_button" src="images/common/edit.png"/></asp:LinkButton>
                    
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
    </div>
    <asp:ObjectDataSource ID="odsCriteria" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCriteriaListItems" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="titleCode" 
                SessionField="titleCode" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>