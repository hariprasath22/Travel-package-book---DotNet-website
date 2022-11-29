using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserPages_Default : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"]!=null)
        {
            btnLogout.Visible = true;
            btnLogin.Visible = false;
            BindMyBookings();
            BindBookingHistory();
            lblSuccess.Text = "Welcome <b>" + Session["Username"].ToString() + "</b>";
        }
        else
        {
            btnLogout.Visible=false;
            Response.Redirect("SignIn.aspx");
        }
    }

    private void BindBookingHistory()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            string UserID = Session["USERID"].ToString();
            using (SqlCommand cmd = new SqlCommand("Sp_BindBookingHistory", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", UserID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrBookingHistory.DataSource = dt;
                    rptrBookingHistory.DataBind();
                }
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignIn.aspx");
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
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}