<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryGradeQuartiles_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryGradeQuartiles_UserInputForm" Title="ESRA - Salary Grade Quartiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
  <center><asp:Label ID="lblPageTitle" runat="server" Text="Salary Grade Quartiles Maintenance" Font-Bold="true" Font-Size="Larger"></asp:Label></center>
 <br />
 <hr />
 <br />
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
            <asp:Parameter DefaultValue="SalaryGrade" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
        
    </asp:ObjectDataSource>
    <asp:GridView ID="gvSalaryGradeQuartiles" runat="server" 
        DataSourceID="odsSalaryGradeQuartiles" AutoGenerateColumns="False" 
        AllowSorting="True" onrowdatabound="gvSalaryGradeQuartiles_OnRowDataBound" 
        onsorting="gvSalaryGradeQuartiles_Sorting"
        OnRowUpdating="gvSalaryGradeQuartiles_RowUpdating">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:CommandField ShowEditButton="True" CausesValidation="true" ValidationGroup="UpdateRecord"/>
            <asp:TemplateField HeaderText="Salary Grade" SortExpression="SalaryGrade">
                <EditItemTemplate>
                    <asp:Label ID="lblSalaryGradeHeader" runat="server" Text="Salary Grade:" CssClass="edit_header"/><br />
                    <asp:Label ID="tbSalaryGrade" runat="server" Text='<%# Eval("SalaryGrade") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSalaryGrade" runat="server" Text='<%# Bind("SalaryGrade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Min Annual" SortExpression="MinAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:c}") %>' ></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMinAnnualHeader" runat="server" Text="Min <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMinAnnual" runat="server" Text='<%# Bind("MinAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMinAnnual" runat="server" ErrorMessage="Min Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMinAnnual" Operator="DataTypeCheck" 
                            Type="Double" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Qrtle Annual" 
                SortExpression="FirstQrtleAnnual">
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
                            Type="Double" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mid Annual" SortExpression="MidAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMidAnnualHeader" runat="server" Text="Mid <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMidAnnual" runat="server" Text='<%# Bind("MidAnnual", "{0:#.##}") %>'></asp:TextBox>
                     <asp:CompareValidator
                            ID="cvMidAnnual" runat="server" ErrorMessage="Mid Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMidAnnual" Operator="DataTypeCheck" 
                            Type="Double" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Third Qrtle Annual" 
                SortExpression="ThirdQrtleAnnual">
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
                            Type="Double" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Max Annual" SortExpression="MaxAnnual">
                <ItemTemplate>
                    <asp:Label ID="lblMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblMaxAnnualHeader" runat="server" Text="Max <br /> Annual:" CssClass="edit_header"/><br />
                    <asp:TextBox ID="tbMaxAnnual" runat="server" Text='<%# Bind("MaxAnnual", "{0:#.##}") %>'></asp:TextBox>
                    <asp:CompareValidator
                            ID="cvMaxAnnual" runat="server" ErrorMessage="Max Annual" Text="Bad Number Format!" Display="Dynamic" 
                            ControlToValidate="tbMaxAnnual" Operator="DataTypeCheck" 
                            Type="Double" ValidationGroup="UpdateRecord"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
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
        </Columns>
    </asp:GridView>
</asp:Content>
