<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true"
    Inherits="CAESDO.Esra.Web.LoginPage" Title="ESRA - Login Page" Codebehind="LoginPage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div>
        &nbsp;You have requested a secure UC Davis Web page.&nbsp;
        <br />
        <br />
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Click here to be redirected to the Default application page.</asp:HyperLink>
    </div>
</asp:Content>
