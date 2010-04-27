<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="CAESDO.Esra.Web.ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Error Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Error: <asp:Label ID="lit_ErrorType" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
