<%@ Page Title="ESRA - Salary Step Manintenance" Language="C#" MasterPageFile="~/Esra.Master"
    AutoEventWireup="true" CodeBehind="SalaryStep_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryStep_UserInputForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="divPageTitle">
        <center>
            <asp:Label ID="lblPageTitle" runat="server" Text="Salary Step Manintenance" Font-Bold="True"
                Font-Size="Larger"></asp:Label></center>
        <br />
        <hr />
        <br />
    </div>
    <div id="divDisplaySalaryScales" visible="true">
        <asp:ObjectDataSource ID="odsSalarySteps" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAll" TypeName="CAESDO.Esra.BLL.SalaryStepBLL"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSalaryScale" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllSalaryScaleWithSalarySteps" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="gvSalaryScales" runat="server" DataSourceID="odsSalaryScale" AutoGenerateColumns="False"
            AllowSorting="True" OnSorting="gvSalaryScales_Sorting">
            <HeaderStyle CssClass="tr_head" />
            <AlternatingRowStyle CssClass="tr_alt" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" ToolTip="Edit" CssClass="buttons"><img src="images/common/edit.png" alt="Edit" class="edit_button"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" CommandName="Copy"
                            CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' Text="Copy"
                            ToolTip="Copy" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand"><img src="images/common/Document-new.png" alt="New" class="new_button" /></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" ToolTip="Save" CssClass="buttons"><img src="images/common/disk4.jpg" alt="Save" class="save_button"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbtnCancelUpdate" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" ToolTip="Cancel" CssClass="buttons"><img src="images/common/cancel.png" alt="Cancel" class="cancel_button"/></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TitleCode" HeaderText="Title Code" SortExpression="TitleCode"
                    ReadOnly="true" />
                <asp:TemplateField HeaderText="Title" SortExpression="Title.PayrollTitle">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                    SortExpression="EffectiveDate" ApplyFormatInEditMode="true" />
                <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" SortExpression="NumSalarySteps" />
                <asp:TemplateField HeaderText="SalarySteps">
                    <ItemTemplate>
                        <asp:Panel ID="pnlNoStepDetails" runat="server">
                            <div style="float: left; margin-left: 5px;">
                                <asp:Label ID="lblShowDetails" runat="server" Text=""></asp:Label></div>
                            <div style="float: right; vertical-align: middle;">
                                &nbsp;<asp:ImageButton ID="imgExpand" runat="server" ImageUrl="~/images/common/expand_blue.jpg"
                                    AlternateText="(Show Details...)" /></div>
                        </asp:Panel>
                        <asp:Panel ID="pnlStepDetails" runat="server" Width="100%" Height="0">
                            <asp:Repeater ID="rptSalarySteps" runat="server" DataSource='<%# Eval("SalarySteps") %>'>
                                <HeaderTemplate>
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
                        <asp:ListView ID="lvSalarySteps" runat="server" ItemContainerId="DataSection" DataSource='<%# Eval("SalarySteps")%>'
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
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <asp:UpdatePanel runat="server" ID="upSalaryStep">
                                    <ContentTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="tbStepNumber" runat="server" Text='<%# Bind("StepNumber") %>'></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbAnnual" runat="server" Text='<%# Bind("Annual") %>'></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbMonthly" runat="server" Text='<%# Bind("Monthly") %>'></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbHourly" runat="server" Text='<%# Bind("Hourly") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ItemTemplate>
                        </asp:ListView>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div id="divEditNewSalaryScale" visible="true">
        <asp:ListView ID="lvNewSalaryScale" runat="server">
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title.PayrollTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NumSalaryStepsLabel" runat="server" Text='<%# Eval("SalarySteps.Count") %>' />
                    </td>
                    <td>
                        <asp:ListView ID="lvSalarySteps" runat="server" ItemContainerId="DataSection" DataSource='<%# Eval("SalarySteps")%>'
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
                                           
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                           
                                        </table>
                                    </LayoutTemplate>
                                    
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStepNumber2" runat="server" Text='<%# Bind("StepNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAnnual2" runat="server" Text='<%# Bind("Annual") %>' OnTextChanged="tbSalaryAmount_OnTextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthly2" runat="server" Text='<%# Bind("Monthly") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHourly2" runat="server" Text='<%# Bind("Hourly") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr class="tr_alt">
                                    <td>
                                        <asp:Label ID="lblStepNumber3" runat="server" Text='<%# Bind("StepNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAnnual3" runat="server" Text='<%# Bind("Annual") %>' CssClass="tb_alt"
                                            OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthly3" runat="server" Text='<%# Bind("Monthly") %>' CssClass="tb_alt"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHourly3" runat="server" Text='<%# Bind("Hourly") %>' CssClass="tb_alt"></asp:Label>
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
                <table runat="server" style="">
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
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" class="tr_head">
                                    <th>
                                    </th>
                                    <th runat="server">
                                        Payroll Title
                                    </th>
                                    <th runat="server">
                                        Title Code
                                    </th>
                                    <th runat="server">
                                        Effective Date
                                    </th>
                                    <th runat="server">
                                        # Salary Steps
                                    </th>
                                    <th runat="server">
                                        SalarySteps
                                    </th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
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
</asp:Content>
