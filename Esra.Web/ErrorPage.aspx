<%@ Page Title="ESRA - Error Page" Language="C#" MasterPageFile="~/Esra.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="CAESDO.Esra.Web.ErrorPage" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
        <div>
        <br />
        <br />
        <br />
            <center>
            <p style="color: #FFFFFF">
                Error:&nbsp;<asp:Label ID="lit_ErrorType" runat="server"></asp:Label>
            </p>
            </center>
        </div>
    </asp:Content>

    
    
