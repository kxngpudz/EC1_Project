<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CruiseBooking.aspx.cs" Inherits="Project_2._0.Other_Applications.CruiseBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Add Bootstrap-datepicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha384-vk5iq6ujwsS/1lWJ5gt2lKA6jkNzA0NfgLz+g5K4y1HAAa5+lbQniCz7F2GxssbZ" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Cruise Booking</h2>

            <div class="form-group">
                <label for="ddlCruise">Select Cruise:</label>
                <asp:DropDownList ID="ddlCruise" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCruise_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlRoom">Select Room:</label>
                <asp:DropDownList ID="ddlRoom" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtCheckIn">Check-In:</label>
                    <asp:TextBox ID="txtCheckIn" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
            </div>

            <div class="form-group">
                <label for="txtCheckOut">Check-Out:</label>
                
                    <asp:TextBox ID="txtCheckOut" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                </div>
                 </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

                   <br />
            <div class="form-group">
                <asp:Label runat="server" ID="successMsg" AssociatedControlID="txtCheckIn"></asp:Label>
            </div>


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
       
            <script>
            // Initialize datepickers
            $(document).ready(function () {
                $('#datepickerCheckIn').datepicker({
                    format: 'mm/dd/yyyy',
                    autoclose: true
                });

                $('#datepickerCheckOut').datepicker({
                    format: 'mm/dd/yyyy',
                    autoclose: true
                });
            });
        </script>
    </form>
</body>
</html>
