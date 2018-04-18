namespace DataRetrieval2
{
    partial class DataLookup
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbVendors = new System.Windows.Forms.ComboBox();
            this.dgVendorProducts = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgVendorProducts)).BeginInit();
            this.SuspendLayout();
            // 
            // cbVendors
            // 
            this.cbVendors.FormattingEnabled = true;
            this.cbVendors.Location = new System.Drawing.Point(13, 13);
            this.cbVendors.Name = "cbVendors";
            this.cbVendors.Size = new System.Drawing.Size(197, 21);
            this.cbVendors.TabIndex = 0;
            this.cbVendors.SelectedIndexChanged += new System.EventHandler(this.cbVendors_SelectedIndexChanged);
            // 
            // dgVendorProducts
            // 
            this.dgVendorProducts.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgVendorProducts.Location = new System.Drawing.Point(13, 40);
            this.dgVendorProducts.Name = "dgVendorProducts";
            this.dgVendorProducts.ReadOnly = true;
            this.dgVendorProducts.Size = new System.Drawing.Size(633, 271);
            this.dgVendorProducts.TabIndex = 1;
            // 
            // DataLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(658, 323);
            this.Controls.Add(this.dgVendorProducts);
            this.Controls.Add(this.cbVendors);
            this.Name = "DataLookup";
            this.Text = "Lookup";
            this.Load += new System.EventHandler(this.DataLookup_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgVendorProducts)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cbVendors;
        private System.Windows.Forms.DataGridView dgVendorProducts;
    }
}

