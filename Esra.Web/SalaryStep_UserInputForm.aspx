<%@ Page Title="ESRA - Salary Step Manintenance" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="SalaryStep_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryStep_UserInputForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
<div id="divPageTitle"> <center><asp:Label ID="lblPageTitle" runat="server" 
            Text="Salary Step Manintenance" Font-Bold="True" 
            Font-Size="Larger"></asp:Label></center>
 <br />
    <hr />
    <br />
  </div>
  <div>
  <asp:ObjectDataSource ID="odsSalarySteps" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.Esra.BLL.SalaryStepBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsSalaryScale" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSalaryScaleWithSalarySteps" 
        TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="TitleCode" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
      <asp:GridView ID="gvSalaryScales" runat="server" DataSourceID="odsSalaryScale" 
          AutoGenerateColumns="False" AllowSorting="true" OnSorting="gvSalaryScales_Sorting">
          <Columns>
              <asp:BoundField DataField="TitleCode" HeaderText="Title Code" 
                  SortExpression="TitleCode" />
              <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" 
                  HeaderText="Effective Date" SortExpression="EffectiveDate" />
              <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" 
                  SortExpression="NumSalarySteps" />
              <asp:TemplateField HeaderText="SalarySteps" SortExpression="SalarySteps">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("SalarySteps") %>'></asp:Label>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SalarySteps") %>'></asp:TextBox>
                  </EditItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
  </div>
  
</asp:Content>
