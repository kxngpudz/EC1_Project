using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Project_2._0.WebServices
{
    /// <summary>
    /// Summary description for IndexService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class IndexService : System.Web.Services.WebService
    {
        WebHelpers webHelpers = new WebHelpers();
      
        [WebMethod]
        public DataSet getCities()
        {
            return webHelpers.getAllCities();
        }
      
        [WebMethod]
        public bool bookFlights(string passportNo, string name, string fromCity, string toCity, int people)
        {
            try
            {
                webHelpers.AddFlightBooking(passportNo, name, fromCity, toCity, people);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        [WebMethod]
        public DataSet getCruises()
        {
            return webHelpers.getCruiseDetails();
        }

        [WebMethod]
        public DataSet getRooms(string cruiseId)
        {
            return webHelpers.getRooms(Guid.Parse(cruiseId));
        }

        [WebMethod]
        public bool BookCruise(string Id, string Uid, string CruiseId, string CheckIn, string CheckOut, string RoomId)
        {
            try
            {
                webHelpers.BookACruise(Guid.Parse(Id),Guid.Parse(Uid), Guid.Parse(CruiseId), CheckIn, CheckOut, Guid.Parse(RoomId));
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
           
        }
    }
}
