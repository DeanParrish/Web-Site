<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="ConvertCurrency.aspx.cs" Inherits="CurrencyConversion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <asp:DropDownList ID="ddlCurrency1" runat="server" >
        <asp:ListItem>Select</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="ddlCurrency2" runat="server">
        <asp:ListItem>Select</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtAmount" runat="server" />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" />
    <asp:Label ID="lblResult" runat="server" />
</asp:Content>

