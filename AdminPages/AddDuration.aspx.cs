using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Duration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDurationRepeater();
        }
    }

    private void BindDurationRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblDuration", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrDuration.DataSource = dt;
                    rptrDuration.DataBind();
                }
            }
        }
    }

    protected void btnAddDuration_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblDuration(DurationName) Values('" + txtDuration.Text + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Duration Added Successfully ');  </script>");
            txtDuration.Text = string.Empty;

            con.Close();
            txtDuration.Focus();
        }
        BindDurationRepeater();
    }
}