using Project_2._0.WebServices;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2._0.Other_Applications
{
    public partial class CruiseBooking : System.Web.UI.Page
    {
        IndexService indexService = new IndexService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlCruise.DataSource = indexService.getCruises();
                ddlCruise.DataTextField = "Destination";
                ddlCruise.DataValueField = "Id";
                ddlCruise.DataBind();
            }
        }

        protected void ddlCruise_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cruiseId = ddlCruise.SelectedValue;
            ddlRoom.DataSource = indexService.getRooms(cruiseId);
            ddlRoom.DataTextField = "Name";
            ddlRoom.DataValueField= "Id";  
            ddlRoom.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string cruiseId = ddlCruise.SelectedValue;
            string roomId = ddlRoom.SelectedValue;
            string checkIn = txtCheckIn.Text;
            string checkOut = txtCheckOut.Text;
            bool check = indexService.BookCruise(Guid.NewGuid().ToString(),Session["Uid"].ToString(), cruiseId,checkIn,checkOut,roomId);
            if (check)
            {
                if (successMsg != null)
                {
                    successMsg.ForeColor = System.Drawing.Color.Green;
                    successMsg.Text = "Cruise Booked Successfully!";
                }
                Response.Redirect("~/User/CheckReservations.aspx");
            }
            else
            {
                successMsg.Text = "Cruise Booking Failed!";
                successMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}