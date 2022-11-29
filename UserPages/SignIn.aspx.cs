using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

public partial class UserPages_SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["UPWD"] != null)
            {
                txtUsername.Text = Request.Cookies["UNAME"].Value;
                txtPass.Text = Request.Cookies["UPWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblUsers where Username=@username and Password=@pwd", con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);

            cmd.Parameters.AddWithValue("@pwd", txtPass.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();
                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);

                if (CheckBox1.Checked)
                {
                    Response.Cookies["UNAME"].Value = txtUsername.Text;
                    Response.Cookies["UPWD"].Value = txtPass.Text;

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(10);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(10);
                }
                else
                {
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                }
                string Utype;
                Utype = dt.Rows[0][5].ToString().Trim();

                if(Utype=="User")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("AllPackages.aspx");
                }
                if (Utype == "Admin")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("~/AdminPages/AdminHome.aspx");
                }

                //Send welcome mail via Email

                String ToEmailAddress = dt.Rows[0][3].ToString();
                String Username = dt.Rows[0][1].ToString();
                String EmailBody = "Hi ," + Username + ",<br/><br/>Click the link below to reset your password<br/> <br/>";


                MailMessage NotificationMail = new MailMessage("hariprasath0922pra@gmail.com", "hariprasath0922pra@gmail.com");

                NotificationMail.Body = EmailBody;
                NotificationMail.IsBodyHtml = true;
                NotificationMail.Subject = "Login Page";

                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("hariprasath0922pra@gmail.com", "hariprasathe");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;

                    client.Send(NotificationMail);
                }
            }
            else
            {
                lblError.Text = "Invalid Username and password";
            }
            clr();
            con.Close();
        }
    }

    private void clr()
    {
        txtPass.Text = string.Empty;
        txtUsername.Text = string.Empty;
        txtUsername.Focus();
    }
}