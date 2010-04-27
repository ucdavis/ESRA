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
    <asp:UpdatePanel ID="updateAddUser" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<div>
    <asp:ListBox ID="lbxUnits" runat="server" AppendDataBoundItems="True" 
        DataSourceID="odsUnits" DataTextField="Unit" 
        DataValueField="UnitID" SelectionMode="Multiple"
        onselectedindexchanged="lbxUnits_SelectedValues" Rows="5" >
        <asp:ListItem Value="">-- All Units --</asp:ListItem>
    </asp:ListBox> &nbsp;&nbsp;<asp:Button ID="btnGetUnitUsers" runat="server" Text="Get Users" 
    OnClick="btnGetUnitUsers_Click"/> 
    
    <asp:ObjectDataSource ID="odsUnits" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetUnits" 
        TypeName="CAESDO.Esra.Web.CatbertManager"></asp:ObjectDataSource>
</div>
<br />
  <asp:ImageButton ID="btnAddUser" runat="server" ImageUrl="~/images/ibAddUser.gif" />
 <asp:Panel ID="pnlAddUser" runat="server" CssClass="modalPopup" style="display:none;">
                <span class="modalTitle">Add A User</span>
    <div style="padding-left: 15px; padding-right: 15px; padding-bottom: 30px; max-width: 860px;">
     Search For New User:<br />
     <br />
     EmployeeID:
     <asp:TextBox ID="txtAddUserEmployeeID" runat="server"></asp:TextBox><br />
     First Name:
     <asp:TextBox ID="txtAddUserFirstName" runat="server"></asp:TextBox><br />
     Last Name:
     <asp:TextBox ID="txtAddUserLastName" runat="server"></asp:TextBox><br />
     Login ID:
     <asp:TextBox ID="txtAddUserLoginID" runat="server"></asp:TextBox><br />
     <br />
     <asp:Button ID="btnAddUserSearch" runat="server" OnClick="btnAddUserSearch_Click"
         Text="Search" />
     <%--<asp:Button ID="btnAddUserOK" runat="server" Text="Add User" />--%> 
     <asp:Button ID="btnAddUserCancel" runat="server" Text="Close" />
     <br />
     <asp:Label ID="lblAddUserStatus" runat="server" ForeColor="Green" EnableViewState="False"></asp:Label><br />
     <asp:UpdateProgress ID="progressAddUser" runat="server" AssociatedUpdatePanelID="updateAddUser">
        <ProgressTemplate>
            Searching ... 
        </ProgressTemplate>
    </asp:UpdateProgress>
     <asp:GridView ID="gViewAddUserSearch" skinID="gridViewUserManagement" runat="server" DataKeyNames="Login" CellPadding="4" DataSourceID="ObjectDataUserSearch" 
                    EmptyDataText="No Matching Users Found" ForeColor="#333333" GridLines="None" Visible="False" AutoGenerateColumns="False"
                    OnSelectedIndexChanged="gViewAddUserSearch_SelectedIndexChanged">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
         <Columns>
             <asp:CommandField ShowSelectButton="True" SelectText="Add" />
             <asp:BoundField DataField="Login" HeaderText="Login" />
             <asp:BoundField DataField="LastName" HeaderText="Last Name" />
             <asp:BoundField DataField="FirstName" HeaderText="First Name" />
             <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
             <asp:BoundField DataField="Email" HeaderText="Email" />
             <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:DropDownList ID="dlistAddUserRoles" runat="server" DataSourceID="ObjectDataRoles" DataTextField="Role" DataValueField="RoleID"></asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataRoles" runat="server" EnableCaching="true" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetRoles" TypeName="CAESDO.Esra.Web.CatbertManager"></asp:ObjectDataSource>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Unit">
                <ItemTemplate>
                    <asp:DropDownList ID="dlistAddUserUnits" runat="server" DataSourceID="ObjectDataUnits" DataTextField="Unit" DataValueField="UnitID"></asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataUnits" runat="server" EnableCaching="true" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetUnits" TypeName="CAESDO.Esra.Web.CatbertManager"></asp:ObjectDataSource>
                </ItemTemplate>
             </asp:TemplateField>
         </Columns>
         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <EditRowStyle BackColor="#999999" />
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     </asp:GridView>
     
     </div>
 </asp:Panel>
 <asp:ObjectDataSource ID="ObjectDataUserSearch" runat="server" OldValuesParameterFormatString="original_{0}"
         SelectMethod="SearchNewUsersByLogin" TypeName="CAESDO.Esra.Web.CatbertManager">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtAddUserLoginID" Name="LoginID" PropertyName="Text"
                 Type="String" />
             <asp:ControlParameter ControlID="txtAddUserFirstName" Name="FirstName" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtAddUserLastName" Name="LastName" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtAddUserEmployeeID" Name="EmployeeID" PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:ObjectDataSource>
 <ajax:ModalPopupExtender ID="mpopupAddUser" runat="server" BackgroundCssClass="modalBackground" 
    PopupControlID="pnlAddUser" TargetControlID="btnAddUser" CancelControlID="btnAddUserCancel" >
 </ajax:ModalPopupExtender>
</ContentTemplate>
</asp:UpdatePanel>
 
        <br />
        User List:
        
        <asp:UpdatePanel ID="updateUserGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        
            <asp:GridView ID="GViewUsers" SkinID="gridViewUM" runat="server" DataKeyNames="Login"
                CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="ObjectDataSource1"
                AllowPaging="True" PageSize="25"
                AutoGenerateColumns="False" 
                OnSelectedIndexChanged="GViewUsers_SelectedIndexChanged"
                EmptyDataText="No Users Found.">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="images/select.gif">
                        <ItemStyle CssClass="paddingLeft" />
                    </asp:CommandField>
                    <asp:TemplateField>
                        <HeaderTemplate>Units</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptUnits" runat="server" DataSource='<%# Eval("Units") %>'>
                                <ItemTemplate>
                                    <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                </ItemTemplate>
                                <SeparatorTemplate><br /></SeparatorTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Login" HeaderText="User Name">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                   <%-- <asp:BoundField DataField="Role" HeaderText="Role">
                        <HeaderStyle HorizontalAlign="Left" Width="100px" />
                    </asp:BoundField>--%>
                     <asp:TemplateField>
                        <HeaderTemplate>Roles</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptRoles" runat="server" DataSource='<%# Eval("Roles") %>'>
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                                </ItemTemplate>
                                <SeparatorTemplate><br /></SeparatorTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetUsersInApplication" 
                TypeName="CAESDO.Esra.Web.CatbertManager">
                <SelectParameters>
                    <asp:SessionParameter SessionField="SelectedUnits" Type="Object" Name="pUnits"/>
               </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="updateUserInfo" runat="server" UpdateMode="conditional" >
        <ContentTemplate>
            <asp:Button ID="btnHiddenSelectUser" runat="server" style="display:none; visibility:hidden;" />       
            <asp:Panel ID="pnlUserInfo" runat="server" style="display:none" CssClass="modalPopup" >
            <span class="modalTitle">User Information for <asp:Label ID="lblUserInfoName" runat="server" Text="" ></asp:Label></span>
            <div style="height:410px; width: 500px; overflow:auto; padding: 20px;">  
            <span style="font-weight:bold;">LoginID:</span> <asp:Label ID="lblUserInfoLoginID" runat="server" Text=""></asp:Label>
            <br />
            <span style="font-weight:bold;">EmployeeID:</span> <asp:Label ID="lblUserInfoEmployeeID" runat="server" Text=""></asp:Label>
            <br /><br />
                <asp:GridView ID="gViewUserUnits" SkinID="gridViewUserManagement" runat="server" DataKeyNames="UnitID" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDeleting="gViewUserUnits_RowDeleting">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Unit:"  />
                        <asp:BoundField DataField="FISCode" HeaderText="FISCode:" />
                        <asp:CommandField DeleteText="" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Images/delete.gif" HeaderText="Remove:" >
                            <HeaderStyle HorizontalAlign="Center" Width="80px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>  
                </asp:GridView>
                <br />
                <asp:DropDownList ID="dlistUnits" runat="server" DataTextField="Unit" DataValueField="UnitID" DataSourceID="ObjectDataUnits"></asp:DropDownList><asp:ObjectDataSource ID="ObjectDataUnits" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetUnits" TypeName="CAESDO.Esra.Web.CatbertManager"></asp:ObjectDataSource>
                <asp:Button ID="btnUserInfoAddUnit" runat="server" OnClick="btnUserInfoAddUnit_Click" Text="Add Unit"></asp:Button>
                <br /><br />
                <br />
                <asp:GridView ID="gViewUserRoles" SkinID="gridViewUserManagement" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="RoleID" ForeColor="#333333" GridLines="None" OnRowDeleting="gViewUserRoles_RowDeleting">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Role" HeaderText="Role:" />
                        <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Images/delete.gif" HeaderText="Remove:" >
                            <HeaderStyle HorizontalAlign="Center" Width="80px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <br />
                <asp:DropDownList ID="dlistRoles" runat="server" DataSourceID="ObjectDataRoles" DataTextField="Role"
                    DataValueField="RoleID">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataRoles" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetRoles" TypeName="CAESDO.Esra.Web.CatbertManager"></asp:ObjectDataSource>
                <asp:Button ID="btnUserInfoAddRole" runat="server" OnClick="btnUserInfoAddRole_Click" Text="Add Role"></asp:Button>
                
                <br /><br />
            <div style="text-align:right"><%--<asp:Button ID="btnSaveUserInfo" runat="server" 
                    Text="Save" />--%>
            <asp:Button ID="btnCancelUserInfo" runat="server" Text="Close" 
                     CausesValidation="False" /></div>
            </div>
            </asp:Panel>
            
            <ajax:ModalPopupExtender ID="mpopupUserInfo" runat="server" BackgroundCssClass="modalBackground" 
                    PopupControlID="pnlUserInfo" TargetControlID="btnHiddenSelectUser" CancelControlID="btnCancelUserInfo" >
            </ajax:ModalPopupExtender>
        </ContentTemplate>
        </asp:UpdatePanel>  
  </div>
</asp:Content>
