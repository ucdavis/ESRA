<%@ Page Title="ESRA - Salary Step Manintenance" Language="C#" MasterPageFile="~/Esra.Master"
    AutoEventWireup="true" CodeBehind="SalaryStep_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryStep_UserInputForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div><h1 id="page_title"><asp:Label ID="lblPageTitle" runat="server" Text="Salary Step Manintenance"></asp:Label></h1></div>
 <div class="right_col">
<div id="ESCR_table">
<div id="SSUIF">
<br />
<h2 class="h2_black">&nbsp;</h2>
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="vDisplaySalaryScales" runat="server" >
        <asp:GridView ID="gvSalaryScales" runat="server" DataSourceID="odsSalaryScale" AutoGenerateColumns="False"
            AllowSorting="True" OnSorting="gvSalaryScales_Sorting">
            <HeaderStyle CssClass="tr_head" />
            <AlternatingRowStyle CssClass="tr_alt" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                <ItemStyle Width="50px" />
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" ToolTip="Edit" CssClass="buttons"><img src="images/common/edit.png" alt="Edit" class="edit_button"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" CommandName="Copy"
                            CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' Text="Copy"
                            ToolTip="Copy" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand"><img src="images/common/Document-new.png" alt="New" class="new_button" /></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" CommandName="Save" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>'
                            Text="Update" ToolTip="Save" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand" ValidationGroup="Update"><img src="images/common/disk4.jpg" alt="Save" width="21px" height="21px" class="save_button"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" ToolTip="Cancel" CssClass="buttons"><img src="images/common/cancel.png" alt="Cancel" width="21px" height="21px" class="cancel_button"/></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TitleCode" HeaderText="Title Code" SortExpression="TitleCode"
                    ReadOnly="true" ItemStyle-Width="150px"/>
                <asp:TemplateField HeaderText="Title" SortExpression="Title.PayrollTitle">
                <ItemStyle Width="300px" />
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EffectiveDate" SortExpression="EffectiveDate" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                    SortExpression="EffectiveDate" ApplyFormatInEditMode="true" />--%>
                <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" SortExpression="NumSalarySteps" ReadOnly="true" ItemStyle-Width="150px"/>
                <asp:TemplateField HeaderText="SalarySteps">
               
                    <ItemTemplate>
                        <asp:Panel ID="pnlNoStepDetails" runat="server">
                            <div style="float: left; margin-left: 5px;">
                                <asp:Label ID="lblShowDetails" runat="server" Text=""></asp:Label></div>
                            <div style="float: right; vertical-align: middle;">
                                &nbsp;<asp:ImageButton ID="imgExpand" runat="server" ImageUrl="~/images/common/expand_blue.jpg"
                                    AlternateText="(Show Details...)" /></div>
                        </asp:Panel>
                        <asp:Panel ID="pnlStepDetails" runat="server">
                            <asp:Repeater ID="rptSalarySteps" runat="server" DataSource='<%# Eval("SalarySteps") %>'>
                                <HeaderTemplate>
                                    <table  id="SSUIF_pannel">
                                        <tr class="tr_subhead">
                                            <th>
                                                Step #
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
                                        <td>
                                            <asp:Label ID="lblStepNumber" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAnnual" runat="server" Text='<%# Eval("Annual", "{0:c}") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMonthly" runat="server" Text='<%# Eval("Monthly", "{0:c}") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblHourly" runat="server" Text='<%# Eval("Hourly", "{0:c}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <ajax:CollapsiblePanelExtender ID="cpnlSteps" runat="server" TargetControlID="pnlStepDetails"
                            ExpandControlID="pnlNoStepDetails" CollapseControlID="pnlNoStepDetails" Collapsed="True"
                            TextLabelID="lblShowDetails" ImageControlID="imgExpand" ExpandedText="(Hide Steps)"
                            CollapsedText="(Show Steps...)" ExpandedImage="~/images/common/collapse_blue.jpg"
                            CollapsedImage="~/images/common/expand_blue.jpg" AutoCollapse="false" CollapsedSize="0"
                            AutoExpand="false" SuppressPostBack="true" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ListView ID="lvSalarySteps" runat="server" ItemPlaceholderID="DataSection" DataSource='<%# Eval("SalarySteps")%>'
                            OnItemEditing="lvSalarySteps_ItemEditing">
                            <LayoutTemplate>
                                <table>
                                    <tr class="tr_subhead">
                                        <th>
                                            Step #
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
                                    <asp:PlaceHolder ID="DataSection" runat="server"></asp:PlaceHolder>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <asp:UpdatePanel runat="server" ID="upSalaryStep">
                                    <ContentTemplate>
                                        <tr>
                                            <th>
                                                <asp:Label ID="lblStepNumber" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label>
                                            </th>
                                            <td>
                                                <asp:TextBox ID="tbAnnual" runat="server" Text='<%# Bind("Annual", "{0:c}") %>' OnTextChanged="tbSalaryAmount_OnTextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="tbAnnualRequiredFieldValidator" runat="server"
                                                             ErrorMessage="Annual $"
                                                             Display="Dynamic" Text="Amount > $0 Required!"
                                                             ControlToValidate="tbAnnual"
                                                             InitialValue="$0.00"
                                                             ValidationGroup="Update">
                                                </asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblMonthly" runat="server" Text='<%# Eval("Monthly", "{0:c}") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblHourly" runat="server" Text='<%# Eval("Hourly", "{0:c}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <asp:UpdatePanel runat="server" ID="upSalaryStepAlt">
                                    <ContentTemplate>
                                        <tr class="tr_alt">
                                            <th>
                                                <asp:Label ID="lblStepNumberAlt" runat="server" Text='<%# Eval("StepNumber") %>' CssClass="tb_alt"></asp:Label>
                                            </th>
                                            <td>
                                                <asp:TextBox ID="tbAnnualAlt" runat="server" Text='<%# Bind("Annual", "{0:c}") %>' CssClass="tb_alt" OnTextChanged="tbSalaryAmount_OnTextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="tbAnnualAltRequiredFieldValidator" runat="server"
                                                             ErrorMessage="Annual $"
                                                             Display="Dynamic" Text="Amount > $0 Required!"
                                                             ControlToValidate="tbAnnualAlt"
                                                             InitialValue="$0.00"
                                                             ValidationGroup="Update">
                                                </asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblMonthlyAlt" runat="server" Text='<%# Eval("Monthly", "{0:c}") %>' CssClass="tb_alt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblHourlyAlt" runat="server" Text='<%# Eval("Hourly", "{0:c}") %>' CssClass="tb_alt"></asp:Label>
                                            </td>
                                        </tr>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </AlternatingItemTemplate>
                        </asp:ListView>
                    </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ShowHeader="False">
                 <ItemStyle Width="20px" />
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDeleteSalaryScale" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CausesValidation="False" 
                        CommandName="remove" Text="Delete" OnCommand="btnClick_Command" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate")  %>' ToolTip="Delete" CssClass="buttons"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:View>    
    <asp:View ID="vEditNewSalaryScale" runat="server">
    <div ID="SSUIF_addnew">
        <asp:ListView ID="lvNewSalaryScale" runat="server" OnItemUpdating="vNewSalaryScale_ItemUpdating">
            <ItemTemplate>
                <tr>
                    <td>
                     <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" CommandName="Update" 
                            Text="Save" ToolTip="Save" CssClass="buttons" OnCommand="lvNewSalaryScale_OnCommand"
                            CommandArgument='<%# Container %>'><img src="images/common/disk4.jpg" alt="Save"
                             class="save_button"/></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False"
                            CommandName="Close" Text="Cancel" ToolTip="Close" CssClass="buttons"
                            OnCommand="lvNewSalaryScale_OnCommand"><img src="images/common/cancel.png" alt="Cancel" class="cancel_button"/></asp:LinkButton>
                        
                        <%--<asp:Button ID="SaveButton" runat="server" CommandName="Update" CommandArgument='<%# Container %>' Text="Save" OnCommand="lvNewSalaryScale_OnCommand"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Close" Text="Cancel" OnCommand="lvNewSalaryScale_OnCommand"/>--%>
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title.PayrollTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                         <asp:CompareValidator ID="cvEffectiveDate" runat="server" ErrorMessage="Effective Date" Display="Dynamic"
                    Text="Bad Date Format!" ControlToValidate="tbEffectiveDate" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="tbEffectiveDateRequiredFieldValidator" runat="server"
                                                             ErrorMessage="Effective Date"
                                                             Display="Dynamic" Text="Date Required!"
                                                             ControlToValidate="tbEffectiveDate"></asp:RequiredFieldValidator>
                                                             <ajax:CalendarExtender
                                                                 ID="ceTbEffectiveDate" runat="server"
                                                                  TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy" 
                                                                  PopupPosition="BottomRight" CssClass="calendar">
                                                             </ajax:CalendarExtender>
                    </td>
                    <td>
                        <asp:Label ID="NumSalaryStepsLabel" runat="server" Text='<%# Eval("SalarySteps.Count") %>' />
                    </td>
                    <td>
                        <asp:ListView ID="lvSalarySteps" runat="server" ItemPlaceholderID="DataSection" DataSource='<%# Eval("SalarySteps")%>'
                            OnItemEditing="lvSalarySteps_ItemEditing">
                           
                                    <LayoutTemplate>
                                        <table>
                                            <tr class="tr_subhead">
                                                <th>
                                                    Step #
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
                                           
                                            <asp:PlaceHolder ID="DataSection" runat="server"></asp:PlaceHolder>
                                           
                                        </table>
                                    </LayoutTemplate>
                                    
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStepNumber2" runat="server" Text='<%# Eval("StepNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAnnual2" runat="server" Text='<%# Bind("Annual" ,"{0:c}") %>' OnTextChanged="tbSalaryAmount_OnTextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                            <asp:CompareValidator ID="cvAnnual2" runat="server" ErrorMessage="Annual $" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbAnnual2" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="tbAnnual2RequiredFieldValidator" runat="server"
                                                             ErrorMessage="Annual $"
                                                             Display="Dynamic" Text="Value Required!"
                                                             ControlToValidate="tbAnnual2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthly2" runat="server" Text='<%# Eval("Monthly" ,"{0:c}") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHourly2" runat="server" Text='<%# Eval("Hourly" ,"{0:c}") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr class="tr_alt">
                                    <td>
                                        <asp:Label ID="lblStepNumber3" runat="server" Text='<%# Eval("StepNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAnnual3" runat="server" Text='<%# Bind("Annual" ,"{0:c}") %>' CssClass="tb_alt"
                                            OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                            <asp:CompareValidator ID="cvAnnual3" runat="server" ErrorMessage="Annual $" Display="Dynamic"
                    Text="Bad Number Format!" ControlToValidate="tbAnnual3" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="tbAnnual3RequiredFieldValidator" runat="server"
                                                             ErrorMessage="Annual $"
                                                             Display="Dynamic" Text="Value Required!"
                                                             ControlToValidate="tbAnnual3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthly3" runat="server" Text='<%# Eval("Monthly" ,"{0:c}") %>' CssClass="tb_alt"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHourly3" runat="server" Text='<%# Eval("Hourly" ,"{0:c}") %>' CssClass="tb_alt"></asp:Label>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:ListView>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="tr_alt" />
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title.PayrollTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="EffectiveDateLabel" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="NumSalaryStepsLabel" runat="server" Text='<%# Eval("NumSalarySteps") %>' />
                </td>
                <td>
                    <asp:Label ID="SalaryStepsLabel" runat="server" Text='<%# Eval("SalarySteps") %>' />
                </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table id="Table1" runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title.PayrollTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TitleCodeTextBox" runat="server" Text='<%# Bind("TitleCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EffectiveDateTextBox" runat="server" Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NumSalaryStepsTextBox" runat="server" Text='<%# Bind("NumSalarySteps") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SalaryStepsTextBox" runat="server" Text='<%# Bind("SalarySteps") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="Tr2" runat="server" class="tr_head">
                                    <th>
                                    </th>
                                    <th id="Th1" runat="server">
                                        Payroll Title
                                    </th>
                                    <th id="Th2" runat="server">
                                        Title Code
                                    </th>
                                    <th id="Th3" runat="server">
                                        Effective Date
                                    </th>
                                    <th id="Th4" runat="server">
                                        # Salary Steps
                                    </th>
                                    <th id="Th5" runat="server">
                                        SalarySteps
                                    </th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="TitleTextBox" runat="server" Text='<%# Eval("Title.PayrollTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleCodeTextBox" runat="server" Text='<%# Eval("TitleCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EffectiveDateTextBox" runat="server" Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                        <asp:CompareValidator ID="cvEffectiveDateTextBox" runat="server" ErrorMessage="Effective Date" Display="Dynamic"
                    Text="Bad Date Format!" ControlToValidate="EffectiveDateTextBox" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="EffectiveDateTextBoxRequiredFieldValidator" runat="server"
                                                             ErrorMessage="Effective Date"
                                                             Display="Dynamic" Text="Date Required!"
                                                             ControlToValidate="EffectiveDateTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="NumSalaryStepsTextBox" runat="server" Text='<%# Bind("NumSalarySteps") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SalaryStepsTextBox" runat="server" Text='<%# Bind("SalarySteps") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title.PayrollTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EffectiveDateLabel" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NumSalaryStepsLabel" runat="server" Text='<%# Eval("NumSalarySteps") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SalaryStepsLabel" runat="server" Text='<%# Eval("SalarySteps") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    </asp:View>
    
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsSalarySteps" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAll" TypeName="CAESDO.Esra.BLL.SalaryStepBLL"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSalaryScale" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllSalaryScaleWithSalarySteps" 
            TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
            DataObjectTypeName="CAESDO.Esra.Core.Domain.SalaryScale" 
            UpdateMethod="UpdateRecord">
            <SelectParameters>
                <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </div>
    </div>
</asp:Content>
