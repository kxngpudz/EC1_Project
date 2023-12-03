using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2._0.User
{
    public partial class RoomBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["UserEmail"] != null)
                {
                    if (Session["cruiseId"]==null)
                    {
                        Response.Redirect("~/User/BookCruiseAndRooms.aspx");
                    }
                    else
                    {
                        loadRooms(Guid.Parse(Session["cruiseId"].ToString()));
                    }
                }
                else
                {
                    Response.Redirect("~/UserAuth/userLogin.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Guid roomId = Guid.Parse(ddlRooms.SelectedValue);
            string CheckIn = txtCheckInDate.Text;
            string CheckOut = txtCheckOutDate.Text;

            Bookings(roomId, CheckIn, CheckOut);
            Response.Redirect("~/User/CheckReservations.aspx");
        }

        private void Bookings(Guid RoomId, string CheckIn, string CheckOut)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Bookings (Id,Uid,CruiseId,Rooms,CheckIn,CheckOut,RoomId) VALUES (@Id , @Uid , @CruiseId , @Rooms, @CheckIn, @CheckOut, @RoomId)", con))
                {
                    cmd.Parameters.AddWithValue("@Id", Guid.NewGuid());
                    cmd.Parameters.AddWithValue("@Uid", Guid.Parse(Session["Uid"].ToString()));
                    cmd.Parameters.AddWithValue("@CruiseId", Guid.Parse(Session["cruiseId"].ToString()));
                    cmd.Parameters.AddWithValue("@Rooms", 1);
                    cmd.Parameters.AddWithValue("@CheckIn", CheckIn);
                    cmd.Parameters.AddWithValue("@CheckOut", CheckOut);
                    cmd.Parameters.AddWithValue("@RoomId", RoomId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void loadRooms(Guid CruiseId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Rooms WHERE cruiseId = @cruiseId", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@cruiseId", CruiseId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Guid roomId = reader.GetGuid(reader.GetOrdinal("Id"));
                            string roomName = reader.GetString(reader.GetOrdinal("Name"));

                            ListItem listItem = new ListItem(roomName, roomId.ToString());
                            ddlRooms.Items.Add(listItem);
                        }
                    }
                }
                ddlRooms.DataBind();
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/User/CheckReservations.aspx");
        }
    }
}