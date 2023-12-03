<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="Project_2._0.User.RoomBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <div class="modal" id="bookModal"  role="dialog" style="margin-top:100px; display: block; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1050;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Book Room</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:DropDownList ID="ddlRooms" runat="server" CssClass="form-control" AppendDataBoundItems="true" DataTextField="RoomName" DataValueField="RoomId">
                        <asp:ListItem Text="Select Room" Value="" />
                    </asp:DropDownList>
                    <br />
                    <label for="checkInDate">Check-In Date:</label>
                    <asp:TextBox ID="txtCheckInDate" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                    <br />
                    <label for="checkOutDate">Check-Out Date:</label>
                    <asp:TextBox ID="txtCheckOutDate" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    <button type="button" runat="server" onserverclick="Unnamed_ServerClick" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">

    <script>
        $(document).ready(function () {
            // Initialize datepicker and display the modal
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });


            
            $('#bookModal').modal('show');
        });
    </script>
</asp:Content>
