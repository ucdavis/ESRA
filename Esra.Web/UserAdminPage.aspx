﻿<%@ Page Title="ESRA - User Admin Page" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="UserAdminPage.aspx.cs" Inherits="CAESDO.Esra.Web.UserAdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
<div> <center><asp:Label ID="lblPageTitle" runat="server" 
            Text="User Administration" Font-Bold="True" 
            Font-Size="Larger"></asp:Label></center>
 <br />
    <hr />
    <br />
    <%--<center>
        <asp:Label ID="lblTitleSalaryStepManintenance" runat="server" Text="Under Construction" 
                Font-Bold="True" Font-Size="Large"></asp:Label></center><br />--%>
    <center><img src="images/common/page-under-construction.jpg" /></center>
  </div>
</asp:Content>