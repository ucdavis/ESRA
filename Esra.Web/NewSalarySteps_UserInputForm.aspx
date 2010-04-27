<%@ Page Title="ESRA - Salary Steps Editor" Language="C#" MasterPageFile="~/Esra.Master"
    AutoEventWireup="true" CodeBehind="NewSalarySteps_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.NewSalarySteps_UserInputForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="divPageTitle">
        <center>
            <asp:Label ID="lblPageTitle" runat="server" Text="Salary Steps Editor" Font-Bold="True"
                Font-Size="Larger"></asp:Label></center>
        <br />
        <hr />
        <br />
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vNoSalaryScaleDataProvided" runat="server">
            Unable to process request.
            <br /><br />
            Title Code and/or Salary Scale information was missing.
        </asp:View>
        <asp:View ID="vEditNewSalarySteps" runat="server">
            <asp:GridView ID="gvSalaryScale" runat="server" AutoGenerateColumns="False">
                <HeaderStyle CssClass="tr_head" />
                <AlternatingRowStyle CssClass="tr_alt" />
                <Columns>
                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" CommandName="Save"
                                CommandArgument='<%# Eval("TitleCode") + "|" + Eval("EffectiveDate") %>' Text="Update"
                                ToolTip="Save" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand"><img src="images/common/disk4.jpg" alt="Save" class="save_button"/></asp:LinkButton>&nbsp;<asp:LinkButton
                                    ID="lbtnCancelUpdate" runat="server" CausesValidation="False" CommandName="Exit"
                                    Text="Cancel" ToolTip="Cancel" CssClass="buttons" OnCommand="gvSalaryScales_OnCommand"><img src="images/common/cancel.png" alt="Cancel" class="cancel_button"/></asp:LinkButton></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payroll Title" SortExpression="Title.PayrollTitle">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label></EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Title.PayrollTitle") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TitleCode" HeaderText="Title Code" ReadOnly="True" SortExpression="TitleCode" />
                    <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                        ReadOnly="True" SortExpression="EffectiveDate" />
                    <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" ReadOnly="True"
                        SortExpression="SalaryGrade" />
                    <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" ReadOnly="True"
                        SortExpression="BargainingCode" />
                    <asp:TemplateField HeaderText="# Salary Steps" SortExpression="NumSalarySteps">
                        <ItemTemplate>
                            <asp:UpdatePanel ID="upNumSalarySteps" runat="server">
                                <ContentTemplate><asp:Label ID="lblNumSalarySteps" runat="server" Text='<%# Eval("SalarySteps.Count") %>'>
                                    </asp:Label>
                                </ContentTemplate> 
                            </asp:UpdatePanel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary Steps">
                        <ItemTemplate>
                            <asp:UpdatePanel ID="upSalarySteps" runat="server">
                                <ContentTemplate>
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
                                                    <td>
                                                        &#160;&nbsp;
                                                    </td>
                                                </tr>
                                                <asp:PlaceHolder ID="DataSection" runat="server"></asp:PlaceHolder>
                                                <tr>
                                                    <td colspan="5">
                                                        <asp:LinkButton ID="lbtnAddAnotherSalaryStep" runat="server" Text="Add Another Salary Step"
                                                            OnClick="lbtnAddAnotherSalaryStep_Click" CausesValidation="false"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="tbStepNumber2" runat="server" Text='<%# Bind("StepNumber") %>' OnTextChanged="tbStepNumber_OnTextChanged" />
                                                    <asp:RequiredFieldValidator
                                                            ID="tbStepNumber2RequiredFieldValidator" runat="server" ErrorMessage="Step #" Display="Dynamic" Text="Step # Required!" ControlToValidate="tbStepNumber2" ></asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbAnnual2" runat="server" Text='<%# Bind("Annual" ,"{0:c}") %>'
                                                        OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox><asp:RequiredFieldValidator
                                                            ID="tbSalaryAmountRequiredFieldValidator" runat="server" ErrorMessage="Annual $" Display="Dynamic" Text="Amount > $0 Required!" ControlToValidate="tbAnnual2" InitialValue="$0.00"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblMonthly2" runat="server" Text='<%# Eval("Monthly" ,"{0:c}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblHourly2" runat="server" Text='<%# Eval("Hourly" ,"{0:c}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbtnDeleteSalaryStep" runat="server" OnClick="lbtnDeleteSalaryStep_Click"
                                                        Text="Remove" CssClass="buttons" ToolTip="Delete Step" CausesValidation="false"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr class="tr_alt">
                                                <td>
                                                    <asp:TextBox ID="tbStepNumber3" runat="server" Text='<%# Bind("StepNumber") %>' CssClass="tb_alt"
                                                        OnTextChanged="tbStepNumber_OnTextChanged" />
                                                         <asp:RequiredFieldValidator
                                                            ID="tbStepNumber3RequiredFieldValidator" runat="server" ErrorMessage="Step #" Display="Dynamic" Text="Step # Required!" ControlToValidate="tbStepNumber3" ></asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbAnnual3" runat="server" Text='<%# Bind("Annual" ,"{0:c}") %>'
                                                        CssClass="tb_alt" OnTextChanged="tbSalaryAmount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator
                                                            ID="tbSalaryAmountRequiredFieldValidator2" runat="server" ErrorMessage="Annual $" Display="Dynamic" Text="Amount > $0 Required!" ControlToValidate="tbAnnual3" InitialValue="$0.00"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblMonthly3" runat="server" Text='<%# Eval("Monthly" ,"{0:c}") %>'
                                                        CssClass="tb_alt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblHourly3" runat="server" Text='<%# Eval("Hourly" ,"{0:c}") %>' CssClass="tb_alt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbtnDeleteSalaryStepAlt" runat="server" OnClick="lbtnDeleteSalaryStep_Click"
                                                        Text="Remove" CssClass="buttons" ToolTip="Delete Step" CausesValidation="false"><img src="images/common/delete.png" alt="Delete" class="delete_button"/></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                        <EmptyDataTemplate>
                                            <tr>
                                                <td>
                                                No Salary Steps Found
                                                </td>
                                            </tr>
                                            <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lbtnAddAnotherSalaryStep" runat="server" Text="Add a Salary Step"
                                                            OnClick="lbtnAddAnotherSalaryStep_Click" CausesValidation="false"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                        </EmptyDataTemplate>
                                        <EmptyItemTemplate>
                                            <tr>
                                                <td>
                                                No Salary Steps Found
                                                </td>
                                            </tr>
                                        </EmptyItemTemplate>
                                    </asp:ListView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="vDisplaySalaryScale" runat="server">
            You have chosen to add new or edit Salary Steps to<br />
            <br />
            &nbsp;&nbsp;Title Code:
            <%= TitleCode %>
            with an<br />
            &nbsp;&nbsp;Effective Date of
            <%= EffectiveDate %>.
            <br />
            <br />
            Select "Edit" to start adding/editing steps.
            <br />
            <br />
            <asp:GridView ID="gvDisplaySalaryScale" runat="server" DataSourceID="odsSalaryScale"
                AutoGenerateColumns="False">
                <HeaderStyle CssClass="tr_head" />
                <AlternatingRowStyle CssClass="tr_alt" />
                <Columns>
                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" OnClick="lbtnEdit_Click"
                                Text="Edit" ToolTip="Edit" CssClass="buttons"><%--<img src="images/common/edit.png" alt="Edit" class="edit_button"/>--%></asp:LinkButton></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payroll Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPayrollTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TitleCode" HeaderText="Title Code" ReadOnly="True" SortExpression="TitleCode" />
                    <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                        ReadOnly="True" SortExpression="EffectiveDate" />
                    <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" ReadOnly="True"
                        SortExpression="SalaryGrade" />
                    <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" ReadOnly="True"
                        SortExpression="BargainingCode" />
                    <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" ReadOnly="True"
                        SortExpression="NumSalarySteps" />
                    <asp:TemplateField HeaderText="Salary Steps" SortExpression="SalarySteps">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SalarySteps") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNoSteps" runat="server" Text="None" Visible='<%# ((int)Eval("SalarySteps.Count") == 0 ? true : false) %>'></asp:Label><asp:Repeater
                                ID="rptSalarySteps" runat="server" DataSource='<%# Eval("SalarySteps") %>' Visible='<%# ((int)Eval("SalarySteps.Count") > 0 ? true : false) %>'>
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
                                        <th>
                                            <asp:Label ID="lblStepNumber" runat="server" Text='<%# Eval("StepNumber") %>'></asp:Label>
                                        </th>
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
                                <AlternatingItemTemplate>
                                    <tr class="tr_alt">
                                        <th>
                                            <asp:Label ID="lblStepNumberAlt" runat="server" Text='<%# Eval("StepNumber") %>'
                                                CssClass="tb_alt"></asp:Label>
                                        </th>
                                        <td>
                                            <asp:Label ID="lblAnnualAlt" runat="server" Text='<%# Eval("Annual", "{0:c}") %>'
                                                CssClass="tb_alt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMonthlyAlt" runat="server" Text='<%# Eval("Monthly", "{0:c}") %>'
                                                CssClass="tb_alt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblHourlyAlt" runat="server" Text='<%# Eval("Hourly", "{0:c}") %>'
                                                CssClass="tb_alt"></asp:Label>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </table></FooterTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
    <p>
        &nbsp;&nbsp;<asp:ImageButton ID="imgBackButton" runat="server" CssClass="back_button" ImageUrl="images/common/arrow_left.jpg" alt="Back" OnClick="lbtnBack_Click"/>&nbsp;<asp:LinkButton ID="lbtnBack" runat="server" ToolTip="Back" CssClass="buttons"
            OnClick="lbtnBack_Click" Text="Back"/></p>
    <asp:ObjectDataSource ID="odsSalaryScale" runat="server" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSalaryScale">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="titleCode" QueryStringField="TitleCode"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="effectiveDateStr" QueryStringField="EffectiveDate"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
