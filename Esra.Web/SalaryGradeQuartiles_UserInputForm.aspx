<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryGradeQuartiles_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryGradeQuartiles_UserInputForm" Title="ESRA - Salary Grade Quartiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
  <h1 id="page_title"><asp:Label ID="lblPageTitle" runat="server" Text="Salary Grade Quartiles Maintenance"></asp:Label></h1>
 <div class="right_col_med">
<div id="ESCR_table">
    <asp:ObjectDataSource ID="odsSalaryGradeQuartiles" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.Esra.BLL.SalaryGradeQuartilesBLL" 
        UpdateMethod="UpdateRecord" >
        <UpdateParameters>
            <asp:Parameter Name="salaryGrade" Type="String" />
            <asp:Parameter Name="minAnnual" Type="Decimal" />
            <asp:Parameter Name="firstQrtleAnnual" Type="Decimal" />
            <asp:Parameter Name="midAnnual" Type="Decimal" />
            <asp:Parameter Name="thirdQrtleAnnual" Type="Decimal" />
            <asp:Parameter Name="maxAnnual" Type="Decimal" />
            <asp:Parameter Name="effectiveDate" Type="DateTime" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSelectQuartile" DefaultValue="0" 
                Name="salaryGrade" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter DefaultValue="SalaryGrade" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vShowQuartiles" runat="server">
        <div id="divSelectQuartile">
        <asp:DropDownList ID="ddlSelectQuartile" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" 
            DataSourceID="odsQuartiles" 
            onselectedindexchanged="ddlSelectQuartile_SelectedIndexChanged">
            <asp:ListItem Value="0">-- All Salary Grades --</asp:ListItem>
        </asp:DropDownList>
        <ajax:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="ddlSelectQuartile">
        </ajax:ListSearchExtender>
        <asp:ObjectDataSource ID="odsQuartiles" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDistinctSalaryGrades" 
            TypeName="CAESDO.Esra.BLL.SalaryGradeQuartilesBLL" ></asp:ObjectDataSource>
    </div>
    <div id="SGQUIF">
    <h2 class="h2_black">&nbsp</h2>
    <asp:GridView ID="gvSalaryGradeQuartiles" runat="server" 
        DataSourceID="odsSalaryGradeQuartiles" AutoGenerateColumns="False" 
        AllowSorting="True" onrowdatabound="gvSalaryGradeQuartiles_OnRowDataBound" 
        onsorting="gvSalaryGradeQuartiles_Sorting"
        OnRowUpdating="gvSalaryGradeQuartiles_RowUpdating" 
        onrowcommand="gvSalaryGradeQuartiles_RowCommand" 
        DataKeyNames="SalaryGrade,EffectiveDate" 
        onselectedindexchanged="gvSalaryGradeQuartiles_SelectedIndexChanged" GridLines="None">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <%--<asp:CommandField ShowEditButton="True" ShowSelectButton="true" CausesValidation="true" ValidationGroup="UpdateRecord"/>
            --%><asp:TemplateField>
            <ItemStyle Width="50px" />
            <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" ToolTip="Edit" CssClass="buttons"><img src="images/common/edit.png" alt="Edit" width="21px" height="21px" class="edit_button"/></asp:LinkButton>
                    <asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="New" ToolTip="New" CssClass="buttons"><img src="images/common/Document-new.png" alt="New" width="21px" height="21px" class="new_button"/></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="true" 
                        CommandName="Update" Text="Update" ToolTip="Save" CssClass="buttons" ValidationGroup="UpdateRecord"><img src="images/common/disk4.jpg" alt="Save" width="21px" height="21px" class="save_button"/></asp:LinkButton>
                    <br /><asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ToolTip="Cancel" CssClass="buttons"><img src="images/common/cancel.png" alt="Cancel" width="21px" height="21px" class="cancel_button"/></asp:LinkButton>
                </EditItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Salary Grade" SortExpression="SalaryGrade">
                <InsertItemTemplate>
                    <asp:Label ID="lblSalaryGradeHeader" runat="server" Text="Salary Grade:" CssClass="edit_header"/><br />
                    <asp:Label ID="tbSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblSalaryGradeHeader" runat="server" Text="Salary Grade:" CssClass="edit_header"/><br />
                    <asp:Label ID="tbSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Bind("SalaryGrade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Min Annual" SortExpression="MinAnnual">
                <InsertItemTemplate>
                    <asp:Label ID="lblMinAnnualHeader" runat="server" Text="Min <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMinAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMinAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:c}") %>' ></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMinAnnualHeader" runat="server" Text="Min <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMinAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMinAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Qrtle Annual" 
                SortExpression="FirstQrtleAnnual">
                    <InsertItemTemplate>
                    <asp:Label ID="lblFirstQrtleAnnualHeader" runat="server" Text="First Qrtle Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual", "{0:#.##}") %>'></asp:TextBox><asp:CompareValidator
                            ID="cvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbFirstQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbFirstQrtleAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblFirstQrtleAnnualHeader" runat="server" Text="First Qrtle Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual", "{0:#.##}") %>'></asp:TextBox><asp:CompareValidator
                            ID="cvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbFirstQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbFirstQrtleAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mid Annual" SortExpression="MidAnnual">
                <InsertItemTemplate>
                    <asp:Label ID="lblMidAnnualHeader" runat="server" Text="Mid <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:#.##}") %>'></asp:TextBox>
                     <asp:CompareValidator
                            ID="cvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMidAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMidAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMidAnnualHeader" runat="server" Text="Mid <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:#.##}") %>'></asp:TextBox>
                     <asp:CompareValidator
                            ID="cvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMidAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMidAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Third Qrtle Annual" 
                SortExpression="ThirdQrtleAnnual">
                <InsertItemTemplate>
                    <asp:Label ID="lblThirdQrtleAnnualHeader" runat="server" Text="Third Qrtle Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual", "{0:#.##}") %>'></asp:TextBox>
                        <asp:CompareValidator
                            ID="cvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbThirdQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbThirdQrtleAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblThirdQrtleAnnualHeader" runat="server" Text="Third Qrtle Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual", "{0:#.##}") %>'></asp:TextBox>
                        <asp:CompareValidator
                            ID="cvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbThirdQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbThirdQrtleAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Max Annual" SortExpression="MaxAnnual">
                <InsertItemTemplate>
                    <asp:Label ID="lblMaxAnnualHeader" runat="server" Text="Max <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMaxAnnual" runat="server" ErrorMessage="Max Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMaxAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMaxAnnual" runat="server" ErrorMessage="Max Annual $" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMaxAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMaxAnnualHeader" runat="server" Text="Max <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMaxAnnual" runat="server" ErrorMessage="Max Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMaxAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMaxAnnual" runat="server" ErrorMessage="Max Annual $" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMaxAnnual" ValidationGroup="UpdateRecord"></asp:RequiredFieldValidator>
                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
                 <InsertItemTemplate>
                    <asp:Label ID="lblEffectiveDateHeader" runat="server" Text="Effective Date:" CssClass="edit_header"/><br />
                    <%--<ajax:CalendarExtender ID="ceEffectiveDate" runat="server" CssClass="calendar" TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy" >
                    </ajax:CalendarExtender>--%>
                    <asp:Label ID="tbEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}" ) %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblEffectiveDate" runat="server" 
                        Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblEffectiveDateHeader" runat="server" Text="Effective Date:" CssClass="edit_header"/><br />
                    <%--<ajax:CalendarExtender ID="ceEffectiveDate" runat="server" CssClass="calendar" TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy" >
                    </ajax:CalendarExtender>--%>
                    <asp:Label ID="tbEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}" ) %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
            <ItemTemplate><asp:LinkButton ID="lbtnDeleteSalaryGradeQuartiles" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CausesValidation="false" 
                        CommandName="remove" Text="Delete" OnCommand="btnClick_Command" CommandArgument='<%# gvSalaryGradeQuartiles.Rows.Count.ToString() %>' ToolTip="Delete" CssClass="buttons" Visible='<%# !HasSalaryScales(Container.DataItem) %>'><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton></ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
        </asp:View>
        <asp:View ID="vInsertQuartile" runat="server" EnableViewState="false">
            <table>
            <tr class="tr_head">
            <th class="tr_head">&nbsp;</th>
            <th class="tr_head">Salary Grade</th>
            <th class="tr_head">Min Annual</th>
            <th class="tr_head">First Qrtle Annual</th>
            <th class="tr_head">Mid Annual</th>
            <th class="tr_head">Third Qrtle Annual</th>
            <th class="tr_head">Max Annual</th>
            <th class="tr_head">Effective Date</th>
            </tr>
            <tr>
            <td>
                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="save" 
                            CssClass="buttons" oncommand="btnClick_Command" Text="Save" ToolTip="Save" ValidationGroup="InsertRecord">
                    <img alt="Save" class="save_button" src="images/common/disk4.jpg"/></asp:LinkButton><br />
                        <asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="false" 
                            CommandName="cancel" CssClass="buttons" oncommand="btnClick_Command" 
                            Text="Cancel" ToolTip="Cancel"><img 
                        alt="Cancel" class="cancel_button" src="images/common/Cancel.png"/></asp:LinkButton>
            </td>
            <td><asp:Label ID="lblSalaryGrade" runat="server"></asp:Label></td>
            <td><asp:TextBox ID="tbMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMinAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMinAnnual" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
            </td>
            <td><asp:TextBox ID="tbFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual", "{0:#.##}") %>'></asp:TextBox><asp:CompareValidator
                            ID="cvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbFirstQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvFirstQrtleAnnual" runat="server" ErrorMessage="First Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbFirstQrtleAnnual" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
            </td>
            <td><asp:TextBox ID="tbMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:#.##}") %>'></asp:TextBox>
                     <asp:CompareValidator
                            ID="cvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMidAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMidAnnual" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
                </td>
                <td><asp:TextBox ID="tbThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual", "{0:#.##}") %>'></asp:TextBox>
                        <asp:CompareValidator
                            ID="cvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbThirdQrtleAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvThirdQrtleAnnual" runat="server" ErrorMessage="Third Qrtle Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbThirdQrtleAnnual" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
                </td>
                <td><asp:TextBox ID="tbMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMaxAnnual" runat="server" ErrorMessage="Max Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMaxAnnual" Operator="DataTypeCheck" 
                            Type="Currency" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvMaxAnnual" runat="server" ErrorMessage="Max Annual" Text="Amount Required!" Display="Dynamic" ControlToValidate="tbMaxAnnual" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
                </td>
                <td><ajax:CalendarExtender ID="ceEffectiveDate" runat="server" CssClass="calendar" TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy" >
                    </ajax:CalendarExtender>
                    <asp:TextBox ID="tbEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}" ) %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvEffectiveDate" runat="server" ErrorMessage="Effective Date" Text="Bad Date Format!" Display="Dynamic" 
                            ControlToValidate="tbEffectiveDate" Operator="DataTypeCheck" 
                            Type="Date" ValidationGroup="InsertRecord"></asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="rfvEffectiveDate" runat="server" ErrorMessage="Effective Date" Text="Date Required!" Display="Dynamic" ControlToValidate="tbEffectiveDate" ValidationGroup="InsertRecord"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            </table>
        </asp:View>
    </asp:MultiView>

</div>    
    
</asp:Content>
