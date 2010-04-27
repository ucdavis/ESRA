<%@ Page Title="" Language="C#" MasterPageFile="~/Esra.Master" AutoEventWireup="true" CodeBehind="ModalConfirm.aspx.cs" Inherits="CAESDO.Esra.Web.ModalConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
body {
font:normal 10pt/13pt Arial, Verdana, Helvetica, sans-serif;
color:#666;
margin:20px;
}
    
/*Modal Popup*/
.modalBackground {
background-color:#000;
filter:alpha(opacity=80);
opacity:0.8;
}
.modalPopup img {
border:solid 5px #fff;
}
.modalPopup-text {
display:block;
color:#000;
background-color:#fff;
text-align:center;
border:solid 2px #000;
padding:10px;
}
.modalPopup-text input {
width:75px;
}    
.feedback
{
color: #00cc00;
font-weight: 700;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">

    <script type="text/javascript">
    function onYes() {
        var postBack = new Sys.WebForms.PostBackAction();
        postBack.set_target('YesButton');
        postBack.set_eventArgument('');

        postBack.performAction();
    }

    function onNo() {
        //no postback necessary
        $('Label1').innerText = 'Action canceled';
    }
</script> 
<asp:Label ID="lblPageTitle" runat="server" Text="Modal Confirmation" Font-Size="Larger" Font-Bold="true"/><br /><br />
Click the button below:<br /><br />

<asp:Button ID="DeleteButton" runat="server" Text="Delete"/><br />
<asp:Label ID="Label1" runat="server" />
<asp:Panel ID="ConfirmtionPanel" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="modalPopup-text">
        Are you sure you want to delete this item?<br />
        <br />
        <asp:Button ID="YesButton" runat="server" Text="Yes" OnClick="YesButton_Click" />&nbsp;&nbsp;
        <asp:Button ID="NoButton" runat="server" Text="No" />
    </div>
</asp:Panel>
    <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="DeleteButton"
        PopupControlID="ConfirmtionPanel" OkControlID="YesButton" OnOkScript="onYes()"
        CancelControlID="NoButton" OnCancelScript="onNo()" BackgroundCssClass="modalBackground" 
        PopupDragHandleControlID="Panel3" />



</asp:Content>
