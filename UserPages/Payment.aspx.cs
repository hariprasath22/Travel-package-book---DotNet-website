using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class UserPages_Payment : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    public static Int32 OrderNumber = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                BindPriceData();
                genAutoNum();
                BindBookingNumberToUser();
                BindOrderPackages();
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }

    private void BindPriceData()
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
                rptrPayPackages.DataSource = dt;
                rptrPayPackages.DataBind();
                if (dt.Rows.Count > 0)
                {
                    string DisTotal = dt.Compute("Sum(PDisPrice)", "").ToString();
                    string Total = dt.Compute("Sum(PPrice)", "").ToString();
                    string BookingQuantity = dt.Compute("Sum(Qty)", "").ToString();
                    int DisTotal1 = Convert.ToInt32(dt.Compute("Sum(PDisPrice)", ""));
                    int Total1 = Convert.ToInt32(dt.Compute("Sum(PPrice)", ""));
                    spanPTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                    spanBookTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(DisTotal)) + ".00";
                    spanDisTotal.InnerText = "- Rs. " + (Total1 - DisTotal1).ToString() + ".00";

                    hdBookingAmount.Value = Total1.ToString();
                    hdBookingDiscount.Value = (DisTotal1).ToString();
                    hdTotalPayed.Value = DisTotal1.ToString();
                }
                else
                {
                    Response.Redirect("AllPackages.aspx");
                }
            }

        }
    }

    private void BindOrderPackages()
    {
        string UserIDD = Session["USERID"].ToString();
        DataTable dt = new DataTable();
        using (SqlConnection con0 = new SqlConnection(CS))
        {
            SqlCommand cmd0 = new SqlCommand("SELECT PID FROM tblBooking C WHERE C.UID ='" + UserIDD + "'", con0);
            cmd0.CommandType = CommandType.Text;
            using (SqlDataAdapter sda0 = new SqlDataAdapter(cmd0))
            {
                sda0.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataColumn PID in dt.Columns)
                    {
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblBooking C WHERE C.PID=" + PID + " AND UID ='" + UserIDD + "'", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    DataTable dtProducts = new DataTable();
                                    sda.Fill(dtProducts);
                                    gvProducts.DataSource = dtProducts;
                                    gvProducts.DataBind();
                                }
                            }
                        }
                    }
                }
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

    private void genAutoNum()
    {
        Random r = new Random();
        int num = r.Next(Convert.ToInt32("231965"),
        Convert.ToInt32("987654"));
        string ChkOrderNum = num.ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SP_FindOrderNumber", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FindOrderNumber", ChkOrderNum);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    genAutoNum();
                }
                else
                {
                    OrderNumber = Convert.ToInt32(num.ToString());
                }
            }
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Session["Address"] = txtAddress.Text;
            Session["Mobile"] = txtMobile.Text;
            Session["OrderNumber"] = OrderNumber.ToString();
            Session["PayMethod"] = "Credit/Debit";

            string USERID = Session["USERID"].ToString();
            string USERNAME = Session["UserName"].ToString();
            string PaymentType = "Debit";
            string PaymentStatus = "Paid";
            string EMAILID = Session["USEREMAIL"].ToString();
            string OrderStatus = "Success";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", USERID);
                cmd.Parameters.AddWithValue("@Email", EMAILID);
                cmd.Parameters.AddWithValue("@BookingAmount", hdBookingAmount.Value);
                cmd.Parameters.AddWithValue("@BookingDiscount", hdBookingDiscount.Value);
                cmd.Parameters.AddWithValue("@TotalPaid", hdTotalPayed.Value);
                cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                cmd.Parameters.AddWithValue("@DateOfPurchase", DateTime.Now);
                cmd.Parameters.AddWithValue("@Name", USERNAME);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text);
                cmd.Parameters.AddWithValue("@OrderStatus", OrderStatus);
                cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber.ToString());
                if (con.State == ConnectionState.Closed) { con.Open(); }
                Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
                InsertOrderPackage();
            }
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }

    private void InsertOrderPackage()
    {
        string USERID = Session["USERID"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            foreach (GridViewRow gvr in gvProducts.Rows)
            {
                SqlCommand myCmd = new SqlCommand("SP_InsertOrderPackages", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                myCmd.Parameters.AddWithValue("@OrderID", OrderNumber.ToString());
                myCmd.Parameters.AddWithValue("@UserID", USERID);
                myCmd.Parameters.AddWithValue("@PID", gvr.Cells[0].Text);
                myCmd.Parameters.AddWithValue("@Products", gvr.Cells[1].Text);
                myCmd.Parameters.AddWithValue("@Quantity", gvr.Cells[2].Text);
                myCmd.Parameters.AddWithValue("@OrderDate", DateTime.Now.ToString("yyyy-MM-dd"));
                myCmd.Parameters.AddWithValue("@Status", "Success");
                if (con.State == ConnectionState.Closed) { con.Open(); }
                Int64 OrderPackID = Convert.ToInt64(myCmd.ExecuteScalar());
                con.Close();
                string BPID = gvr.Cells[0].Text;
                EmptyBooking(BPID);
            }
            Response.Redirect("PaymentSuccess.aspx");
        }
    }

    private void EmptyBooking(string BPID)
    {
        Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
        int PID = Convert.ToInt32(BPID);
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmdU = new SqlCommand("SP_EmptyBooking", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmdU.Parameters.AddWithValue("@UserID", UserID);
            cmdU.Parameters.AddWithValue("@PID", PID);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            cmdU.ExecuteNonQuery();
            con.Close();
        }
    }

    protected void btnBooking_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("MyBookings.aspx");
    }
}