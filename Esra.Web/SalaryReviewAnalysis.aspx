<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryReviewAnalysis.aspx.cs" Inherits="CAESDO.Esra.Web.SalaryAnalysisReview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Salary Review Analysis</title>
    <style type="text/css">
        .style2
        {
            width: 174px;
        }
        .style4
        {
            width: 74px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="odsSalaryReviewAnalysis" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByProperty" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlReferenceNumber" 
                    DefaultValue="ReferenceNumber" Name="propertyName" PropertyName="SelectedValue" 
                    Type="String" />
                <asp:Parameter DefaultValue="" Name="propertyValue" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsESRAs" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.SalaryReviewAnalysisBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="ReferenceNumber" Name="propertyName" 
                    Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
            TypeName="CAESDO.Esra.BLL.EmployeeBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="FullName" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="vSelectSalaryReviewAnalysis" runat="server">
                <asp:DropDownList ID="ddlReferenceNumber" runat="server" AutoPostBack="True" 
                    DataSourceID="odsESRAs" DataTextField="ReferenceNumber" DataValueField="ID">
                    <asp:ListItem>-- Select a Reference Number --</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" 
                    DataSourceID="odsEmployee" DataTextField="FullName" DataValueField="ID">
                    <asp:ListItem>-- Select an Employee --</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="ddl" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="odsSalaryReviewAnalysis">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Reference Number" 
                            SortExpression="ReferenceNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReferenceNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Originating Department" 
                            SortExpression="OriginatingDepartment">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("OriginatingDepartment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Bind("OriginatingDepartment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee" SortExpression="Employee">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Employee") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Employee") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateInitiated" HeaderText="Date Initiated" 
                            SortExpression="DateInitiated" />
                        <asp:BoundField DataField="InitiatedByReviewerName" 
                            HeaderText="Initiated By Reviewer Name" 
                            SortExpression="InitiatedByReviewerName" />
                        <asp:BoundField DataField="DateApproved" HeaderText="Date Approved" 
                            SortExpression="DateApproved" />
                        <asp:TemplateField HeaderText="ApprovedScenario" 
                            SortExpression="ApprovedScenario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" 
                                    Text='<%# Bind("ApprovedScenario") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ApprovedScenario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DepartmentComments" HeaderText="Department Comments" 
                            SortExpression="DepartmentComments" />
                        <asp:BoundField DataField="DeansOfficeComments" 
                            HeaderText="Deans Office Comments" SortExpression="DeansOfficeComments" />
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="vSalaryReviewAnalysis" runat="server">
                
                    <table style="width: 100%;">
                        <tr>
                            <th>Scenario #</th>
                            <th>Criteria</th>
                            <th>% Increase</th>
                            <th>Salary $</th>
                            <th>Approved</th>
                        </tr>
                        <tr>
                            <td class="style2">
                                1.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria1" runat="server" AutoPostBack="True" 
                                    DataSourceID="odsCriteria" DataTextField="Key" DataValueField="Value">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease1" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved1" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                2.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria2" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease2" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved2" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                3.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria3" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease3" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount3" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved3" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                4.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease4" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount4" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved4" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                5.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria5" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease5" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount5" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved5" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                6.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria6" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease6" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount6" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved6" runat="server" GroupName="rbApproved" Text=""/>
&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                7.</td>
                            <td>
                                <asp:DropDownList ID="ddlCriteria7" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td >
                                <asp:TextBox ID="tbPercentIncrease7" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="tbSalaryAmount7" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbApproved7" runat="server" GroupName="rbApproved" Text=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>Dean&#39;s Office Comments:</th>
                            <td colspan="4">
                                <asp:TextBox ID="tbDeansOfficeComments" runat="server" Width="867px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                
            </asp:View>
        </asp:MultiView>
    
    </div>
    <asp:ObjectDataSource ID="odsCriteria" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetCriteriaListItems" TypeName="CAESDO.Esra.BLL.SalaryScaleBLL">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id" SessionField="titleCode" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
