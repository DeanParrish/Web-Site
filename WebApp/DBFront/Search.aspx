
<%@ Page Title="" Language="C#" MasterPageFile="site.master" AutoEventWireup="true" Inherits="Default" EnableEventValidation ="false" CodeFile="Search.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="heading" Runat="Server">

    <link href="Styles/Search.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Search.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery_1.10.2.js"></script>
    <script type="text/javascript" src="Scripts/Search.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DBFrontMainContent" Runat="Server">
    <br />
Search by:
    <asp:DropDownList ID="ddlSearch" runat="server" onload="Page_Load">
        <asp:ListItem Value="LName">Last Name</asp:ListItem>
        <asp:ListItem>Phone</asp:ListItem>
        <asp:ListItem Value="FName">First Name</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Value:<asp:TextBox ID="txtSearch" 
        runat="server" TabIndex="1"></asp:TextBox>
        <span class="validator"></span>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtSearch" CssClass="validator" 
        ErrorMessage="This is Required" ValidationGroup="Search">* Required</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Search" ValidationGroup="Search" />
    <br />
    &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                    DataKeyNames="CustomerNum" DataSourceID="gvDataSource"
                    AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical" 
                    ForeColor="Black" Width="100%" AllowSorting="True" 
    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        onrowdatabound="GridView1_RowDataBound">
                    <AlternatingRowStyle CssClass="altGridView" />
                    <Columns>
                        <asp:BoundField DataField="LastName" HeaderText="LastName">
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerNum" HeaderText="CustomerNum" 
                            SortExpression="CustomerNum" InsertVisible="False" ReadOnly="True" 
                            Visible="False">
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone1" HeaderText="Phone1" />
                        <asp:BoundField DataField="Phone2" HeaderText="Phone2" />
                        <asp:BoundField DataField="Phone3" HeaderText="Phone3" />
                        <asp:CommandField ButtonType="Button" Visible="False" />
                    </Columns>
                    <FooterStyle CssClass="altGridView" />
                    <HeaderStyle CssClass="headGridView" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="gvDataSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings:CustomersString %>"
                    
                    
        
        SelectCommand="SELECT [LastName], [CustomerNum], [FirstName], [Phone1], [Phone2], [Phone3] FROM [Customer] ORDER BY [LastName]" 
        DeleteCommand="DELETE FROM [Customer] WHERE [CustomerNum] = @CustomerNum" 
        InsertCommand="INSERT INTO [Customer] ([LastName], [FirstName], [Phone1], [Phone2], [Phone3]) VALUES (@LastName, @FirstName, @Phone1, @Phone2, @Phone3)" 
        
        UpdateCommand="UPDATE [Customer] SET [LastName] = @LastName, [FirstName] = @FirstName, [Phone1] = @Phone1, [Phone2] = @Phone2, [Phone3] = @Phone3 WHERE [CustomerNum] = @CustomerNum">
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerNum" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Phone1" Type="String" />
                        <asp:Parameter Name="Phone2" Type="String" />
                        <asp:Parameter Name="Phone3" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Phone1" Type="String" />
                        <asp:Parameter Name="Phone2" Type="String" />
                        <asp:Parameter Name="Phone3" Type="String" />
                        <asp:Parameter Name="CustomerNum" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

                <a id="anchorDetailsView">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="CustomerNum" DataSourceID="dtDataSource" Height="50px" 
                    Width="280px" CellPadding="4" ForeColor="#333333" 
        GridLines="None" OnPageIndexChanging="DetailsView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="CustomerNum" InsertVisible="False" 
                            SortExpression="CustomerNum" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerNum") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtLName" Display="Dynamic" 
                                    ErrorMessage="Last Name is Required" CssClass="validator" 
                                    ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtFName" Display="Dynamic" 
                                    ErrorMessage="First Name is Required" CssClass="validator" 
                                    ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone1" SortExpression="Phone1">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone1" runat="server" Text='<%# Bind("Phone1") %>'></asp:TextBox>
                                <span class="validator"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtPhone1" Display="Dynamic" 
                                    ErrorMessage="One Phone is Required" CssClass="validator" 
                                    ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtPhone1" Display="Dynamic" 
                                    ErrorMessage="Phone Must Be Formatted Correctly" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                                    CssClass="validator" ValidationGroup="Edit">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone1" runat="server" Text='<%# Bind("Phone1") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone2" SortExpression="Phone2">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone2" runat="server" Text='<%# Bind("Phone2") %>'></asp:TextBox>
                                <span class="validator"></span>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtPhone2" Display="Dynamic" 
                                    ErrorMessage="Phone Must be Formatted Correctly" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                                    CssClass="validator" ValidationGroup="Edit">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone2" runat="server" Text='<%# Bind("Phone2") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Phone2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone3" SortExpression="Phone3">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone3" runat="server" Text='<%# Bind("Phone3") %>'></asp:TextBox>
                                <span class="validator"></span>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="txtPhone3" Display="Dynamic" 
                                    ErrorMessage="Phone Must be Formatted Correctly" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                                    CssClass="validator" ValidationGroup="Edit">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone3") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address" SortExpression="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' 
                                    Width="240px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City" SortExpression="City">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State" SortExpression="State">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="XmlDataSource1" DataTextField="abbr" DataValueField="abbr" 
                                    SelectedValue='<%# Bind("State") %>'>
                                </asp:DropDownList>
                                <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
                                    DataFile="~/App_Data/States.xml"></asp:XmlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZip" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                                <span class="validator"></span>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="txtZip" Display="Dynamic" 
                                    ErrorMessage="Zip Must be Formatted Correctly" 
                                    ValidationExpression="\d{5}(-\d{4})?" CssClass="validator" 
                                    ValidationGroup="Edit">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtComments" runat="server" Text='<%# Bind("Comments") %>' 
                                    Height="100px" TextMode="MultiLine" Width="240px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Height="100px" MaxLength="500" 
                                    ReadOnly="True" Text='<%# Bind("Comments") %>' TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" OnClick="Button1_Click" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    </a>

                    <asp:SqlDataSource ID="dtDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CustomersString %>" 
                    DeleteCommand="DELETE FROM [Customer] WHERE [CustomerNum] = @CustomerNum" 
                    InsertCommand="INSERT INTO [Customer] ([LastName], [FirstName], [Phone1], [Phone2], [Phone3], [Address], [City], [State], [Zip], [Comments]) VALUES (@LastName, @FirstName, @Phone1, @Phone2, @Phone3, @Address, @City, @State, @Zip, @Comments)" 
                    SelectCommand="SELECT * FROM [Customer] WHERE ([CustomerNum] = @CustomerNum)" 
                    
                    
        
        UpdateCommand="UPDATE [Customer] SET [LastName] = @LastName, [FirstName] = @FirstName, [Phone1] = @Phone1, [Phone2] = @Phone2, [Phone3] = @Phone3, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Comments] = @Comments WHERE [CustomerNum] = @CustomerNum" 
        ondeleted="SqlDataSource2_Deleted" onupdated="SqlDataSource2_Updated">
                        <DeleteParameters>
                            <asp:Parameter Name="CustomerNum" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
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
                        </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="CustomerNum" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
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
                            <asp:Parameter Name="CustomerNum" Type="Int32" />
                        </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Please correct the following errors:" 
        CssClass="validator" ValidationGroup="Edit" />
                <p>
                    <asp:Label ID = "lblError" runat="server" EnableViewState="False" 
                        CssClass="validator"></asp:Label>
                </p>
</asp:Content>
