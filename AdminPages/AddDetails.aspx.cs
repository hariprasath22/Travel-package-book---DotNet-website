using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AddDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDetailRepeater();
        }
    }

    private void BindDetailRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblDetail", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrDetail.DataSource = dt;
                    rptrDetail.DataBind();
                }
            }
        }
    }

    protected void btnAddDetails_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblDetail(DetailName) Values('" + txtDetail.Text + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Package Details Added Successfully ');  </script>");
            txtDetail.Text = string.Empty;

            con.Close();
            txtDetail.Focus();
        }
        BindDetailRepeater();
    }
}