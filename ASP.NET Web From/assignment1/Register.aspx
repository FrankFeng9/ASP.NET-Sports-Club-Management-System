<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="assignment1.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>

    <div class="container">
        <div class="table row">
            <div class="col-md-2">
                <asp:Label ID="Label1" runat="server" Text="First name"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="firstNameTextBox" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="First name is required."
                    ControlToValidate="firstNameTextBox"
                    Text="Required."></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="table row">
            <div class="col-md-2">
                <asp:Label ID="Label2" runat="server" Text="Last name"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="lastNameTextBox" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Last name is required."
                    ControlToValidate="lastNameTextBox"
                    Text="Required."></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="table row">
            <div class="col-md-2">
                <asp:Label ID="Label3" runat="server" Text="Division"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="divisionDropDownList" runat="server" DataSourceID="divisionSqlDataSource" DataTextField="division_name" DataValueField="division_id"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="divisionSqlDataSource" ConnectionString='<%$ ConnectionStrings:HASCConnectionString2 %>' SelectCommand="SELECT [division_id], [division_name] FROM [divisions]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="table row">
            <div class="col-md-2">
                <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                    runat="server"
                    ErrorMessage="Email is required."
                    ControlToValidate="emailTextBox"
                    Text="Required."
                    Display="Dynamic"></asp:RequiredFieldValidator>


                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    runat="server"
                    ErrorMessage="Email is invalid."
                    ControlToValidate="emailTextBox"
                    SetFocusOnError="True"
                    ValidationExpression="\s*\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*"
                    Display="Dynamic"
                    Text="Invalid."></asp:RegularExpressionValidator>
            </div>
        </div>


        <div class="table row">
            <div class="col-md-2">
                <asp:Label ID="Label5" runat="server" Text="Birth Date"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="birthdayTextBox" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage="Date is required."
                    ControlToValidate="birthdayTextBox"
                    Text="Required."></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class="table row">
            <div class="col-md-2">
            </div>
            <div class="col-md-2">
                <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" style="Margin-right:30px"/>
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" CausesValidation="False" />
            </div>
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

        <asp:Literal ID="outputLiteral" runat="server"></asp:Literal>
        

    </div>

</asp:Content>
