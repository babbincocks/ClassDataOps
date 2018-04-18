using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DataInsert
{
    class DataOps
    {
        const string connDefault = "Server=COMEAU-WIN7;Database=JobSearchPlus;Trusted_Connection=True;";
        SqlConnection sqlConn;

        private bool DBConnect(String ConnectionString = "")
        {
            bool returnValue;

            // If no connection string was specified, use the default.
            if (ConnectionString.Length == 0)
                ConnectionString = connDefault;

            try
            {
                // Open the connection to SQL Server.
                sqlConn = new SqlConnection(ConnectionString);
                sqlConn.Open();
                returnValue = true;
            }
            catch (Exception ex)
            {
                // If there was an error, return false and throw it back.
                returnValue = false;
                throw ex;
            }

            return returnValue;
        }

        public DataTable GetAgencies()
        {
            DataTable dtAgencies = new DataTable();
            
            // Get a list of agencies from the JobSearch Plus database.

            try
            {
                if (DBConnect())
                {
                    SqlDataAdapter sqlDA = new SqlDataAdapter("spGetAgencies", sqlConn);
                    sqlDA.Fill(dtAgencies);
                }
                else
                {
                    throw new Exception("Could not connect to JobSearch Plus database.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dtAgencies;

        }

        public bool InsertNewSource(string SourceName, string SourceType, string SourceLink, string SourceDesc, out int SourceID)
        {
            bool returnValue = false;
            SourceID = 0;

            // Insert the specified information as a new job lead source.
            try
            {
                if (DBConnect())
                {
                    // Create new command for stored procedure.
                    SqlCommand insertSourceCmd = new SqlCommand("spInsertSource", sqlConn);
                    insertSourceCmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter outValue = new SqlParameter("@SourceID", SourceID);
                    
                    insertSourceCmd.Parameters.AddWithValue("@SourceName", SourceName);
                    insertSourceCmd.Parameters.AddWithValue("@SourceType", SourceType);
                    insertSourceCmd.Parameters.AddWithValue("@SourceLink", SourceLink);
                    insertSourceCmd.Parameters.AddWithValue("@SourceDesc", SourceDesc);
                    // Output parameter for ID
                    insertSourceCmd.Parameters.AddWithValue("@SourceID", SourceID).Direction = ParameterDirection.Output;

                    // Run command.
                    insertSourceCmd.ExecuteNonQuery();

                    // Retrieve SourceID value.
                    SourceID = int.Parse(insertSourceCmd.Parameters["@SourceID"].Value.ToString());

                    returnValue = true;
                }
            }
            catch (Exception ex)
            {
                returnValue = false;
                throw ex;
            }

            return returnValue;

        }


    }
}
