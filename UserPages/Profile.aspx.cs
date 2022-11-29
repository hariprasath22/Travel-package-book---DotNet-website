using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserPages_Profile : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                BindProfileData();
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }

    private void BindProfileData()
    {
        string UserID = Session["USERID"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblUsers C WHERE C.Uid ='" + UserID + "'", con);
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(UserID));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(ds, "dt");
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtUserName.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            txtPass.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            txtFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        }
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        string UserID = Session["USERID"].ToString();
        if (txtUserName.Text != string.Empty && txtPass.Text != string.Empty && txtFullName.Text != string.Empty && txtEmail.Text != string.Empty)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("update tblUsers set Username=@UName,Password=@Pass,Email=@Email,Name=@FullName where Uid='" + UserID + "'", con);
            cmd.Parameters.AddWithValue("@UName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Pass", txtPass.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Profile Updated successfully')</script>");
        }
    }
}