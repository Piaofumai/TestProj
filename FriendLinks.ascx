<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FriendLinks.ascx.cs" Inherits="FriendLinks"%>
<div class="sambar">
    <h2>
        友情连asasdfsadfdfasdfadf接┊FriendsLinks
    </h2>
    <ul>
        <asp:DataList ID="DataListFriendsLinks" runat="server" RepeatColumns="1">
            <ItemTemplate>
                <li><a href="<%# Eval("webSite") %>" target="_blank">
                    <%# Eval("webName") %>
                </a></li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</div>
