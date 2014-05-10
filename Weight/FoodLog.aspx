<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="FoodLog.aspx.cs" Inherits="FoodLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td><asp:Label ID="lblHead" runat="server" Text="Food Log" /></td>
        </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>What did you do?</td>
            <td><asp:DropDownList ID="ddlActivities" runat="server" /></td>
        </tr>
    </table>
</asp:Content>

