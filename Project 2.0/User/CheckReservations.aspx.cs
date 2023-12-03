using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2._0.User
{
    public partial class CheckReservations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    if (Session["Uid"]==null)
                    {
                        Response.Redirect("~/UserAuth/userLogin.aspx");
                    }
                    else
                    {
                       BindGridView();
                    }
                }
                else
                {
                    Response.Redirect("~/UserAuth/userLogin.aspx");
                }
            }
        }

        private void BindGridView()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(@"SELECT Id, (SELECT FullName FROM UserRigistrations WHERE Id = Uid) AS Name,
             (SELECT Destination FROM BookCruise WHERE Id = CruiseId ) AS Destination, CheckIn, CheckOut,
             (SELECT Name FROM Rooms WHERE Id = RoomId) AS RoomNo FROM Bookings WHERE Uid = @Uid", con))
                {
                    cmd.Parameters.AddWithValue("@Uid", Guid.Parse(Session["Uid"].ToString()));
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);

                            GridViewReservations.DataSource = dt;
                            GridViewReservations.DataBind();
                        }
                        else
                        {
                         
                        }
                    }
                }
            }
        }


    }
}