<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckReservations.aspx.cs" Inherits="Project_2._0.User.CheckReservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h2>Your Reservations</h2>

        <asp:GridView ID="GridViewReservations" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Reservation ID" />
                <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                <asp:BoundField DataField="Destination" HeaderText="Cruise Destination" />
                <asp:BoundField DataField="CheckIn" HeaderText="Check-In Date" />
                <asp:BoundField DataField="CheckOut" HeaderText="Check-Out Date" />
                <asp:BoundField DataField="RoomNo" HeaderText="Room ID" />
            </Columns>
            <EmptyDataTemplate>
                <div class="alert alert-info">
                    <strong>Info!</strong> Currently, you do not have any reservations.
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>

</asp:Content>
