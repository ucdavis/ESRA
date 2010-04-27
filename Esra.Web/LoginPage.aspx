<%@ Page Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true"
    Inherits="CAESDO.Esra.Web.LoginPage" Title="ESRA - Login Page" Codebehind="LoginPage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="server">
<script type="text/javascript">
    var nav = document.getElementById('ul_nav');
    nav.style.display = 'none';
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div style="text-align:center;">
        If you are seeing this page, you may not have permission to view this application.<br />
        Please contact the application's administrator for access.
    </div>
</asp:Content>
