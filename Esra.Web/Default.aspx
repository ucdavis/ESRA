<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Esra.Web._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvEmployees" runat="server" DataSourceID="odsEmployee">
        </asp:GridView>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" TypeName="CAESDO.Esra.BLL.EmployeeBLL"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
