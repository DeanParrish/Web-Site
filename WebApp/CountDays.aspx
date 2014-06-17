<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="CountDays.aspx.cs" Inherits="CountDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="section">
        <div class="webAppWrapper">
            <div class="webAppHeading">
                Day Counter
            </div>
            <div class="webAppDesc">
                <ul>
                    <li>&#8226 Simple solution to return days remaining in the year</li>
                    <li>&#8227 ALT: Option to calculate until specified date</li>
                </ul>
            </div>
            <div class="webApp">
                <div class="line">
                    Select: <asp:RadioButtonList runat="server">
                        <asp:ListItem Text="End of Year" />
                        <asp:ListItem Text="Specified Date" />
                    </asp:RadioButtonList>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

