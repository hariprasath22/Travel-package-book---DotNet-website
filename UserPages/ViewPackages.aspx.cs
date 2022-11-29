using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserPages_ViewPackages : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    readonly Int32 myQty = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null)
        {
            if (!IsPostBack)
            {
                BindPackageImage();
                BindPackageDetails();
                divSuccess.Visible = false;
            }
        }
        else
        {
            Response.Redirect("AllPackages.aspx");
        }
    }

    private void BindPackageDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SP_BindPackageDetails", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@PID", PID);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrPackageDetails.DataSource = dt;
                rptrPackageDetails.DataBind();
                Session["BookingPID"] = Convert.ToInt32(dt.Rows[0]["PID"].ToString());
                Session["myPName"] = dt.Rows[0]["PName"].ToString();
                Session["myPPrice"] = dt.Rows[0]["PPrice"].ToString();
                Session["myPDisPrice"] = dt.Rows[0]["PDisPrice"].ToString();
            }
        }
    }

    private void BindPackageImage()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblPackageImages where PID='" + PID + "'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
        }
    }

    protected string GetActiveImgClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";

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
    protected void btnBookNow_Click(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand myCmd = new SqlCommand("SP_InsertBooking", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                myCmd.Parameters.AddWithValue("@UID", UserID);
                myCmd.Parameters.AddWithValue("@PID", Session["BookingPID"].ToString());
                myCmd.Parameters.AddWithValue("@PName", Session["myPName"].ToString());
                myCmd.Parameters.AddWithValue("@PPrice", Session["myPPrice"].ToString());
                myCmd.Parameters.AddWithValue("@PDisPrice", Session["myPDisPrice"].ToString());
                myCmd.Parameters.AddWithValue("@Qty", myQty);
                Int64 BookingID = Convert.ToInt64(myCmd.ExecuteScalar());
                con.Close();
                BindBookingNumberToUser();
                divSuccess.Visible = true;
            }
        }
        else
        {
            Response.Redirect("Signin.aspx");
        }
    }

    protected void btnBooking_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("MyBookings.aspx");
    }
}