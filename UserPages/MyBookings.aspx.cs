using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class UserPages_MyBookings : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                BindPackageBooking();
                BindBookingNumberToUser();
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }

    public void BindBookingNumberToUser()
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
                        BookingBadge.InnerText = BookingQuantity;

                    }
                    else
                    {
                        BookingBadge.InnerText = 0.ToString();
                    }
                }
            }
        }
    }

    private void BindPackageBooking()
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
                rptrBuyPackages.DataSource = dt;
                rptrBuyPackages.DataBind();
                if (dt.Rows.Count > 0)
                {
                    string DisTotal = dt.Compute("Sum(PDisPrice)", "").ToString();
                    string Total = dt.Compute("Sum(PPrice)", "").ToString();
                    string BookingQuantity = dt.Compute("Sum(Qty)", "").ToString();
                    h4Noitems.InnerText = "My Booking ( " + BookingQuantity + " )";
                    int DisTotal1 = Convert.ToInt32(dt.Compute("Sum(PDisPrice)", ""));
                    int Total1 = Convert.ToInt32(dt.Compute("Sum(PPrice)", ""));
                    spanPackageTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                    spanBookingsTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(DisTotal)) + ".00";
                    spanDiscountTotal.InnerText = "- Rs. " + (Total1 - DisTotal1).ToString() + ".00";
                }
                else
                {
                    h4Noitems.InnerText = "You have not booked any package.";
                    divAmountSect.Visible = false;

                }
            }

        }
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            Response.Redirect("Payment.aspx");
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }


    protected void btnBooking_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("MyBookings.aspx");
    }

    protected void rptrBuyPackages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName=="Remove")
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            int BookingPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand myCmd = new SqlCommand("SP_DeleteBooking", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                myCmd.Parameters.AddWithValue("@UID", UserID);
                myCmd.Parameters.AddWithValue("@BookingID", BookingPID);
                con.Open();
                myCmd.ExecuteNonQuery();
                con.Close();
                BindPackageBooking();
                BindBookingNumberToUser();
                Response.Redirect("MyBookings.aspx");
            }
        }
    }
}