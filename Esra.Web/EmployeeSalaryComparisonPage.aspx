<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="EmployeeSalaryComparisonPage.aspx.cs" Inherits="CAESDO.Esra.Web.EmployeeSalaryComparisonPage" Title="ESRA - Employee Salary Comparison Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">

    <script type="text/javascript" language="javascript">
        var ModalProgress = '<%= ModalProgress.ClientID %>';
        
        
</script>
<script type="text/javascript" src="includes/exportToExcel.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">

    <script type="text/javascript" src="includes/jsUpdateProgress.js"></script>
    
    <script type="text/javascript">
        function NewExportToExcel() {
            var hiddenEmployeeID_ClientID = '<%= hiddenEmployeeID.ClientID %>';
            var hiddenEmployeeID = document.getElementById(hiddenEmployeeID_ClientID);
            var pkEmployeeID = hiddenEmployeeID.value;

            var hiddenTitleCodesString_ClientID = '<%= hiddenSelectedTitleStrings.ClientID %>';
            var hiddenTitleCodesString = document.getElementById(hiddenTitleCodesString_ClientID);
            var titleCodesString = hiddenTitleCodesString.value;

            var hiddenDepartmentsString_ClientID = '<%= hiddenSelectedDepartmentStrings.ClientID %>';
            var hiddenDepartmentsString = document.getElementById(hiddenDepartmentsString_ClientID);
            var departmentsString = hiddenDepartmentsString.value;

            var hiddenSortPropertyName_ClientID = '<%= hiddenSortPropertyName.ClientID %>';
            var hiddenSortPropertyName = document.getElementById(hiddenSortPropertyName_ClientID);
            var propertyName = hiddenSortPropertyName.value;

            var hiddenAscending_ClientID = '<%= hiddenAscending.ClientID %>';
            var hiddenAscending = document.getElementById(hiddenAscending_ClientID);
            var ascending = hiddenAscending.value;

            //console.log(pkEmployeeID);
            //console.log(titleCodesString);
            //console.log(departmentsString);
            //debugger;
            ExportToExcel(propertyName, ascending, titleCodesString, pkEmployeeID, departmentsString);
            
        }
    </script>

    <h1 id="page_title"><asp:Label ID="lblPageTitle" runat="server" Text="Salary Scales &amp; Employee Salary Comparison"></asp:Label></h1>
<%--    <div class="left_col">
    </div>--%>
<div class="right_col">

<ul id="ESCR_criteria"><li>
<%--<table id="top_of_top_table">
<tbody>
<tr>
<td>--%>

    <h2><asp:Label ID="lblTitleSalaryScaleSection" runat="server" Text="Salary Scales"></asp:Label></h2>
        &nbsp;<asp:DropDownList ID="ddlSearchByTitleCode" runat="server" DataSourceID="odsTitlesByTitleCode" 
                    DataTextField="TitleCode" DataValueField="ID"  
                    AppendDataBoundItems="True" 
                    onselectedindexchanged="ddlSearchByTitleCode_SelectedIndexChanged" 
                    AutoPostBack="true">
                    <asp:ListItem Value="0">-- Select a Title Code --</asp:ListItem>
                </asp:DropDownList>
                <ajax:ListSearchExtender ID="ListSearchExtender5" runat="server" 
                    TargetControlID="ddlSearchByTitleCode">
                </ajax:ListSearchExtender><br />-- or --<br />
            &nbsp;<asp:DropDownList ID="ddlTitleCode" runat="server" DataSourceID="odsTitles" 
                    DataTextField="PayrollTitle_TitleCode" DataValueField="ID"  
                    AppendDataBoundItems="True" 
                    onselectedindexchanged="ddlTitleCode_SelectedIndexChanged" 
                    AutoPostBack="true">
                    <asp:ListItem Value="0">-- Select a Payroll Title --</asp:ListItem>
                </asp:DropDownList>
                <ajax:ListSearchExtender ID="ListSearchExtender4" runat="server" 
                    TargetControlID="ddlTitleCode">
                </ajax:ListSearchExtender>
        <br />
        &nbsp;<asp:GridView ID="gvTitle" runat="server" DataSourceID="odsTitle" 
            AutoGenerateColumns="False" EmptyDataText="No Title Code selected." 
        HeaderStyle-HorizontalAlign="Center" GridLines="None">
            <Columns>
                <asp:TemplateField>
                <HeaderTemplate>Campus-wide Salary Scale</HeaderTemplate>
                    <ItemTemplate>
                        <table id="tblTitleCodeSalaryScale">
                            <tr>
                                <th>Title Code:</th><th colspan="2">&nbsp;&nbsp;Payroll Title:</th><%--<th colspan="2">Abbreviated Name</th>--%></tr>
                            <tr><td><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                    <td colspan="2"><asp:Label ID="lblPayrollTitle" runat="server" 
                                            Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                    <%--<td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" 
                                            Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>--%>
                            </tr>
                            <%--<tr><th colspan="5">Salary Scales</th></tr>--%>
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
                                    <asp:Repeater runat="server" ID="rptSalaryScale" 
                                        DataSource='<%# Eval("SalaryScales") %>' >
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
                                                    <asp:Panel ID="pnlQuartiles" runat="server" Visible='<%# !HasSalarySteps(Container) %>'>
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
                                                        </tr></asp:Panel>
                                                        <tr>
                                                        <td colspan="5">
                                                            <table>
                                                                <asp:Panel ID="pnlLM_CollegeAverages" runat="server" Visible='<%# !IsDepartmentUser() %>'>
                                                                <tr>
                                                                    <th>Labor Market WAS:</th><td><asp:Label ID="Label17" runat="server" 
                                                        Text='<%# Eval("LaborMarketWAS","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Labor Market Mid:</th><td><asp:Label ID="Label18" runat="server" 
                                                        Text='<%# Eval("LaborMarketMidAnnual","{0:c}") %>'></asp:Label></td>
                                                                </tr>
                                                                </asp:Panel>
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
                                                                    <th><asp:Label ID="lblStep" runat="server" Text='<%# Eval("StepNumber") %>' ></asp:Label></th>
                                                                    <td><asp:Label ID="lblStepAnnual" runat="server" 
                                                                            Text='<%# Eval("Annual","{0:c}") %>' Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label></td>
                                                                    <td><asp:Label ID="lblStepMonthly" runat="server" 
                                                                            Text='<%# Eval("Monthly","{0:c}") %>' Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label></td>
                                                                   <td><asp:Label ID="lblStepHourly" runat="server" 
                                                                           Text='<%# Eval("Hourly","{0:c}") %>' Font-Bold='<%# IsMiddleStep(Container) %>'></asp:Label></td></tr>
                                                            </ItemTemplate> 
                                                        </asp:Repeater>
                                                    </table>
                                             </td>
                                        </tr>
                                    </table>
                                   
                                </ItemTemplate>
                        </asp:Repeater></td></tr>
                        </asp:Panel>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:GridView>
          </ContentTemplate>
        </asp:UpdatePanel>
        <br />
</li><li>
<%--</td><td id="before_employee_salary_comparison">--%>
<%--</div>
<div class="right_col">--%>
    
     <h2><asp:Label ID="lblTitleEmployeeSalaryComparisonSection" runat="server" Text="Employee Salary Comparison"></asp:Label></h2>
                <ajax:ListSearchExtender ID="ListSearchExtender1" runat="server" 
             TargetControlID="lbxTitleCodes" >
                    </ajax:ListSearchExtender>
                     <ajax:ListSearchExtender ID="ListSearchExtender6" runat="server" 
             TargetControlID="lbxTitleCodeIDs" >
                    </ajax:ListSearchExtender>
                <ajax:ListSearchExtender ID="ListSearchExtender2" runat="server" 
             TargetControlID="lbxDepartments">
         </ajax:ListSearchExtender>
         <ajax:ListSearchExtender ID="ListSearchExtender7" runat="server" 
             TargetControlID="lbxDepartmentIDs">
         </ajax:ListSearchExtender>
         <ajax:ListSearchExtender ID="ListSearchExtender3" runat="server" 
             TargetControlID="ddlEmployee" >
         </ajax:ListSearchExtender>
         <table id="tblEmployeeSalaryComparasionReportSearchParameters">
         <tr><th><h3><asp:Label ID="lblTblEmployeeSalaryComparasionReportSearchParameters" runat="server" Text="Search Parameters"></asp:Label></h3>
             </th></tr>
            <tr style="margin:0 0 10px 10px;">
                <td>
                    <asp:ListBox ID="lbxTitleCodes" runat="server" 
            AppendDataBoundItems="True" DataSourceID="odsTitles" 
            DataTextField="PayrollTitle_TitleCode" DataValueField="ID" 
             onselectedindexchanged="lbxTitleCodes_SelectedValues" Rows="5" 
             SelectionMode="Multiple" >
            <asp:ListItem Value="0">-- Any Title(s) --</asp:ListItem>
        </asp:ListBox></td>
        
        <td><asp:ListBox ID="lbxTitleCodeIDs" runat="server" 
            AppendDataBoundItems="True" DataSourceID="odsTitlesByTitleCode" 
            DataTextField="TitleCode" DataValueField="ID" 
             onselectedindexchanged="lbxTitleCodes_SelectedValues" Rows="5" 
             SelectionMode="Multiple" >
            <asp:ListItem Value="0">-- Any Title Code(s) --</asp:ListItem>
        </asp:ListBox></td>
        
        </tr><tr>
        <%--<td><asp:ListBox ID="ListBox1" runat="server" 
            AppendDataBoundItems="True" 
            DataTextField="Name_DepartmentNumber" DataValueField="ID" Rows="5" SelectionMode="Multiple" 
            onselectedindexchanged="lbxDepartments_SelectedValues" oninit="lbxDepartments_Init" >
            <asp:ListItem Value="0">-- Any Department(s) --</asp:ListItem>
        </asp:ListBox></td>--%>
                <td><asp:ListBox ID="lbxDepartments" runat="server" 
            AppendDataBoundItems="True" 
            DataTextField="Name_DepartmentNumber" DataValueField="ID" Rows="5" SelectionMode="Multiple" 
            onselectedindexchanged="lbxDepartments_SelectedValues" >
            <asp:ListItem Value="0">-- Any Department(s) --</asp:ListItem>
        </asp:ListBox></td>
        <td><asp:ListBox ID="lbxDepartmentIDs" runat="server" 
            AppendDataBoundItems="True" 
            DataTextField="DepartmentNumber" DataValueField="ID" Rows="5" SelectionMode="Multiple" 
            onselectedindexchanged="lbxDepartments_SelectedValues" >
            <asp:ListItem Value="0">-- Any Department ID(s) --</asp:ListItem>
        </asp:ListBox></td>
        </tr><tr>
                <td><asp:DropDownList ID="ddlEmployee" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" 
            DataTextField="FullName" DataValueField="ID" 
                        onselectedindexchanged="ddlEmployee_SelectedIndexChanged" 
                        DataSourceID="odsFilteredEmployees">
            <asp:ListItem Value="0">-- Any Employee --</asp:ListItem>
        </asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Get Employee Salary Report" /></td>
            </tr>
        
         </table>
   <%--      </div>
         <div class="left_col">--%>
        <asp:MultiView ID="MultiView1" runat="server">
            
            <asp:View ID="vEmployees" runat="server">
                

                <br />

</li><li id="divReportGenerationCriteria" >

<h2>Report Generation Criteria</h2>
                
<%--</td><td id="before_Report_Generation">  --%>              
                
                <asp:GridView ID="gvESRSearchParams" runat="server" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center" GridLines="None">
                
                    <Columns>
                        <asp:TemplateField>
                        <HeaderTemplate><h2 class="display_none">Report Generation Criteria</h2></HeaderTemplate>
                            <ItemTemplate>
                             <table id="ESCP_report_generation_criteria">
                             <tr >
                                <td>
                                    <table>
                                        <tr>
                                            <th>Title Code:</th>
                                            <th>Payroll Title:</th>
                                            <%--<th>Salary Grade:</th>
                                            <th>Bargaining Unit:</th>--%>
                                        </tr>
                                 <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("SearchTitles")%>'>
                             
                                     <ItemTemplate>
                                        <tr>
                                    
                                            <td><asp:Label ID="lblSearchTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                            <td><asp:Label ID="lblSearchTitleName" runat="server" Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                            <%--<td><asp:Label ID="lblSearchTitleSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label></td>
                                            <td><asp:Label ID="lblSearchTitleBargainingUnit" runat="server" Text='<%# Eval("BargainingCode") %>'></asp:Label></td>--%> 
                                        </tr>
                                    </ItemTemplate>

                                </asp:Repeater>
                                    </table>
                                </td></tr><tr><td>
                                <table>
                                <tr>
                                <th>Department(s)</th>
                                <th>Employee(s)</th>
                                <th>Report Date</th>
                            </tr>
                            <tr>
                                
                                <td><asp:Repeater runat="server" ID="rptDepartments" DataSource='<%# Eval("SearchDepartments")%>'><ItemTemplate><asp:Label runat="server" ID="lblSearchDepartment" Text='<%# Eval("Name_DepartmentNumber") %>'></asp:Label></ItemTemplate>
                                <SeparatorTemplate><br /></SeparatorTemplate></asp:Repeater></td>
                                <td><asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("SearchEmployee.FullName") %>'></asp:Label></td>
                                <td><asp:Label ID="lblReportDate" runat="server" Text='<%# Eval("ReportDate", "{0:MM/dd/yyyy}") %>'></asp:Label></td>
                            </tr>
                            </table></td></tr>
                            </tr>
                        </table>
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
</li></ul __designer:mapid="2b58">                
<%--</td></tr></tbody></table> --%>
<p class="note">Items highlighted in <span class="light_green">light green</span> indicate a 
    change from PPS.<br />
    Dates with <span class="bold">bolded</span> text have been validated to be correct in PPS.</p>
<h2 class="h2_black"><asp:Label Font-Bold="true" runat="server" Text="Employee Salary Comparison Report" ></asp:Label>
<asp:Button ID="btnExportToExcel" runat="server" OnClientClick="NewExportToExcel(); return false;" Text="Export to Excel" /></h2>

                <%--<asp:Panel ID="panelUpdateProgress" runat="server" >
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="up">
                        <ProgressTemplate>
                            <div style="position: relative; top: 30%; text-align: left;">
                            Processing...&nbsp;
                                <img id="img_progress" alt="progress" src="images/common/Bright.WebControls.Resources.Progress.gif" />
                                <br />
                            </div>
                            <br />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </asp:Panel>--%>
                <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
                    <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="up">
                        <ProgressTemplate>
                            <div style="position: relative; top: 30%; text-align: center;">
                            <br />
                            Processing...&nbsp;
                            <img id="img_progress" alt="progress" src="images/common/Bright.WebControls.Resources.Progress.gif" />
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </asp:Panel>
                <ajax:modalpopupextender id="ModalProgress" runat="server" targetcontrolid="panelUpdateProgress"
                    backgroundcssclass="modalBackground" popupcontrolid="panelUpdateProgress" />
                    
                <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                <div id="ESCR_table">
                 <asp:HiddenField ID="hiddenSortPropertyName" runat="server" />
                 <asp:HiddenField ID="hiddenAscending" Value="true" runat="server" />
                 <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsEmployee" EmptyDataText="No Data Found." 
                    OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" AllowSorting="True" 
                    DataKeyNames="ID" OnSorting="gvEmployees_Sorting" 
                    OnRowUpdating="gvEmployees_RowUpdating"
                    onrowupdated="gvEmployees_RowUpdated" 
                    OnRowDataBound="gvEmployees_RowDataBound"
                    EnableViewState="False" GridLines="None">
                    <PagerSettings Position="TopAndBottom" />
                    <HeaderStyle cssclass="tr_head" />
                    <AlternatingRowStyle CssClass="tr_alt" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update"><img alt="update" class="update_button" width="21px" height="21px" src="images/common/disk4.jpg"/></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"><img alt="Cancel" width="21px" height="21px" class="cancel_button" src="images/common/Cancel.png"/></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                            <%--<asp:Panel ID="pnlProgress" runat="server" >
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="up" >
                        <ProgressTemplate>
                            <div style="position: relative; top: 30%; text-align: center;">
                            <br />
                                <img id="img_loading" alt="loading" src="images/common/loading.gif" />
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    </asp:Panel>--%>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" ><img src="images/common/edit.png" alt="edit" /></asp:LinkButton>
                                    <asp:Image ID="imgWaiting" runat="server" ImageUrl="~/images/common/loading.gif" Visible="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Department Name" SortExpression="HomeDepartment">
  
                            <EditItemTemplate>
                                <asp:Label ID="lblHomeDepartmentHeader" runat="server" Text="Department:" CssClass="edit_header"/><br />&nbsp
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>' />
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HomeDepartment") %>'></asp:TextBox>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("HomeDepartment.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title Code" SortExpression="Title">
                            <EditItemTemplate>
                                <asp:Label ID="lblTitleHeader" runat="server" Text="Title Code:" CssClass="edit_header"/><br />
                                <asp:Label ID="lblEditTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTitleCode" runat="server" 
                                    Text='<%# Eval("TitleCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary Grade" SortExpression="SalaryGrade">
                            <EditItemTemplate>
                                <asp:Label ID="lblSalaryGradeHeader" runat="server" Text="Salary Grade:" CssClass="edit_header"/><br />
                                <asp:Label ID="lblSalaryGrade" runat="server" 
                                    Text='<%# Eval("SalaryGrade", "{0:0.00}") %>'></asp:Label>&nbsp
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSalaryGrade" runat="server" 
                                    Text='<%# Eval("SalaryGrade", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bargaining Unit" SortExpression="BargainingUnitCode">
                            <EditItemTemplate>
                                <asp:Label ID="lblBargainingUnitHeader" runat="server" Text="Bargaining Unit:" CssClass="edit_header"/><br />
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("BargainingUnitCode", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee Name" SortExpression="FullName">
                            <EditItemTemplate>
                                <asp:Label ID="lblFullNameHeader" runat="server" Text="Employee Name:" CssClass="edit_header"/><br />&nbsp<br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hire Date">
                            <EditItemTemplate>
                                <ajax:CalendarExtender ID="ceAdjustedCareerHireDate" runat="server" CssClass="calendar" TargetControlID="tbAdjustedCareerHireDate" Format="MM/dd/yyyy">
                                </ajax:CalendarExtender>
                                <asp:Label ID="lblAdjustedCareerHireDateHeader" runat="server" Text="Hire Date:" CssClass="edit_header"/><br />&nbsp
                                PPS Checked?&nbsp;<asp:CheckBox ID="cbxPPSCareerHireDateChecked" runat="server" Checked='<%# Bind("PPSCareerHireDateChecked") %>' />&nbsp
                                <asp:TextBox ID="tbAdjustedCareerHireDate" runat="server" 
                                    Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                    
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Eval("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>' 
                                    BackColor='<%# ((bool)Eval("CareerDateHasBeenAdjusted") ? System.Drawing.Color.FromName("#97d092") : System.Drawing.Color.Transparent ) %>' CssClass="light_green_edit"
                                    Font-Bold='<%# ((bool)Eval("PPSCareerHireDateChecked"))%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Years Of Service" 
                            SortExpression="YearsOfService">
                            <EditItemTemplate>
                                <asp:Label ID="lblYearsOfServiceHeader" runat="server" Text="Years Of Service:" CssClass="edit_header"/><br />
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
                            <ajax:CalendarExtender ID="ceAdjustedApptHireDate" runat="server" CssClass="calendar" TargetControlID="tbAdjustedApptHireDate" Format="MM/dd/yyyy">
                                </ajax:CalendarExtender>
                                <asp:Label ID="lblAdjustedApptHireDateHeader" runat="server" Text="Begin Date (in Title)" CssClass="edit_header"/><br />&nbsp
                                PPS Checked?&nbsp;<asp:CheckBox ID="cbxPPSApptHireDateChecked" runat="server" Checked='<%# Bind("PPSApptHireDateChecked") %>' />&nbsp
                                <asp:TextBox ID="tbAdjustedApptHireDate" runat="server" 
                                    Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAdjustedApptHireDate" runat="server" 
                                    Text='<%# Eval("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'
                                     BackColor='<%# ((bool)Eval("ApptDateHasBeenAdjusted") ? System.Drawing.Color.FromName("#97d092") : System.Drawing.Color.Transparent )  %>' CssClass="light_green_edit"
                                     Font-Bold='<%# ((bool)Eval("PPSApptHireDateChecked"))%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time In Title" SortExpression="TimeInTitle">
                            <EditItemTemplate>
                                <asp:Label ID="lblTimeInTitleHeader" runat="server" Text="Time In Title:" CssClass="edit_header"/><br />
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Experience Begin Date" >
                            <EditItemTemplate>
                            <ajax:CalendarExtender ID="ceExperienceBeginDate" runat="server" CssClass="calendar" TargetControlID="tbExperienceBeginDate" Format="MM/dd/yyyy">
                                </ajax:CalendarExtender>
                                <asp:Label ID="lblExperienceBeginDateHeader" runat="server" Text="Experience Begin Date:" CssClass="edit_header"/><br />
                                <asp:TextBox ID="tbExperienceBeginDate" runat="server" 
                                    Text='<%# Bind("ExperienceBeginDate", "{0:MM/dd/yyyy}") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblExperienceBeginDate" runat="server" Text='<%# Eval("ExperienceBeginDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Years Of Experience" 
                            SortExpression="YearsOfExperience">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("YearsOfExperience") %>'></asp:TextBox>--%>
                                    <asp:Label ID="lblYearsOfExperienceHeader" runat="server" Text="Years Of Experience:" CssClass="edit_header"/><br />
                                    <asp:Label ID="lblEditYearsOfExperience" runat="server" Text='<%# Eval("YearsOfExperience","{0:0.00}") %>'></asp:Label>&nbsp
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblYearsOfExperience" runat="server" Text='<%# Eval("YearsOfExperience","{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pay Rate" SortExpression="PayRate">
                            <EditItemTemplate>
                                <asp:Label ID="lblPayRateHeader" runat="server" Text="Pay Rate:" CssClass="edit_header"/><br />&nbsp
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>&nbsp
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PayRate", "{0:c}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department Comments">
                            <EditItemTemplate>
                                <asp:Label ID="lblDepartmentCommentsHeader" runat="server" Text="Department Comments:" CssClass="edit_header" /><br />
                                <asp:TextBox ID="tbDepartmentComments" runat="server" 
                                    Text='<%# Bind("DepartmentComments") %>' ReadOnly='<%# !IsDepartmentUser() %>' BackColor='<%# (!IsDepartmentUser() ? System.Drawing.Color.LightGray : System.Drawing.Color.White) %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDepartmentComments" runat="server" Text='<%# Eval("DepartmentComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dean's Office Comments">
                            <EditItemTemplate>
                                <asp:Label ID="lblDeansOfficeCommentsHeader" runat="server" Text="Dean's Office Comments:" CssClass="edit_header"/><br />
                                <asp:TextBox ID="tbDeansOfficeComments" runat="server" 
                                    Text='<%# Bind("DeansOfficeComments") %>' ReadOnly='<%# IsDepartmentUser() %>' BackColor='<%# (IsDepartmentUser() ? System.Drawing.Color.LightGray : System.Drawing.Color.White) %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDeansOfficeComments" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
                            </ItemTemplate>
                        
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="up">
                <ProgressTemplate>
                    Updating...  <img id="process_bar" alt="process bar" src="images/common/Bright.WebControls.Resources.Progress.gif"/>
                </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server" >
                <br />
                <asp:Label ID="lblNoSearchParametersSelected" runat="server" Text="No Search Parameters selected." BackColor="White" BorderStyle="NotSet" BorderWidth="3px" BorderColor="White" />
            </li></ul>
            <p class="note">&nbsp</p>
            </div>
            </asp:View>
        </asp:MultiView>
    
     <asp:HiddenField ID="hiddenUserID" runat="server" OnValueChanged="MyHiddenField_ValueChanged"></asp:HiddenField>
     <asp:HiddenField ID="hiddenIsDepartmentUser" runat="server" OnValueChanged="MyHiddenField_ValueChanged"></asp:HiddenField>
     <asp:HiddenField ID="hiddenEmployeeID" runat="server" OnValueChanged="MyHiddenField_ValueChanged"/>
     <asp:HiddenField ID="hiddenSelectedDepartmentStrings" runat="server" OnValueChanged="MyHiddenField_ValueChanged"></asp:HiddenField>
     <asp:HiddenField ID="hiddenSelectedTitleStrings" runat="server" OnValueChanged="MyHiddenField_ValueChanged"/>
    <%-- <asp:HiddenField ID="hiddenSortPropertyName" runat="server" OnValueChanged="MyHiddenField_ValueChanged"/>
     <asp:HiddenField ID="hiddenAscending" runat="server" OnValueChanged="MyHiddenField_ValueChanged"/>--%>
     
<asp:ObjectDataSource ID="odsEmployee" runat="server" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllEmployeesForUser" 
            UpdateMethod="UpdateRecord">
            <UpdateParameters>
                <asp:Parameter Name="AdjustedCareerHireDate" Type="String" />
                <asp:Parameter Name="PPSCareerHireDateChecked" Type="Boolean" />
                <asp:Parameter Name="AdjustedApptHireDate" Type="String" />
                <asp:Parameter Name="PPSApptHireDateChecked" Type="Boolean" />
                <asp:Parameter Name="ExperienceBeginDate" Type="String" />
                <asp:Parameter Name="DepartmentComments" Type="String" />
                <asp:Parameter Name="DeansOfficeComments" Type="String" />
                <asp:ControlParameter DefaultValue="false" Name="IsDepartmentUser" ControlID="hiddenIsDepartmentUser" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
            </UpdateParameters>
           
            <SelectParameters>
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" 
                    Type="String" />
                   
                <asp:ControlParameter DefaultValue="true" Name="isDepartmentUser" 
                    ControlID="hiddenIsDepartmentUser" Type="Boolean"/>
                    
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
                
                <asp:ControlParameter ControlID="hiddenSelectedTitleStrings" DefaultValue="0" Name="titleCodesString" Type="String" />
                    
                <asp:ControlParameter ControlID="ddlEmployee" DefaultValue="0" 
                    Name="pkEmployee" PropertyName="SelectedValue" Type="String" />
                    
                <asp:ControlParameter ControlID="hiddenSelectedDepartmentStrings" DefaultValue="" Name="departmentIDsString" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsEmployees" runat="server" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAll">
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsFilteredEmployees" runat="server" 
                    TypeName="CAESDO.Esra.BLL.EmployeeBLL" SelectMethod="GetEmployees" >
                    <SelectParameters>
                     <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" 
                    Type="String" />
                    <asp:ControlParameter DefaultValue="true" Name="isDepartmentUser" 
                    ControlID="hiddenIsDepartmentUser" Type="Boolean" />
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
       </asp:ObjectDataSource>
        
        <%--<asp:ObjectDataSource ID="odsTitle" runat="server"  
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTitleCode" Name="id" 
                    PropertyName="SelectedValue" Type="String" DefaultValue="0" />
            </SelectParameters>
        </asp:ObjectDataSource>--%>
        
        <asp:ObjectDataSource ID="odsTitle" runat="server"  
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByTitleCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTitleCode" Name="id" 
                    PropertyName="SelectedValue" Type="String" DefaultValue="0" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsTitles" runat="server" 
            TypeName="CAESDO.Esra.BLL.TitleBLL" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll">
            <SelectParameters>
                <asp:Parameter DefaultValue="PayrollTitle" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
            
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsTitlesByTitleCode" runat="server" 
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
        
        <asp:ObjectDataSource ID="odsDepartmentNumbers" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.DepartmentBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="DepartmentNumber" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsDepartmentUserDepartments" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsForUser" 
            TypeName="CAESDO.Esra.BLL.DepartmentBLL">
            <SelectParameters>
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" 
                    Type="String" />
                <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
         <asp:ObjectDataSource ID="odsDepartmentUserDepartmentNumbers" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsForUser" 
            TypeName="CAESDO.Esra.BLL.DepartmentBLL">
            <SelectParameters>
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" 
                    Type="String" />
                <asp:Parameter DefaultValue="DepartmentNumber" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="odsDepartmentUserEmployees" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetAllEmployeesForUser" 
                    TypeName="CAESDO.Esra.BLL.EmployeeBLL" >
            <SelectParameters>
                <asp:ControlParameter DefaultValue="0" Name="userID" ControlID="hiddenUserID" 
                    Type="String" />
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <br />
        
    
    </div>
    
   </asp:Content>
