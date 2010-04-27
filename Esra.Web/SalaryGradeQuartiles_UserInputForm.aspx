<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryGradeQuartiles_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryGradeQuartiles_UserInputForm" Title="ESRA - Salary Grade Quartiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ObjectDataSource ID="odsSalaryGradeQuartiles" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.Esra.BLL.SalaryGradeQuartilesBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="SalaryGrade" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="gvSalaryGradeQuartiles" runat="server" 
        DataSourceID="odsSalaryGradeQuartiles" AutoGenerateColumns="False" 
        AllowSorting="True" onrowdatabound="gvSalaryGradeQuartiles_OnRowDataBound" 
        onsorting="gvSalaryGradeQuartiles_Sorting">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                SortExpression="SalaryGrade" />
            <asp:TemplateField HeaderText="Min Annual" SortExpression="MinAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbMinAnnual" runat="server" Text='<%# Bind("MinAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Qrtle Annual" 
                SortExpression="FirstQrtleAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbFirstQrtleAnnual" runat="server" 
                        Text='<%# Bind("FirstQrtleAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mid Annual" SortExpression="MidAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbMidAnnual" runat="server" Text='<%# Bind("MidAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Third Qrtle Annual" 
                SortExpression="ThirdQrtleAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbThirdQrtleAnnual" runat="server" 
                        Text='<%# Bind("ThirdQrtleAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Max Annual" SortExpression="MaxAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
                <ItemTemplate>
                    <asp:Label ID="lblEffectiveDate" runat="server" 
                        Text='<%# Bind("EffectiveDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <ajax:CalendarExtender ID="ceEffectiveDate" runat="server" CssClass="calendar" TargetControlID="tbEffectiveDate" Format="MM/dd/yyyy">
                    </ajax:CalendarExtender>
                    <asp:TextBox ID="tbEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>' ReadOnly="true"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
