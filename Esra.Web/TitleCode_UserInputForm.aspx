<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="TitleCode_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.TitleCode_UserInputForm" Title="ESRA - Title Code Averages Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
<div><h1 id="page_title"><asp:Label ID="lblPageTitle" runat="server" 
            Text="Title Code Averages Maintenance"></asp:Label></h1>
 </div>
 <div class="right_col">
 <div id="ESCR_table">
  <br />
    <asp:ObjectDataSource ID="odsSalaryScale" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSalaryScales" 
        TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
        DataObjectTypeName="CAESDO.Esra.Core.Domain.SalaryScale" 
        UpdateMethod="UpdateRecord">
<SelectParameters>
    <asp:ControlParameter ControlID="ddlSelectTitleCode" DefaultValue="0" 
        Name="titleCode" PropertyName="SelectedValue" Type="String" />
<asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean"></asp:Parameter>
</SelectParameters>
    </asp:ObjectDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vTitleCodeAverages" runat="server">
            <asp:DropDownList ID="ddlSelectTitleCode" runat="server" 
                AppendDataBoundItems="True" DataSourceID="odsTitleCode" 
                DataTextField="TitleCode_Name" DataValueField="TitleCode" 
                AutoPostBack="True" >
                <asp:ListItem Value="0">-- All Title Codes --</asp:ListItem>
            </asp:DropDownList>
            <ajax:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="ddlSelectTitleCode">
            </ajax:ListSearchExtender>
            <asp:ObjectDataSource ID="odsTitleCode" runat="server" 
                TypeName="CAESDO.Esra.BLL.TitleBLL" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll"></asp:ObjectDataSource>
<br />
<br />



<h2 class="h2_black">&nbsp;</h2>
        <asp:GridView ID="gvSalaryScale" runat="server" DataSourceID="odsSalaryScale" 
        AutoGenerateColumns="False" AllowSorting="True" 
        onsorting="gvSalaryScale_Sorting" 
        OnRowDataBound="gvSalaryScale_OnRowDataBound" 
        onselectedindexchanged="gvSalaryScale_SelectedIndexChanged" DataKeyNames="TitleCode, EffectiveDate" 
                onrowupdating="gvSalaryScale_RowUpdating"  GridLines="None" Width="100%">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
            <ItemStyle Width="50px" />
                <ItemTemplate>
                
                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" ToolTip="Edit" CssClass="buttons"><img src="images/common/edit.png" alt="Edit" class="edit_button"/></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="New" ToolTip="New" CssClass="buttons"><img src="images/common/Document-new.png" height="21px" width="21px" alt="New" class="new_button"/></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" ToolTip="Save" CssClass="buttons"><img src="images/common/disk4.jpg" width="21px" height="21px" alt="Save" class="save_button"/></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ToolTip="Cancel" CssClass="buttons"><img src="images/common/cancel.png" width="21px" height="21px" alt="Cancel" class="cancel_button"/></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Title Code" SortExpression="TitleCode">
                 <ItemTemplate>
                     <asp:Label ID="lblTitleCode" runat="server" Text='<%# Bind("TitleCode") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Label ID="lblEditTitleCode" runat="server" Text='<%# Eval("TitleCode") %>'></asp:Label>
                 </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title.PayrollTitle">
                <EditItemTemplate>
                    <asp:Label ID="lblEditTitle" runat="server" 
                        Text='<%# Bind("Title.PayrollTitle") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" 
                        Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
                <ItemTemplate>
                    <asp:Label ID="lblEffectiveDate" runat="server" 
                        Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblEditEffectiveDate" runat="server" 
                        Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <%-- <asp:BoundField DataField="TitleCode" HeaderText="Title Code" 
                SortExpression="TitleCode" ReadOnly="true"/>--%>
                <%--<asp:TemplateField HeaderText="Salary Grade" SortExpression="SalaryGrade">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbSalaryGrade" runat="server" Text='<%# Bind("SalaryGrade") %>' Enabled='<%# !CAESDO.Esra.BLL.SalaryScaleBLL.HasSalaryReviewAnalysis((CAESDO.Esra.Core.Domain.SalaryScale)Container.DataItem) %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Bind("SalaryGrade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                
                <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                SortExpression="SalaryGrade"  ReadOnly="true"/>
                
                <%--<asp:TemplateField HeaderText="Bargaining Code" SortExpression="BargainingCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbBargainingCode" runat="server" Text='<%# Bind("BargainingCode") %>' Enabled='<%# !CAESDO.Esra.BLL.SalaryScaleBLL.HasSalaryReviewAnalysis((CAESDO.Esra.Core.Domain.SalaryScale)Container.DataItem) %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBargainingCode" runat="server" Text='<%# Bind("BargainingCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                
                <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" 
                SortExpression="BargainingCode"  ReadOnly="true"/>
                
                 <asp:TemplateField HeaderText="# Salary Steps" SortExpression="NumSalarySteps">
                     <EditItemTemplate>
                         <asp:Label ID="lblEditNumSalarySteps" runat="server" Text='<%# Bind("NumSalarySteps") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblNumSalarySteps" Font-Underline="false" runat="server" Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? String.Empty :  Eval("NumSalarySteps")) %>'></asp:Label>
                         <%--<asp:LinkButton ID="lbtnAddSteps" runat="server" OnCommand="btnClick_Command" CommandName="add_steps" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' Visible='<%# (Convert.ToInt32(Eval("NumSalarySteps")) > 0 ? false : true)%>'
                         Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? "Add Steps" :  "Edit Steps") %>'>
                         </asp:LinkButton>--%>
                         <asp:LinkButton ID="lbtnAddSteps" Font-Underline="true" runat="server" OnCommand="btnClick_Command" CommandName="add_steps" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' 
                         Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? "Add" :  "<br />view") %>' 
                         ToolTip='<%# (Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? "Add Salary Steps" :  "View/Edit Salary Steps") %>'>
                         </asp:LinkButton>
                     </ItemTemplate>
            </asp:TemplateField>
                
            <asp:TemplateField HeaderText="Labor Market WAS" 
                SortExpression="LaborMarketWAS">
                <EditItemTemplate>
                <asp:Label ID="lblLaborMarketWASHeader" runat="server" Text="Labor Market WAS:<br />&nbsp" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbLaborMarketWAS" runat="server" Text='<%# Bind("LaborMarketWAS") %>'></asp:TextBox>
                    <asp:CompareValidator ID="cvLaborMarketWAS" runat="server" ErrorMessage="CompareValidator" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbLaborMarketWAS" Operator="DataTypeCheck" 
                            Type="Currency"></asp:CompareValidator>
                </EditItemTemplate>
                
                <ItemTemplate>
                    <asp:Label ID="lblLaborMarketWAS" runat="server" Text='<%# (Convert.ToDouble(Eval("LaborMarketWAS")) != 0 ? Eval("LaborMarketWAS", "{0:c}") : "") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Labor Market Mid (Annual)" 
                SortExpression="LaborMarketMidAnnual">
                <EditItemTemplate>
                <asp:Label ID="lblLaborMarketMidAnnualHeader" runat="server" Text="Labor Market Mid<br />(Annual):" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbLaborMarketMidAnnual" runat="server" 
                        Text='<%# Bind("LaborMarketMidAnnual") %>'></asp:TextBox>
                        <asp:CompareValidator ID="cvLaborMarketMidAnnual" runat="server" ErrorMessage="Labor Market Mid <br /> (Annual)" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbLaborMarketMidAnnual" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLaborMarketMidAnnual" runat="server" 
                        Text='<%# (Convert.ToDouble(Eval("LaborMarketMidAnnual")) != 0 ? Eval("LaborMarketMidAnnual", "{0:c}") : "") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="College Average (Annual)" 
                SortExpression="CollegeAverageAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblCollegeAverageAnnual" runat="server" 
                        Text='<%# (Convert.ToDouble(Eval("CollegeAverageAnnual")) != 0 ? Eval("CollegeAverageAnnual", "{0:c}") : "") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Campus Average (Annual)" 
                SortExpression="CampusAverageAnnual">
                <EditItemTemplate>
                <asp:Label ID="lblCampusAverageAnnualHeader" runat="server" Text="Campus Average <br />(Annual):" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbCampusAverageAnnual" runat="server" 
                        Text='<%# Bind("CampusAverageAnnual") %>'></asp:TextBox>
                         <asp:CompareValidator ID="cvCampusAverageAnnual" runat="server" ErrorMessage="Campus Average (Annual)" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbCampusAverageAnnual" Operator="DataTypeCheck" 
                            Type="Currency"></asp:CompareValidator></EditItemTemplate><ItemTemplate>
                    <asp:Label ID="lblCampusAverageAnnual" runat="server" Text='<%# (Convert.ToDouble(Eval("CampusAverageAnnual")) != 0 ? Eval("CampusAverageAnnual", "{0:c}") : "") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDeleteSalaryScaleAverages" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CausesValidation="False" 
                        CommandName="remove" Text="Delete" OnCommand="btnClick_Command" CommandArgument='<%# gvSalaryScale.Rows.Count.ToString() %>' ToolTip="Delete" CssClass="buttons" Visible='<%# CAESDO.Esra.BLL.SalaryScaleBLL.CanBeDeleted((CAESDO.Esra.Core.Domain.SalaryScale)Container.DataItem) %>'><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton></ItemTemplate></asp:TemplateField></Columns></asp:GridView></asp:View><asp:View ID="vInsertNewTitleCodeAverages" runat="server">
                        
                        
                        
                        
            <table id="tblNewTitleCodeAverages">
                <tr class="tr_head">
                    <th>Title Code</th><th>Payroll Title</th><th>Effective Date</th><th>Salary Grade</th><th>Bargaining Code</th><th>Labor Market WAS</th><th>Labor Market Mid (Annual)</th><th>College Average (Annual)</th><th>Campus Average (Annual)</th></tr><tr>
                    <td>
                        <asp:Label ID="lblTitleCode" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPayrollTitle" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <ajax:CalendarExtender ID="ceEffectiveDate" runat="server" CssClass="calendar" 
                            Format="MM/dd/yyyy" TargetControlID="tbEffectiveDate">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbEffectiveDate" runat="server" Width="75px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEffectiveDate" runat="server" 
                            ControlToValidate="tbEffectiveDate" Display="Dynamic" 
                            ErrorMessage="Effective Date" InitialValue="" Text="Date is Required!"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compareValEffectiveDate" runat="server" 
                            ControlToValidate="tbEffectiveDate" Display="Dynamic" 
                            ErrorMessage="Effective Date" Operator="DataTypeCheck" Text="Bad Date Format!" 
                            Type="Date"></asp:CompareValidator>
                    </td>
                    <%--<td>
                        <asp:Label ID="lblSalaryGrade" runat="server" Text=""></asp:Label>
                    </td>--%>
                    <td>
                        <asp:TextBox ID="tbSalaryGrade" runat="server" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="SalaryGradeRequiredFieldValidator" runat="server" 
                            ControlToValidate="tbSalaryGrade" Display="Dynamic" 
                            ErrorMessage="Salary Grade" InitialValue="" Text="Salary Grade is Required!"></asp:RequiredFieldValidator>
                    </td>
                    <%--<td>
                        <asp:Label ID="lblBargainingCode" runat="server" Text=""></asp:Label>
                    </td>--%>
                    <td>
                        <asp:TextBox ID="tbBargainingCode" runat="server" 
                            ontextchanged="tbBargainingCode_TextChanged" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="BargainingCodeRequiredFieldValidator" runat="server" 
                            ControlToValidate="tbBargainingCode" Display="Dynamic" 
                            ErrorMessage="Bargaining Code" InitialValue="" Text="Bargaining Code is Required!"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLaborMarketWAS" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="cvLaborMarketWAS" runat="server" ErrorMessage="Labor Market WAS" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbLaborMarketWAS" Operator="DataTypeCheck" 
                            Type="Currency"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLaborMarketMid" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="cvLaborMarketMid" runat="server" ErrorMessage="Labor Market Mid (Annual)" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbLaborMarketMid" Operator="DataTypeCheck" 
                            Type="Currency"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:Label ID="lblCollegeAverageAnnual" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCampusAverageAnnual" runat="server" Text=""></asp:TextBox>
                        <asp:CompareValidator ID="cvCampusAverageAnnual" runat="server" ErrorMessage="Campus Average (Annual)" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbCampusAverageAnnual" Operator="DataTypeCheck" 
                            Type="Currency"></asp:CompareValidator>
                    </td>
                    </tr>
                    <tr><td style="border:none;">
                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="save" 
                            CssClass="buttons" oncommand="btnClick_Command" Text="Save" ToolTip="Save">
                    <img alt="Save" class="save_button" width="21px" height="21px" src="images/common/disk4.jpg"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="false" 
                            CommandName="cancel" CssClass="buttons" oncommand="btnClick_Command" 
                            Text="Cancel" ToolTip="Cancel"><img 
                        alt="Cancel" width="21px" height="21px" class="cancel_button" src="images/common/Cancel.png"/></asp:LinkButton>
                        &nbsp;</td>
                        <td colspan="8" style="border:none;"/></tr></table></asp:View></asp:MultiView>
                        </div>
                        </div>
                        </div>
                        </asp:Content>