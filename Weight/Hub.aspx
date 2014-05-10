<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Hub.aspx.cs" Inherits="Hub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <thead>
            <tr>
                <td>
                    Welcome! What are you here for?
                </td>
            </tr>
        </thead>
        <tr>
            <td><asp:Button ID="btnFoodLog" runat="server" Text="Log Food" OnClick="btnFoodLog_Click"/></td>
            <td><asp:Button ID="btnExerciseLog" runat="server" Text="Log Exercise" OnClick="btnExerciseLog_Click"/></td>
        </tr>
    </table>
</asp:Content>

