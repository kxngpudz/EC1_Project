<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDestination.aspx.cs" Inherits="Project_2._0.User.BookDestination" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .destination-card {
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s ease-in-out;
        }

        .destination-card:hover {
            transform: scale(1.05);
        }

        .destination-card img {
            max-width: 100%;
            height: auto;
        }

        .destination-details {
            padding: 15px;
        }

        .add-destination-btn {
            margin-bottom: 20px;
        }
    </style>

    <div class="container">

        <div class="row">
            <asp:Repeater OnItemCommand="Repeater1_ItemCommand1" ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-md-3">
                        <div class="card destination-card">
                            <img src='<%# Eval("ImageURL") %>' alt="Destination Image" style="width: 500px; height: 300px;" />
                            <div class="destination-details">
                                <h4><%# Eval("Title") %></h4>
                                <p><%# Eval("Description") %></p>
                                <p>Price: $<%# Eval("Price") %></p>
                                <asp:Button ID="btnBook" runat="server" Text="Book A Flight" CssClass="btn btn-primary" CommandName="BookDestination" CommandArgument='<%# Eval("Id") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
