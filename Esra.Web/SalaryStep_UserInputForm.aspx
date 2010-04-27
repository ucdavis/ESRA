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
    <div>
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
                <asp:BoundField DataField="TitleCode" HeaderText="Title Code" SortExpression="TitleCode" ReadOnly="true"/>
                <asp:TemplateField HeaderText="Title" SortExpression="Title.PayrollTitle">
                <ItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" 
                        Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date"
                    SortExpression="EffectiveDate" ApplyFormatInEditMode="true"/>
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
                        <asp:ListView ID="lvSalarySteps" runat="server" ItemContainerId="DataSection" DataSource='<%# Eval("SalarySteps")%>' OnItemEditing="lvSalarySteps_ItemEditing">
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
</asp:Content>
