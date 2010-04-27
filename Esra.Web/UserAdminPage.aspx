<%@ Page Title="ESRA - User Admin Page" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="UserAdminPage.aspx.cs" Inherits="CAESDO.Esra.Web.UserAdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div style="width: 70%; text-align:center;">
        <h1 id="page_title" ><asp:Label ID="lblPageTitle" runat="server" 
            Text="User Administration"></asp:Label></h1>
    </div>
    <div style="width: 100%; height: 500px" align="center">
        <iframe id="frame"  frameborder="0" 
            src='<%= ConfigurationManager.AppSettings["AdminPageURL"] %>' 
            scrolling="auto" name="frame" style="width:100%; height:100%;">
        </iframe> 
    </div>
</asp:Content>
