<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="assignment1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Hamilton Adult Soccer Club</h1>
        <p class="lead">The Hamilton Adult Soccer Club is a fun-orientend set of leagues where people of different abilities and ages
            can enjoy soccer with some friendly competition.
        </p>
        <p><a href="Divisions" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Recent Scores</h2>
            <p>
                Check out the scores of some recent games.
            </p>
            <p>
                <a class="btn btn-default" href="Recent">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Referees</h2>
            <p>
               Enter the score and any game notes from the last game that you worked.
            </p>
            <p>
                <a class="btn btn-default" href="NewScore">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>New Players</h2>
            <p>
                Interested in joining the action? Register for our next season.
            </p>
            <p>
                <a class="btn btn-default" href="Register">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
