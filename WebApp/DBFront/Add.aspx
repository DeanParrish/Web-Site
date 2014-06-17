<%@ Page Title="" Language="C#" MasterPageFile="site.master" AutoEventWireup="true" Inherits="Add" Trace="false" CodeFile="Add.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="heading" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="Styles/Add.css" />
    <script type="text/javascript" src="Scripts/jQuery_1.11.0.js"></script>
    <script type="text/javascript" src="Scripts/Add.js"></script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
  
</asp:Content>
<asp:Content ID="contentAddForm" ContentPlaceHolderID="DBFrontMainContent" Runat="Server">
    <div id="addForm">
    <br />
    <table align="center" class="style1" id="addTable">
        <tr>
            <td width="150px" style="font-size: large; width: 300px;" align="right" 
                colspan="2" class="message">
        <asp:Label ID="lblCorrect" runat="server" CssClass="correct" align="center"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large; width: 300px;" align="right" 
                colspan="2" class="message">
                <asp:Label ID="lblMessage" runat="server" CssClass="validator"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
                First Name:</td>
            <td width="150px" align="left">
                <asp:TextBox ID="txtFName" runat="server" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqvalidFName" runat="server" 
                    ControlToValidate="txtFName" CssClass="validator" Display="Dynamic" 
                    ErrorMessage="First Name is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
                Last Name:</td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
         ControlToValidate="txtLName" CssClass="validator" Display="Dynamic" 
         ErrorMessage="Name is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td rowspan="3" width="150px" style="font-size: large" align="right">
                Phone:</td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtPhone1" runat="server" placeholder="Phone Number 1"></asp:TextBox>
     <span class="validator"></span>
         <asp:RequiredFieldValidator ID="validatePhoneReq" runat="server" 
         ControlToValidate="txtPhone1" CssClass="validator" Display="Dynamic" 
         ErrorMessage="One Phone Number is Required">*</asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="validatePhoneRegex" runat="server" 
         ControlToValidate="txtPhone1" CssClass="validator" Display="Dynamic" 
         ErrorMessage="Must Be a Phone Number" 
         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="150px" align="left">
     <asp:TextBox ID="txtPhone2" runat="server" placeholder="Phone Number 2"></asp:TextBox>
     <span class="validator"></span>
         <asp:RegularExpressionValidator ID="validatePhone2Regex" runat="server" 
         ControlToValidate="txtPhone2" CssClass="validator" Display="Dynamic" 
         ErrorMessage="Must Be a Phone Number" 
         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="150px" align="left">
     <asp:TextBox ID="txtPhone3" runat="server" placeholder="Phone Number 3"></asp:TextBox>
     <span class="validator"></span>
         <asp:RegularExpressionValidator ID="validatePhone3Regex" runat="server" 
         ControlToValidate="txtPhone3" CssClass="validator" Display="Dynamic" 
         ErrorMessage="Must Be a Phone Number" 
         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
    <asp:Label ID="Label1" runat="server" Text="Address:" CssClass="address"></asp:Label> 
            </td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtAddress" runat="server" placeholder="Address"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
    <asp:Label ID="Label2" runat="server" Text="City:" CssClass="city"></asp:Label>
            </td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtCity" runat="server" placeholder="City"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
    <asp:Label ID="Label3" runat="server" Text="State:" CssClass="state"></asp:Label>
            </td>
            <td width="150px" align="left">
     <asp:DropDownList ID="ddlState" runat="server" DataSourceID="XmlDataSource1" 
         DataTextField="abbr" DataValueField="abbr">
    </asp:DropDownList>
     <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
         DataFile="App_Data/States.xml"></asp:XmlDataSource>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
    <asp:Label ID="Label7" runat="server" Text="ZIP Code:" CssClass="zip"></asp:Label>
            </td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtZip" runat="server" placeholder="ZIP"></asp:TextBox>
     <span class="validator"></span>
     <asp:RegularExpressionValidator ID="validateZIPRegex" runat="server" 
         CssClass="validator" Display="Dynamic" ErrorMessage="Must Be a ZIP Code Format" 
         ValidationExpression="\d{5}(-\d{4})?" ControlToValidate="txtZip">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="150px" style="font-size: large" align="right">
    <asp:Label ID="Label4" runat="server" Text="Comments:" CssClass="label"></asp:Label>
            </td>
            <td width="150px" align="left">
     <asp:TextBox ID="txtComment" runat="server" Height="150px" TextMode="MultiLine" 
        Width="153px"  placeholder="Comments"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150px" height="50px" align="right">
                &nbsp;</td>
            <td height="50px" width="150px" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px" align="right">
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        CssClass="submitButton" onclick="btnSubmit_Click" />
            </td>
            <td width="150px" align="left">
    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="resetButton" 
        CausesValidation="False" onclick="btnReset_Click" />
            </td>
        </tr>
        <tr>
            <td width="150px" height="50px" align="right">
                &nbsp;</td>
            <td height="50px" width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px" height="50px" align="right" class="message" colspan="2" 
                style="width: 300px">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        CssClass="validator" />
            </td>
        </tr>
        <tr>
            <td width="150px" colspan="2" style="width: 300px" align="right">
                <asp:SqlDataSource ID="dsCustomer" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CustomersString %>" 
                    SelectCommand="SELECT * FROM [Customer]" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [Customer] WHERE [CustomerNum] = @original_CustomerNum AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Phone1] = @original_Phone1 AND (([Phone2] = @original_Phone2) OR ([Phone2] IS NULL AND @original_Phone2 IS NULL)) AND (([Phone3] = @original_Phone3) OR ([Phone3] IS NULL AND @original_Phone3 IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([Zip] = @original_Zip) OR ([Zip] IS NULL AND @original_Zip IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))" 
                    InsertCommand="INSERT INTO [Customer] ([LastName], [FirstName], [Phone1], [Phone2], [Phone3], [Address], [City], [State], [Zip], [Comments]) VALUES (@LastName, @FirstName, @Phone1, @Phone2, @Phone3, @Address, @City, @State, @Zip, @Comments)" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [Customer] SET [LastName] = @LastName, [FirstName] = @FirstName, [Phone1] = @Phone1, [Phone2] = @Phone2, [Phone3] = @Phone3, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Comments] = @Comments WHERE [CustomerNum] = @original_CustomerNum AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Phone1] = @original_Phone1 AND (([Phone2] = @original_Phone2) OR ([Phone2] IS NULL AND @original_Phone2 IS NULL)) AND (([Phone3] = @original_Phone3) OR ([Phone3] IS NULL AND @original_Phone3 IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([Zip] = @original_Zip) OR ([Zip] IS NULL AND @original_Zip IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerNum" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Phone1" Type="String" />
                        <asp:Parameter Name="original_Phone2" Type="String" />
                        <asp:Parameter Name="original_Phone3" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_Zip" Type="String" />
                        <asp:Parameter Name="original_Comments" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtLName" Name="LastName" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtFName" Name="FirstName" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtPhone1" Name="Phone1" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtPhone2" Name="Phone2" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtPhone3" Name="Phone3" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtCity" Name="City" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlState" Name="State" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtZip" Name="Zip" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtComment" Name="Comments" 
                            PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Phone1" Type="String" />
                        <asp:Parameter Name="Phone2" Type="String" />
                        <asp:Parameter Name="Phone3" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="Zip" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="original_CustomerNum" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Phone1" Type="String" />
                        <asp:Parameter Name="original_Phone2" Type="String" />
                        <asp:Parameter Name="original_Phone3" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_Zip" Type="String" />
                        <asp:Parameter Name="original_Comments" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

