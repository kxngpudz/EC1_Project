using Project_2._0.WebServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2._0.Other_Applications
{
   
    public partial class BookFlight : System.Web.UI.Page
    {
        IndexService indexService = new IndexService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                if (!IsPostBack)
                {

                    ddlFromCity.DataSource = indexService.getCities();
                    ddlFromCity.DataTextField = "Name";
                    ddlFromCity.DataValueField = "Name";
                    ddlFromCity.DataBind();


                    ddlToCity.DataSource = indexService.getCities();
                    ddlToCity.DataTextField = "Name";
                    ddlToCity.DataValueField = "Name";
                    ddlToCity.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/UserAuth/userLogin.aspx");
            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fromCity =  ddlFromCity.SelectedValue;
            string toCity = ddlToCity.SelectedValue;
            string name = txtName.Text;
            string passportNo = txtPassportNo.Text;
            int noOfPeople = Convert.ToInt32(txtNoOfPeople.Text);

            bool check = indexService.bookFlights(passportNo,name,fromCity,toCity,noOfPeople);
            if (check)
            {
                if (successMsg != null)
                {
                    successMsg.ForeColor = System.Drawing.Color.Green;
                    successMsg.Text = "Flight Booked Successfully!";
                }
                else
                {
                    successMsg.Text = "Flight Booking Failed!";
                    successMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
         
        }

        protected void btnCruise_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Other%20Applications/CruiseBooking.aspx");
        }
    }
}