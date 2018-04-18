using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataInsert
{
    public partial class Form1 : Form
    {
        DataOps dataWorks = new DataOps();

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int sourceID;

            try
            {
                dataWorks.InsertNewSource(txtName.Text, txtType.Text, txtLink.Text, txtDescription.Text, out sourceID);
                txtID.Text = sourceID.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error ...");
            }

        }

        private void btnLoadAgencies_Click(object sender, EventArgs e)
        {

            try
            {
                dgAgencies.DataSource = dataWorks.GetAgencies();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error ...");
            }


        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtName.Text = "";
            txtLink.Text = "";
            txtType.Text = "";
            txtDescription.Text = "";

        }
    }
}
