<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageFlights.aspx.cs" Inherits="Project_2._0.Admin.manageFlights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Add New Flight</h2>
        <hr />

        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="lblDestination" runat="server" Text="Destination Name:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtDestinationName" runat="server" CssClass="form-control" placeholder="Enter destination name" Required="true"></asp:TextBox>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Label ID="lblTime" runat="server" Text="Time:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" placeholder="Enter flight time" Required="true"></asp:TextBox>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Label ID="lblDate" runat="server" Text="Date:" CssClass="control-label"></asp:Label>
                <div class="input-group date" id="datepicker">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Select date" Required="true"></asp:TextBox>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $('#datepicker').datepicker({
                        format: 'mm/dd/yyyy',
                        autoclose: true
                    });
                });
            </script>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Label ID="lblDestinationId" runat="server" Text="Destination:" CssClass="control-label"></asp:Label>
                <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Label ID="lblLeavingFrom" runat="server" Text="Leaving From:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtLeavingFrom" runat="server" CssClass="form-control" placeholder="Enter leaving from" Required="true"></asp:TextBox>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Button ID="btnAddFlight" runat="server" Text="Add Flight" CssClass="btn btn-primary" OnClientClick="return validateForm();" OnClick="btnAddFlight_Click" />
            </div>
        </div>


          <!-- GridView to Display Flights Data -->
        <div class="row mt-3">
            <div class="col-md-12">
                <asp:GridView ID="GridViewFlights" runat="server" AutoGenerateColumns="False" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Flight ID" />
                        <asp:BoundField DataField="DestinationName" HeaderText="Destination Name" />
                        <asp:BoundField DataField="Time" HeaderText="Time" />
                        <asp:BoundField DataField="LeavingFrom" HeaderText="Leaving From" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                              <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this flight?');" OnClick="btnDelete_Click" CommandArgument='<%# Eval("Id") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>

    <script>
        $(function () {
            function validateForm() {
                var isValid = true;
                var requiredFields = document.querySelectorAll('[required]');
                for (var i = 0; i < requiredFields.length; i++) {
                    if (requiredFields[i].value.trim() === '') {
                        isValid = false;
                        alert('Please fill in all required fields.');
                        break;
                    }
                }

                return isValid;
            }
    </script>
</asp:Content>
