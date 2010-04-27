<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="TitleCode_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.TitleCode_UserInputForm" Title="ESRA - Title Code Averages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ObjectDataSource ID="odsSalaryScale" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSalaryScale" 
        TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
        DataObjectTypeName="CAESDO.Esra.Core.Domain.SalaryScale" 
        UpdateMethod="UpdateRecord">
        <SelectParameters>
            <asp:Parameter Name="propertyName" Type="String" DefaultValue="TitleCode" />
            <asp:Parameter Name="ascending" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="gvSalaryScale" runat="server" DataSourceID="odsSalaryScale" 
        AutoGenerateColumns="False" AllowSorting="True" 
        onsorting="gvSalaryScale_Sorting" 
        OnRowDataBound="gvSalaryScale_OnRowDataBound">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
             <asp:BoundField DataField="TitleCode" HeaderText="Title Code" 
                SortExpression="TitleCode" ReadOnly="true"/>
            <asp:TemplateField HeaderText="Title" 
                SortExpression="Title.PayrollTitle">
                <ItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title.PayrollTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Effective Date" 
                SortExpression="EffectiveDate"  ReadOnly="true"/>
            <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                SortExpression="SalaryGrade"  ReadOnly="true"/>
            <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" 
                SortExpression="BargainingCode"  ReadOnly="true"/>
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
        </Columns>
    </asp:GridView>
</asp:Content>
