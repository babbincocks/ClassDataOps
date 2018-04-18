using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DataRetrieval2
{
    class DataClass
    {
        const string connDefault = "Server=COMEAU-WIN7;Database=AdventureWorks2012;Trusted_Connection=True;";
        SqlConnection sqlConn;

        private bool DBConnect(String ConnectionString = "")
        {
            bool returnValue;

            if (ConnectionString.Length == 0)
                ConnectionString = connDefault;
        
            try
            {
                sqlConn = new SqlConnection(ConnectionString);
                sqlConn.Open();
                returnValue = true;
            }
            catch (Exception ex)
            {
                returnValue = false;
                throw ex;
            }
            finally
            {
                sqlConn.Close();
            }

            return returnValue;
        }
        
        public DataTable GetCurrentEmployees()
        {
            DataTable dtEmployees = new DataTable();

            try
            {
                if (DBConnect())
                {
                    SqlDataAdapter sqlDA = new SqlDataAdapter("spCurrentEmployees", sqlConn);
                    sqlDA.Fill(dtEmployees);
                }
                else
                {
                    throw new Exception("Could not connect to AdventureWorks database.");
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return dtEmployees;
            
        }


    }
}
