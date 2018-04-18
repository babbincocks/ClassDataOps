using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataRetrieval2;

namespace DataRetrieval2
{

    public partial class DataLookup : Form
    {
        const string connString = "Server=COMEAU-WIN7;Database=AdventureWorks2012;Trusted_Connection=True;";
        SqlConnection sqlConn = new SqlConnection(connString);

        public DataLookup()
        {
            InitializeComponent();
        }

        private void DataLookup_Load(object sender, EventArgs e)
        {
            SqlDataAdapter sqlDa = new SqlDataAdapter("spVendors", sqlConn);
            DataTable dtVendors = new DataTable();
            int VendorID;
            string VendorName;

            try
            {
                sqlDa.Fill(dtVendors);

                foreach (DataRow drVendor in dtVendors.Rows)
                {
                    VendorID = int.Parse(drVendor.ItemArray[0].ToString());
                    VendorName = drVendor.ItemArray[1].ToString();
                    cbVendors.Items.Add(new cboObject(VendorID, VendorName));
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error ...");
            }


        }

        private void cbVendors_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboObject currentObject = (cboObject)cbVendors.SelectedItem;
            int VendorID = currentObject.VendorID;
            DataTable dtVendorProducts = new DataTable();

            try
            {
                SqlCommand sqlComm = new SqlCommand("spVendorProducts", sqlConn);
                sqlComm.CommandType = CommandType.StoredProcedure;

                SqlParameter prmVendorID = new SqlParameter("@VendorID", VendorID);
                sqlComm.Parameters.Add(prmVendorID);

                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlComm);

                sqlDa.Fill(dtVendorProducts);

                dgVendorProducts.DataSource = dtVendorProducts;

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error ...");
            }

        }
    }

    public class cboObject
    {
        int vID;
        string vName;

        public cboObject(int VendorID, string VendorName)
        {
            vID = VendorID;
            vName = VendorName;
        }
             
        public string VendorName
        {
            get { return vName; }
            set { vName = value; }
        }

        public int VendorID
        {
            get { return vID; }
            set { vID = value; }
        }

        public override string ToString()
        {
            return this.VendorName;
        }
    }
}
