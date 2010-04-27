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
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vTitleCodeAverages" runat="server">
        <asp:GridView ID="gvSalaryScale" runat="server" DataSourceID="odsSalaryScale" 
        AutoGenerateColumns="False" AllowSorting="True" 
        onsorting="gvSalaryScale_Sorting" 
        OnRowDataBound="gvSalaryScale_OnRowDataBound" 
        onselectedindexchanged="gvSalaryScale_SelectedIndexChanged" DataKeyNames="Title">
        <HeaderStyle cssclass="tr_head" />
        <AlternatingRowStyle CssClass="tr_alt" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
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
        </asp:View>
        <asp:View ID="vInsertNewTitleCodeAverages" runat="server">
            <table style="width:100%;" id="tblNewTitleCodeAverages">
                <tr>
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
                        <asp:TextBox ID="tbEffectiveDate" runat="server" ReadOnly="true"></asp:TextBox></td>
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
                    <asp:Button ID="btnSave" runat="server" CommandName="save" 
                        oncommand="btnClick_Command" Text="Save" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" CommandName="cancel" 
                        oncommand="btnClick_Command" Text="Cancel" />
                    &nbsp;</td>
                </tr>
            </table>
            
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
