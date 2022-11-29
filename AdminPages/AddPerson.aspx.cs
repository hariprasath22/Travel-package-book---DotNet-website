using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AdminPages_AddPersonaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPersonRepeater();
        }
    }

    private void BindPersonRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblPerson", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrPerson.DataSource = dt;
                    rptrPerson.DataBind();
                }
            }
        }
    }

    protected void btnAddPerson_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblPerson(PersonName) Values('" + txtPerson.Text + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Package Category Added Successfully ');  </script>");
            txtPerson.Text = string.Empty;

            con.Close();
            txtPerson.Focus();
        }
        BindPersonRepeater();
    }
}