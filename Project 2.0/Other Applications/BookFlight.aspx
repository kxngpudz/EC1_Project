<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookFlight.aspx.cs" Inherits="Project_2._0.Other_Applications.BookFlight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Flight</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Book a Flight</h2>

            <div class="form-group">
                <label for="ddlFromCity">Select OnBoarding Location:</label>
                <asp:DropDownList ID="ddlFromCity" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlToCity">Select Destination:</label>
                <asp:DropDownList ID="ddlToCity" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtName">Name:</label>
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPassportNo">Passport No:</label>
                <asp:TextBox ID="txtPassportNo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtNoOfPeople">No of People:</label>
                <asp:TextBox ID="txtNoOfPeople" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
            <asp:Button ID="btnCruise" CssClass="btn btn-primary" runat="server" Text="Book Cruise" OnClick="btnCruise_Click" />

            <br />
            <div class="form-group">

                <asp:Label runat="server" ID="successMsg" AssociatedControlID="txtNoOfPeople"></asp:Label>


            </div>
        </div>
    </form>
</body>
</html>
