<%@ Page Title="ESRA - Logout Page" Language="C#" MasterPageFile="~/Esra.Master"
    AutoEventWireup="true" CodeBehind="LogoutPage.aspx.cs" Inherits="CAESDO.Esra.Web.LogoutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="screen">
        @import 'https://cas.ucdavis.edu/cas/css/cas.css' /**/;
    </style>
    <!--[if gte IE 6]><style type="text/css" media="screen">@import 'css/ie_cas.css';</style><![endif]-->

    <script type="text/javascript" src="https://cas.ucdavis.edu/cas/js/common_rosters.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <center><asp:Label ID="lblPageTitle" runat="server" Text="ESRA Logout" Font-Bold="true" Font-Size="Larger" ></asp:Label></center>
 <br />
 <hr />
    <div id="cas">
        <div id="dialog">
            <div id="innerborder">
                <div>
                    <!-- content container -->
                    <div id="header" style="width: auto; height: auto; padding-left: 0px;">
                        <div id="logo">
                            <img src="https://cas.ucdavis.edu/cas/images/ucdavisheader.jpg" width="580" height="40"
                                alt="University of California, Davis" /></div>
                        <h1 id="app-name">
                            Central Authentication Service (CAS)</h1>
                    </div>
                    <div id="content">
                        <div id="msg" class="success">
                            <h2>
                                Logout successful</h2>
                            <p>
                                You have successfully logged out of the UC Davis Central Authentication Service.</p>
                            <p>
                                For your security, please exit your Web browser.</p>
                        </div>
                    </div>
                    <!-- content -->
                </div>
                <!-- content container -->
            </div>
            <!-- innerborder -->
        </div>
        <!-- dialog -->
        <div id="footer">
            <div id="notices">
                <h1>
                    IMPORTANT SECURITY NOTIFICATION</h1>
                <p>
                    Your campus computing account Login ID and Password should only be used when you
                    authenticate to campus Web sites and online services.</p>
                <p>
                    UC Davis will never ask you to confirm or verify your computing account by providing
                    your password via telephone or email. Requests that ask you to reply to an email
                    or visit a non-campus affiliated Web site to confirm or verify your account by providing
                    your password are called phishing scams. <span class="emphasized">DO NOT RESPOND TO
                        THESE REQUESTS</span> even if they appear to come from an email address ending
                    with "ucdavis.edu".</p>
                <p>
                    If you think you have provided your password or other personal information in response
                    to a phishing scam, contact the IT Express Computing Services Help Desk immediately
                    at 530-754-HELP (4357).</p>
            </div>
            <div>
                <p>
                    Copyright &copy; Regents of the University of California, Davis campus, 2005-2008.
                    All Rights Reserved.</p>
            </div>
        </div>
    </div>
    <div id="divReturnToLoginPage">
    <br />
    <hr />
    <br />
        <p>
            &nbsp;<asp:HyperLink ID="hlLoginPage" runat="server" NavigateUrl="~/Default.aspx">Click here to be redirected to the Login Page.</asp:HyperLink>
        </p>
    </div>
</asp:Content>
