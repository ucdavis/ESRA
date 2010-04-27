<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="EmployeeSalaryComparisonPage.aspx.cs" Inherits="CAESDO.Esra.Web.EmployeeSalaryComparisonPage" Title="ESRA - Employee Salary Comparison Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div>
    <hr />
    <br />
    <center><asp:Label ID="lblTitleSalaryScaleSection" runat="server" Text="Title/Salary Scale" 
                Font-Bold="True" Font-Size="Large"></asp:Label></center><br />
    &nbsp;<asp:DropDownList ID="ddlTitleCode" runat="server" DataSourceID="odsTitles" 
            DataTextField="TitleCode_Name" DataValueField="ID" AutoPostBack="True" 
            AppendDataBoundItems="True" 
            onselectedindexchanged="ddlTitleCode_SelectedIndexChanged">
            <asp:ListItem Value="0">-- Select a Title Code --</asp:ListItem>
        </asp:DropDownList>
        <ajax:ListSearchExtender ID="ListSearchExtender4" runat="server" 
            TargetControlID="ddlTitleCode">
        </ajax:ListSearchExtender>
        <br />
        &nbsp;<asp:GridView ID="gvTitle" runat="server" DataSourceID="odsTitle" 
            AutoGenerateColumns="False" EmptyDataText="No Title Code selected." ShowHeader="true" HeaderStyle-HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField>
                <HeaderTemplate>Campus-wide Salary Scale</HeaderTemplate>
                    <ItemTemplate>
                        <table id="tblTitleCodeSalaryScale">
                            <tr>
                                <th>Title Code</th><th colspan="2">Payroll Title</th><%--<th colspan="2">Abbreviated Name</th>--%></tr>
                            <tr><td><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                    <td colspan="2"><asp:Label ID="lblPayrollTitle" runat="server" 
                                            Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                    <%--<td colspan="2"><asp:Label ID="lblAbbreviatedName" runat="server" 
                                            Text='<%# Eval("AbbreviatedName") %>'></asp:Label></td>--%>
                            </tr>
                            <%--<tr><th colspan="5">Salary Scales</th></tr>--%>
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
                                                                <asp:Panel ID="LM_CollegeAverages" runat="server" Visible='<%# !IsDepartmentUser() %>'>
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
                                                                </asp:Panel>
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
        </asp:GridView>
        <br />
    </div>
    <hr />
    <br />
     <center><asp:Label ID="lblTitleEmployeeSalaryComparisonSection" runat="server" Text="Employee Salary Comparison" 
                Font-Bold="True" Font-Size="Large"></asp:Label></center>
    <br />
    <div>
                <ajax:ListSearchExtender ID="ListSearchExtender1" runat="server" 
             TargetControlID="lbxTitleCodes" >
                    </ajax:ListSearchExtender>
                <ajax:ListSearchExtender ID="ListSearchExtender2" runat="server" 
             TargetControlID="lbxDepartments">
         </ajax:ListSearchExtender>
         <ajax:ListSearchExtender ID="ListSearchExtender3" runat="server" 
             TargetControlID="ddlEmployee" >
         </ajax:ListSearchExtender>
         <br />
         <table id="tblEmployeeSalaryComparasionReportSearchParameters" width="75%">
         <tr><th colspan="3">
             <center><asp:Label ID="lblTblEmployeeSalaryComparasionReportSearchParameters" 
                     runat="server" Font-Size="Medium" 
                 Text="Search Parameters"></asp:Label></center>
             </th></tr>
            <tr>
                <td rowspan="3">
                    <asp:ListBox ID="lbxTitleCodes" runat="server" 
            AppendDataBoundItems="True" DataSourceID="odsTitles" 
            DataTextField="TitleCode_Name" DataValueField="ID" 
             onselectedindexchanged="lbxTitleCodes_SelectedValues" Rows="5" 
             SelectionMode="Multiple" >
            <asp:ListItem Value="0">-- Any Title Code(s) --</asp:ListItem>
        </asp:ListBox></td>
                <td rowspan="3"><asp:ListBox ID="lbxDepartments" runat="server" 
            AppendDataBoundItems="True" 
            DataTextField="Name" DataValueField="ID" Rows="5" SelectionMode="Multiple" 
            onselectedindexchanged="lbxDepartments_SelectedValues" oninit="lbxDepartments_Init">
            <asp:ListItem Value="0">-- Any Department(s) --</asp:ListItem>
        </asp:ListBox></td>
                
            </tr>
            <tr>
                <td><asp:DropDownList ID="ddlEmployee" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" 
            DataTextField="FullName" DataValueField="ID" 
                        onselectedindexchanged="ddlEmployee_SelectedIndexChanged" 
                        oninit="ddlEmployee_Init">
            <asp:ListItem Value="0">-- Any Employee --</asp:ListItem>
        </asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Get Employee Salary Report" /></td>
            </tr>
        
         </table>
         
        <br />
       
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vEmployees" runat="server" >
                <%--Report Date:

                <script type="text/javascript" language="JavaScript">
<!-- //Script courtesy of http://www.web-source.net - Your Guide to Professional Web Site Design and Development -->
var today_date= new Date()
var month=today_date.getMonth()+1
var today=today_date.getDate()
var year=today_date.getYear() + 1900
//document.write("Today's date is: ")
document.write(month+"/"+today+"/"+year)
</script> --%>

                <br />
                <asp:GridView ID="gvESRSearchParams" runat="server" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center" Width="75%">
                
                    <Columns>
                        <asp:TemplateField>
                        <HeaderTemplate>Report Generation Criteria</HeaderTemplate>
                            <ItemTemplate>
                             <table border="1">
                             <tr >
                                <td rowspan="2">
                                    <table border="1">
                                        <tr>
                                            <th>Title Code:</th>
                                            <th>Payroll Title:</th>
                                            <th>Salary Grade:</th>
                                            <th>Bargaining Unit:</th>
                                        </tr>
                                 <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("SearchTitles")%>'>
                             
                                     <ItemTemplate>
                                        <tr>
                                    
                                            <td><asp:Label ID="lblSearchTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label></td>
                                            <td><asp:Label ID="lblSearchTitleName" runat="server" Text='<%# Eval("PayrollTitle") %>'></asp:Label></td>
                                            <td><asp:Label ID="lblSearchTitleSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label></td>
                                            <td><asp:Label ID="lblSearchTitleBargainingUnit" runat="server" Text='<%# Eval("BargainingCode") %>'></asp:Label></td> 
                                        </tr>
                                    </ItemTemplate>

                                </asp:Repeater>
                                    </table>
                                </td>
                                <th>Department(s)</th>
                                <th>Employee(s)</th>
                                <th>Report Date</th>
                            </tr>
                            <tr>
                                
                                <td><asp:Repeater runat="server" ID="rptDepartments" DataSource='<%# Eval("SearchDepartments")%>'><ItemTemplate><asp:Label runat="server" ID="lblSearchDepartment" Text='<%# Eval("Name") %>'></asp:Label></ItemTemplate>
                                <SeparatorTemplate><br /></SeparatorTemplate></asp:Repeater></td>
                                <td><asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("SearchEmployee.FullName") %>'></asp:Label></td>
                                <td><asp:Label ID="lblReportDate" runat="server" Text='<%# Eval("ReportDate", "{0:MM/dd/yyyy}") %>'></asp:Label></td>
                            </tr>
                        </table>
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <center><asp:Label Font-Bold="true" runat="server" Text="Employee Salary Comparison Report" Font-Size="Large"></asp:Label></center><br />
                
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="up">
                <ProgressTemplate>
                    Updating... <img id="process_bar" alt="process bar" src="images/common/Bright.WebControls.Resources.Progress.gif"/>
                </ProgressTemplate>
                </asp:UpdateProgress>
                
                <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                
                <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsEmployee" EmptyDataText="No Data Found." 
                    OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" AllowSorting="True" 
                    DataKeyNames="ID" OnSorting="gvEmployees_Sorting" 
                    onrowupdated="gvEmployees_RowUpdated" 
                    EnableViewState="False">
                    <PagerSettings Position="TopAndBottom" />
                    <HeaderStyle cssclass="tr_head" />
                    <AlternatingRowStyle CssClass="tr_alt" />
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
                        <asp:TemplateField HeaderText="Employee Name" SortExpression="FullName">
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
                                <asp:TextBox ID="tbAdjustedCareerHireDate" runat="server" 
                                    Text='<%# Bind("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                    
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Eval("AdjustedCareerHireDate", "{0:MM/dd/yyyy}") %>' 
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
                                    Text='<%# Eval("YearsOfService", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Begin Date (in Title)">
                            <EditItemTemplate>
                            <ajax:CalendarExtender ID="ceAdjustedApptHireDate" runat="server" CssClass="calendar" TargetControlID="tbAdjustedApptHireDate" Format="MM/dd/yyyy">
                                </ajax:CalendarExtender>
                                <asp:TextBox ID="tbAdjustedApptHireDate" runat="server" 
                                    Text='<%# Bind("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAdjustedApptHireDate" runat="server" 
                                    Text='<%# Eval("AdjustedApptHireDate", "{0:MM/dd/yyyy}") %>' BackColor='<%# ((bool)Eval("ApptDateHasBeenAdjusted") ? System.Drawing.Color.Red : System.Drawing.Color.White )  %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time In Title" SortExpression="TimeInTitle">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" 
                                    Text='<%# Eval("TimeInTitle", "{0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pay Rate" SortExpression="PayRate">
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
                                    Text='<%# Bind("DepartmentComments") %>' ReadOnly='<%# !IsDepartmentUser() %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("DepartmentComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dean's Office Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" 
                                    Text='<%# Bind("DeansOfficeComments") %>' ReadOnly='<%# IsDepartmentUser() %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DeansOfficeComments") %>'></asp:Label>
                            </ItemTemplate>
                        
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="up">
                <ProgressTemplate>
                    Updating...  <img id="process_bar" alt="process bar" src="images/common/Bright.WebControls.Resources.Progress.gif"/>
                </ProgressTemplate>
                </asp:UpdateProgress>
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
                <asp:SessionParameter DefaultValue="0" Name="titleCodes" 
                    SessionField="selectedTitleStrings" Type="Object" />
                <asp:ControlParameter ControlID="ddlEmployee" DefaultValue="0" 
                    Name="pkEmployee" PropertyName="SelectedValue" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="departmentIDs" 
                    SessionField="selectedDepartmentStrings" Type="Object" />
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
        <asp:ObjectDataSource ID="odsDepartmentUserDepartments" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsForUser" 
            TypeName="CAESDO.Esra.BLL.DepartmentBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="UserID" 
                    Type="String" />
                <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartmentUserEmployees" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetAllEmployeesForUser" 
                    TypeName="CAESDO.Esra.BLL.EmployeeBLL" >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="UserID" 
                    Type="String" />
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    </div>
   </asp:Content>