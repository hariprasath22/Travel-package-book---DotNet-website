using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            btnSignUp.Visible = false;
            btnSignIn.Visible = false;
            btnLogout.Visible = true;
            BindMyBookings();
            //lblSuccess.Text = "Login Success, Welcome <b>" + Session["Username"].ToString() + "</b>";
        }
        else
        {
            btnSignUp.Visible = true;
            btnSignIn.Visible = true;
            btnLogout.Visible = false;
            //Response.Redirect("Default.aspx");
        }
    }
    public void BindMyBookings()
    {
        if (Session["USERID"] != null)
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindBookingNumberToUser", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string BookingQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        pCount.InnerText = BookingQuantity;

                    }
                    else
                    {
                        pCount.InnerText = 0.ToString();
                    }
                }
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect("Default.aspx");
    }
}