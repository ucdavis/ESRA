<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="TitleCode_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.TitleCode_UserInputForm" Title="ESRA - Title Code Averages Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
<div> <center><asp:Label ID="lblPageTitle" runat="server" 
            Text="Title Code Averages Maintenance" Font-Bold="True" 
            Font-Size="Larger"></asp:Label></center>
 <br />
    <hr />
    <br />
    <asp:ObjectDataSource ID="odsSalaryScale" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSalaryScale" 
        TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
        DataObjectTypeName="CAESDO.Esra.Core.Domain.SalaryScale" 
        UpdateMethod="UpdateRecord">
<SelectParameters>
<asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean"></asp:Parameter>
</SelectParameters>
    </asp:ObjectDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vTitleCodeAverages" runat="server">
        <asp:GridView ID="gvSalaryScale" runat="server" DataSourceID="odsSalaryScale" 
        AutoGenerateColumns="False" AllowSorting="True" 
        onsorting="gvSalaryScale_Sorting" 
        OnRowDataBound="gvSalaryScale_OnRowDataBound" 
        onselectedindexchanged="gvSalaryScale_SelectedIndexChanged" DataKeyNames="Title" 
                onrowupdated="gvSalaryScale_RowUpdated" 
                onrowediting="gvSalaryScale_RowEditing" >
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" ToolTip="Edit" CssClass="buttons"><img src="images/common/edit.png" alt="Edit" class="edit_button"/></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="New" ToolTip="New" CssClass="buttons"><img src="images/common/Document-new.png" alt="New" class="new_button"/></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" ToolTip="Save" CssClass="buttons"><img src="images/common/disk4.jpg" alt="Save" class="save_button"/></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ToolTip="Cancel" CssClass="buttons"><img src="images/common/cancel.png" alt="Cancel" class="cancel_button"/></asp:LinkButton>
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
            <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" 
                SortExpression="BargainingCode"  ReadOnly="true"/>
                
                 <asp:TemplateField HeaderText="# Salary Steps" SortExpression="NumSalarySteps">
                     <EditItemTemplate>
                         <asp:Label ID="lblEditNumSalarySteps" runat="server" Text='<%# Bind("NumSalarySteps") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblNumSalarySteps" runat="server" Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? String.Empty :  Eval("NumSalarySteps")) %>'></asp:Label>
                         <%--<asp:LinkButton ID="lbtnAddSteps" runat="server" OnCommand="btnClick_Command" CommandName="add_steps" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' Visible='<%# (Convert.ToInt32(Eval("NumSalarySteps")) > 0 ? false : true)%>'
                         Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? "Add Steps" :  "Edit Steps") %>'>
                         </asp:LinkButton>--%>
                         <asp:LinkButton ID="lbtnAddSteps" runat="server" OnCommand="btnClick_Command" CommandName="add_steps" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' 
                         Text='<%# ( Convert.ToInt32(Eval("NumSalarySteps")) == 0 ? "Add" :  "<br />view") %>'>
                         </asp:LinkButton>
                     </ItemTemplate>
            </asp:TemplateField>
                
            <asp:TemplateField HeaderText="Labor Market WAS" 
                SortExpression="LaborMarketWAS">
                <EditItemTemplate>
                <asp:Label ID="lblLaborMarketWASHeader" runat="server" Text="Labor Market WAS:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbLaborMarketWAS" runat="server" Text='<%# Bind("LaborMarketWAS") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLaborMarketWAS" runat="server" Text='<%# (Convert.ToDouble(Eval("LaborMarketWAS")) != 0 ? Eval("LaborMarketWAS", "{0:c}") : "") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Labor Market Mid (Annual)" 
                SortExpression="LaborMarketMidAnnual">
                <EditItemTemplate>
                <asp:Label ID="lblLaborMarketMidAnnualHeader" runat="server" Text="Labor Market Mid (Annual):" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbLaborMarketMidAnnual" runat="server" 
                        Text='<%# Bind("LaborMarketMidAnnual") %>'></asp:TextBox>
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
                <asp:Label ID="lblCampusAverageAnnualHeader" runat="server" Text="Campus Average (Annual):" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbCampusAverageAnnual" runat="server" 
                        Text='<%# Bind("CampusAverageAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCampusAverageAnnual" runat="server" Text='<%# (Convert.ToDouble(Eval("CampusAverageAnnual")) != 0 ? Eval("CampusAverageAnnual", "{0:c}") : "") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDeleteSalaryScaleAverages" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CausesValidation="False" 
                        CommandName="remove" Text="Delete" OnCommand="btnClick_Command" CommandArgument='<%# gvSalaryScale.Rows.Count.ToString() %>' ToolTip="Delete" CssClass="buttons"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </asp:View>
        <asp:View ID="vInsertNewTitleCodeAverages" runat="server">
            <table style="width:100%;" id="tblNewTitleCodeAverages">
                <tr class="tr_head">
                    <th>Title Code</th>
                    <th>Payroll Title</th>
                    <th>Effective Date</th>
                    <th>Salary Grade</th>
                    <th>Bargaining Code</th>
                    <th>Labor Market WAS</th>
                    <th>Labor Market Mid (Annual)</th>
                    <th>College Average (Annual)</th>
                    <th>Campus Average (Annual)</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTitleCode" runat="server" Text=""></asp:Label></td>
                    <td>
                        <asp:Label ID="lblPayrollTitle" runat="server" Text=""></asp:Label></td>
                    <td>
                        <ajax:CalendarExtender ID="ceEffectiveDate" runat="server" TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy" CssClass="calendar">
                        </ajax:CalendarExtender>
                        <asp:TextBox ID="tbEffectiveDate" runat="server" ></asp:TextBox><asp:RequiredFieldValidator
                            ID="rfvEffectiveDate" runat="server" ErrorMessage="Effective Date" Text="Date is Required!" ControlToValidate="tbEffectiveDate" InitialValue="" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator
                                ID="compareValEffectiveDate" runat="server" 
                            ErrorMessage="CompareValidator" Text="Bad Date Format!" Display="Dynamic" 
                            ControlToValidate="tbEffectiveDate" Operator="DataTypeCheck" 
                            Type="Date"></asp:CompareValidator></td>
                    <td>
                        <asp:Label ID="lblSalaryGrade" runat="server" Text=""></asp:Label>
                        </td>
                    <td>
                        <asp:Label ID="lblBargainingCode" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLaborMarketWAS" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLaborMarketMid" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblCollegeAverageAnnual" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCampusAverageAnnual" runat="server" Text=""></asp:TextBox>
                    </td>
                </tr>
                <tr><td colspan="2">
                    <asp:LinkButton ID="lbtnSave" runat="server" CommandName="save" oncommand="btnClick_Command" Text="Save" ToolTip="Save" CssClass="buttons">
                        <img alt="Save" class="new_button" src="images/common/disk4.jpg"/>
                    </asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnCancel" runat="server" CommandName="cancel" 
                        oncommand="btnClick_Command" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CssClass="buttons"><img alt="Cancel" class="cancel_button" src="images/common/Cancel.png"/>
                    </asp:LinkButton>
                    &nbsp;</td>
                </tr>
            </table>
            
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
