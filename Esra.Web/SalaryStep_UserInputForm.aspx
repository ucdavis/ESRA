﻿<%@ Page Title="ESRA - Salary Step Manintenance" Language="C#" MasterPageFile="~/Esra.Master"
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
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="vDisplaySalaryScales" runat="server" >
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
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" CommandName="Save" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>'
                            Text="Update" ToolTip="Save" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand"><img src="images/common/disk4.jpg" alt="Save" class="save_button"/></asp:LinkButton>
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
                <asp:TemplateField HeaderText="EffectiveDate" SortExpression="EffectiveDate">
                    <ItemTemplate>
                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Eval("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                    SortExpression="EffectiveDate" ApplyFormatInEditMode="true" />--%>
                <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" SortExpression="NumSalarySteps" ReadOnly="true"/>
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
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDeleteSalaryScale" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CausesValidation="False" 
                        CommandName="remove" Text="Delete" OnCommand="btnClick_Command" CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate")  %>' ToolTip="Delete" CssClass="buttons"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:View>
    <asp:View ID="vEditNewSalaryScale" runat="server" >
        <asp:ListView ID="lvNewSalaryScale" runat="server" OnItemUpdating="vNewSalaryScale_ItemUpdating">
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="SaveButton" runat="server" CommandName="Update" CommandArgument='<%# Container %>' Text="Save" OnCommand="lvNewSalaryScale_OnCommand"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Close" Text="Cancel" OnCommand="lvNewSalaryScale_OnCommand"/>
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
    
</asp:Content>
