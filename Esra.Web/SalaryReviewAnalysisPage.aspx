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
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" Type="String" />
                <asp:ControlParameter DefaultValue="true" Name="isDepartmentUser" ControlID="hiddenIsDepartmentUser"
                    Type="Boolean" />
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsGvSalaryReviewAnalysis" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL" DeleteMethod="Delete">
            <SelectParameters>
                <asp:ControlParameter DefaultValue="" Name="userId" ControlID="hiddenUserID" 
                    Type="String" />
                <asp:ControlParameter DefaultValue="false" Name="isDepartmentUser" 
                    ControlID="hiddenIsDepartmentUser" Type="Boolean" />
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
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" Type="String" />
                <asp:ControlParameter DefaultValue="true" Name="isDepartmentUser" ControlID="hiddenIsDepartmentUser"
                    Type="Boolean" />
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsCreatedBy" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUsersInApplication" TypeName="CAESDO.Esra.BLL.UserBLL">
            <SelectParameters>
                <asp:Parameter Name="pUnits" Type="Object"/>
                <asp:Parameter DefaultValue="Reviewer" Name="roleName" Type="String" />
            </SelectParameters>
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
                    <tr><td colspan="5">&nbsp;</td></tr>
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
                        <td><br />
                            &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" AppendDataBoundItems="True"
                                DataSourceID="odsFilteredEmployees" DataTextField="FullName" DataValueField="ID"
                                ondatabound="ddlEmployee_DataBound">
                                <asp:ListItem Value="">-- Any Employee --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlEmployee_ListSearchExtender" runat="server" TargetControlID="ddlEmployee">
                            </ajax:ListSearchExtender>
                        </td>
                        <td><br />
                            <asp:DropDownList ID="ddlCreatedBy" runat="server" AppendDataBoundItems="True" DataSourceID="odsCreatedBy"
                                DataTextField="FullName" DataValueField="LoginID"
                                ondatabound="ddlCreatedBy_DataBound">
                                <asp:ListItem Value="">-- Any Reviewer --</asp:ListItem>
                            </asp:DropDownList>
                            <ajax:ListSearchExtender ID="ddlCreatedBy_ListSearchExtender" runat="server" TargetControlID="ddlCreatedBy">
                            </ajax:ListSearchExtender>
                        </td>
                        <td><br />
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
                                    Text="View" ToolTip="View" CssClass="buttons"><img src="images/common/employee_salary_comparison.png" alt="View" /></asp:LinkButton>
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
                        <asp:TemplateField HeaderText="Home Department" SortExpression="Employee.HomeDepartment">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployee_HomeDepartment" runat="server" Text='<%# Eval("Employee.HomeDepartment.Name") %>'></asp:Label>
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
                <div id="divCreateNewSRA">
                &nbsp;<asp:DropDownList ID="ddlNewSAREmployee" runat="server" AppendDataBoundItems="True"
                    DataTextField="FullName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlNewSAREmployee_SelectedIndexChanged"
                    DataSourceID="odsFilteredEmployees">
                    <asp:ListItem Value="0">-- Select an Employee to Create a New Salary Review Analysis --</asp:ListItem>
                </asp:DropDownList>
                <ajax:ListSearchExtender ID="lsexDdlNewSAREmployee" runat="server" TargetControlID="ddlNewSAREmployee">
                </ajax:ListSearchExtender>
                
                </div>
            </asp:View>
            
            <asp:View ID="vSelectReviewType" runat ="server">
                <asp:Label ID="lblSelectReviewTypeView" runat="server" Font-Bold="True" Font-Size="Large">Select a Salary Review Analysis Type:</asp:Label>
                <br />
                <br />
                <asp:Label ID="lblNewSRAEmployeeLabel" runat="server" Font-Bold="true">Employee Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label><asp:Label ID="lblNewSRAEmployee" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblOriginalTitleCodeLabel" runat="server" Font-Bold="true">Current Title Code:&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label><asp:Label ID="lblOriginalTitleCode" runat="server" ></asp:Label>
                <br />
                <br />
               
                <table id="tblCurrentProposedTitleCodes">
                    <tr>
                        <td><asp:DropDownList ID="ddlProposedTitleCode" runat="server" AutoPostBack="True" DataSourceID="odsProposedTitleCodes"
                    DataTextField="TitleCode_Name" DataValueField="TitleCode" OnSelectedIndexChanged="ddlProposedTitleCode_SelectedIndexChanged">
                </asp:DropDownList></td>
                <td style="padding-left:10px;"><asp:Image ID="imgReclassArrow" runat="server" 
                    AlternateText="reclass arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" />
                &nbsp;Select a different Title Code to conduct a Reclassification Review.</td>
                    </tr>
                    <tr>
                        <td ><center>-- or --</center></td><td></td>
                    </tr>
                    <tr>
                        <th><asp:Button ID="Button1" runat="server" Text="Perform Equity Review" OnClick="btnDoEquityReview_Click" Width="100%"/></th>
                        <td style="text-align:left; padding-left:10px;"><asp:Image ID="Image1" runat="server" AlternateText="equity arrow" 
                    CssClass="buttons" ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px"/>
                &nbsp;Select &quot;Perform Equity Review&quot; to conduct an Equity Review.</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="btnCancelSalaryReviewAnalysis" runat="server" 
                                OnClick="btnCancelSalaryReviewAnalysis_Click" Text="Cancel/Back" />
                        </th>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="odsProposedTitleCodes" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                    TypeName="CAESDO.Esra.BLL.TitleBLL">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
            </asp:View>
            
            <asp:View ID="vNotAuthorized" runat="server">
            <table>
            <tr><td rowspan="2"><asp:Image ID="imgBackArrow" runat="server" 
                    AlternateText="back arrow" CssClass="buttons" 
                    ImageUrl="~/images/common/arrow_left.jpg" style="width: 14px" /><asp:Button ID="btnBack" runat="server" 
                                OnClick="lbtnBack_Click" Text="Back" /></td><td>Error: Employee is 
                    outside of user&#39;s home or work department.</td></tr>
            <tr><td>Unable view or perform a Salary Review Analysis on this Individual.</td></tr>
            </table>
            </asp:View>
            
        </asp:MultiView>
    
    <asp:HiddenField ID="hiddenUserID" runat="server" />
    <asp:HiddenField ID="hiddenIsDepartmentUser" runat="server" />
     
    <asp:ObjectDataSource ID="odsFilteredEmployees" runat="server" TypeName="CAESDO.Esra.BLL.EmployeeBLL"
        SelectMethod="GetEmployees">
        <SelectParameters>
            <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" Type="String" />
            <asp:ControlParameter DefaultValue="true" Name="isDepartmentUser" ControlID="hiddenIsDepartmentUser"
                Type="Boolean" />
            <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
