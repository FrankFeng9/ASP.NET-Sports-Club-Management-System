<%@ Page Title="Enter a New Score" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewScore.aspx.cs" Inherits="assignment1.NewScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <span>Referee:</span> 
    <asp:DropDownList ID="refereeDropDownList" runat="server" AutoPostBack="True" DataSourceID="refereesSqlDataSource" DataTextField="full_name" DataValueField="referee_id"></asp:DropDownList>
    <br />
    <asp:SqlDataSource runat="server" ID="refereesSqlDataSource" ConnectionString='<%$ ConnectionStrings:HASCConnectionString2 %>' 
                       SelectCommand="
                                    SELECT ([first_name]+ ' ' + [last_name]) AS [full_name],[referee_id] 
                                    FROM [referees] 
                                    ORDER BY [first_name]
        "></asp:SqlDataSource>
    <br />
    <asp:GridView ID="newScoreGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="game_id" DataSourceID="newScoreSqlDataSource" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="game_id" HeaderText="ID" ReadOnly="True" SortExpression="game_id"></asp:BoundField>
            <asp:BoundField DataField="game_date" HeaderText="Date" ReadOnly="True" SortExpression="game_date" DataFormatString="{0:d}"></asp:BoundField>            
            <asp:BoundField DataField="field" HeaderText="Field" ReadOnly="True" SortExpression="field"></asp:BoundField>
            <asp:BoundField DataField="home_team_id" HeaderText="Home Team ID" ReadOnly="True" SortExpression="home_team_id"></asp:BoundField>
            <asp:BoundField DataField="home_team_score" HeaderText="Score"  SortExpression="home_team_score"></asp:BoundField>
            <asp:BoundField DataField="away_team_id" HeaderText="Away Team ID" ReadOnly="True" SortExpression="away_team_id"></asp:BoundField>
            <asp:BoundField DataField="away_team_score" HeaderText="Score"  SortExpression="away_team_score"></asp:BoundField>
            <asp:BoundField DataField="game_notes" HeaderText="Game Notes" SortExpression="game_notes" />
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
                       ID="newScoreSqlDataSource" 
                       ConnectionString='<%$ ConnectionStrings:HASCConnectionString2 %>' 
                       SelectCommand="SELECT [game_id], [game_date], [field], [home_team_id], [home_team_score], [away_team_id], [away_team_score], [game_notes] FROM [games] WHERE (([referee_id] = @referee_id) AND ([away_team_score] IS NULL))" 
                       DeleteCommand="DELETE FROM [games] WHERE [game_id] = @game_id" 
                       InsertCommand="INSERT INTO [games] ([game_id], [game_date], [field], [home_team_id], [home_team_score], [away_team_id], [away_team_score], [game_notes]) VALUES (@game_id, @game_date, @field, @home_team_id, @home_team_score, @away_team_id, @away_team_score, @game_notes)" 

                       UpdateCommand="UPDATE [games] SET [home_team_score] = @home_team_score, [away_team_score] = @away_team_score, [game_notes] = @game_notes WHERE [game_id] = @game_id">
        <DeleteParameters>
            <asp:Parameter Name="game_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="game_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="game_date" />
            <asp:Parameter Name="field" Type="String" />
            <asp:Parameter Name="home_team_id" Type="Int32" />
            <asp:Parameter Name="home_team_score" Type="Int32" />
            <asp:Parameter Name="away_team_id" Type="Int32" />
            <asp:Parameter Name="away_team_score" Type="Int32" />
            <asp:Parameter Name="game_notes" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="refereeDropDownList" PropertyName="SelectedValue" Name="referee_id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="game_date" />
            <asp:Parameter Name="field" Type="String" />
            <asp:Parameter Name="home_team_id" Type="Int32" />
            <asp:Parameter Name="home_team_score" Type="Int32" />
            <asp:Parameter Name="away_team_id" Type="Int32" />
            <asp:Parameter Name="away_team_score" Type="Int32" />
            <asp:Parameter Name="game_notes" Type="String" />
            <asp:Parameter Name="game_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
