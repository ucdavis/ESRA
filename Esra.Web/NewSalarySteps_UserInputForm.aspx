<%@ Page Title="ESRA - New Salary Steps Editor" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="NewSalarySteps_UserInputForm.aspx.cs" Inherits="CAESDO.Esra.Web.NewSalarySteps_UserInputForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
 <div id="divPageTitle">
        <center>
            <asp:Label ID="lblPageTitle" runat="server" Text="New Salary Steps Editor" Font-Bold="True"
                Font-Size="Larger"></asp:Label></center>
        <br />
        <hr />
        <br />
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="vNoSalaryScaleDataProvided" runat="server">
            Unable to process request. <br />Title Code and/or Salary Scale information was missing.
        </asp:View>
        <asp:View ID="vEditNewSalarySteps" runat="server">
            You have chosen to add new Salary Steps to<br />
            &nbsp;&nbsp;Title Code: <%= TitleCode %> with an<br />
            &nbsp;&nbsp;Effective Date of <%= EffectiveDate %>.
            <asp:UpdatePanel ID="upSalarySteps" runat="server">
                <ContentTemplate>
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="odsSalaryScale">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Payroll Title" ReadOnly="True" 
                                SortExpression="Title" />
                            <asp:BoundField DataField="TitleCode" HeaderText="Title Code" ReadOnly="True" 
                                SortExpression="TitleCode" />
                            <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="Effective Date" ReadOnly="True" SortExpression="EffectiveDate" />
                            <asp:BoundField DataField="SalaryGrade" HeaderText="Salary Grade" 
                                ReadOnly="True" SortExpression="SalaryGrade" />
                            <asp:BoundField DataField="BargainingCode" HeaderText="Bargaining Code" 
                                ReadOnly="True" SortExpression="BargainingCode" />
                            <asp:BoundField DataField="NumSalarySteps" HeaderText="# Salary Steps" 
                                SortExpression="NumSalarySteps" />
                            <asp:TemplateField HeaderText="Salary Steps" SortExpression="SalarySteps">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SalarySteps") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SalarySteps") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="odsSalaryScale" runat="server" 
                TypeName="CAESDO.Esra.BLL.SalaryScaleBLL" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSalaryScale">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="titleCode" 
                        QueryStringField="TitleCode" Type="String" />
                    <asp:QueryStringParameter DefaultValue="" Name="effectiveDateStr" 
                        QueryStringField="EffectiveDate" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
