<%@ Page Title="Recent Scores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recent.aspx.cs" Inherits="assignment1.Recent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gamesSqlDataSource" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="20" CssClass="table-condensed">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="game_date" HeaderText="Date" SortExpression="game_date" DataFormatString="{0:d}"></asp:BoundField>
            <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home"></asp:BoundField>
            <asp:BoundField DataField="home_team_score" HeaderText="Score" SortExpression="home_team_score">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
            <asp:BoundField DataField="away_team_score" HeaderText="Score" SortExpression="away_team_score">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>


    <asp:SqlDataSource runat="server"
        ID="gamesSqlDataSource"
        ConnectionString='<%$ ConnectionStrings:HASCConnectionString2 %>'
        SelectCommand="SELECT TOP 10 g.game_date, t.team_name AS Home, g.home_team_score, te.team_name AS Away, g.away_team_score
                       FROM games g
                       JOIN teams t ON g.home_team_id = t.team_id
                       JOIN teams te ON g.away_team_id = te.team_id
                       WHERE (([away_team_score] IS NOT NULL) AND ([home_team_score] IS NOT NULL)) 
                       ORDER BY [game_date] DESC"></asp:SqlDataSource>
   </asp:Content>
