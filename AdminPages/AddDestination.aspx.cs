using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_AddDestination : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDestinationRepeater();
        }
    }

    private void BindDestinationRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblDestination", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrDestination.DataSource = dt;
                    rptrDestination.DataBind();
                }
            }
        }
    }

    protected void btnAddDestination_Click(object sender, EventArgs e)
    {
        if (txtDestination.Text != null && txtDestination.Text != "" && txtDestination.Text != string.Empty)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblDestination(DestinationName) Values('" + txtDestination.Text + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Destination Added Successfully ');  </script>");
                txtDestination.Text = string.Empty;

                con.Close();
                txtDestination.Focus();
            }
        }
        BindDestinationRepeater();
    }
}