using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project_2._0.WebServices
{
    public class WebHelpers
    {
        public DataSet getAllCities()
        {
            DataSet citiesDataTable = new DataSet();
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT [Name] FROM [dbo].[Cities]";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(citiesDataTable);
                    }
                }
            }

            return citiesDataTable;
        }


        public void AddFlightBooking(string passportNo, string name, string fromCity, string toCity, int people)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO [dbo].[BookFlights] ([Id],[PassportNo], [Name], [FromCity], [ToCity], [People]) " +
                               "VALUES (@Id, @PassportNo, @Name, @FromCity, @ToCity, @People)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", Guid.NewGuid());
                    command.Parameters.AddWithValue("@PassportNo", passportNo);
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@FromCity", fromCity);
                    command.Parameters.AddWithValue("@ToCity", toCity);
                    command.Parameters.AddWithValue("@People", people);
                    command.ExecuteNonQuery();
                }
            }
        }

        public DataSet getCruiseDetails()
        {
            DataSet citiesDataTable = new DataSet();
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT [Id], [Destination] FROM [dbo].[BookCruise]";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(citiesDataTable);
                    }
                }
            }

            return citiesDataTable;
        }


        public DataSet getRooms(Guid CruiseId)
        {
            DataSet citiesDataTable = new DataSet();
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT [Id], [Name] FROM [dbo].[Rooms] WHERE cruiseId = @CruiseId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    command.Parameters.AddWithValue("@CruiseId", CruiseId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(citiesDataTable);
                    }
                }
            }

            return citiesDataTable;
        }

        public void BookACruise(Guid Id, Guid Uid, Guid CruiseId, string CheckIn, string CheckOut, Guid RoomId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO [dbo].[Bookings] ([Id], [Uid], [CruiseId], [CheckIn], [CheckOut], [RoomId]) " +
                               "VALUES (@Id, @Uid, @CruiseId, @CheckIn, @CheckOut, @RoomId)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id",Id);
                    command.Parameters.AddWithValue("@Uid", Uid);
                    command.Parameters.AddWithValue("@CruiseId", CruiseId);
                    command.Parameters.AddWithValue("@CheckIn", CheckIn);
                    command.Parameters.AddWithValue("@CheckOut", CheckOut);
                    command.Parameters.AddWithValue("@RoomId", RoomId);
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}