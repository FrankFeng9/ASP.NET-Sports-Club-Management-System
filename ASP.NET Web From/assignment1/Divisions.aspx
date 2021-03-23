<%@ Page Title="Divisions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Divisions.aspx.cs" Inherits="assignment1.Divisions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <h3>HASC feathres the following divisions</h3>
    <asp:GridView ID="divisionsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="division_name" HeaderText="Divisions" SortExpression="division_name" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:HASCConnectionString2 %>" 
                       SelectCommand="SELECT [division_name] FROM [divisions] ORDER BY [division_name]">
    </asp:SqlDataSource>




    <br />
    <p>Age is determined as of March 1 of every year.</p>




</asp:Content>
