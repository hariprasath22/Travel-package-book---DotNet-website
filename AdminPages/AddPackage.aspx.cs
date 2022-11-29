using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class AdminPages_AddPackage : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDestination();
            BindDuration();
            BindPerson();
            BindDetail();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("sp_InsertPackage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName", txtPackageName.Text);
            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@PDisPrice", txtDiscountPrice.Text);
            cmd.Parameters.AddWithValue("@PDestinationID", ddlDestination.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDurationID", ddlDuration.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PPersonID", ddlPerson.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDetailID", ddlDetail.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);

            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

            //Insert and upload images
            if (fuImg01.HasFile)
            {
                string SavePath = Server.MapPath("~/PackageImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtPackageName.Text.ToString().Trim() + "01" + Extention);

                SqlCommand cmd2 = new SqlCommand("insert into tblPackageImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                cmd2.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd2.Parameters.AddWithValue("@Name", txtPackageName.Text.ToString().Trim() + "01");
                cmd2.Parameters.AddWithValue("@Extention", Extention);
                cmd2.ExecuteNonQuery();
            }

            if (fuImg02.HasFile)
            {
                string SavePath = Server.MapPath("~/PackageImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                fuImg02.SaveAs(SavePath + "\\" + txtPackageName.Text.ToString().Trim() + "02" + Extention);

                SqlCommand cmd3 = new SqlCommand("insert into tblPackageImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                cmd3.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd3.Parameters.AddWithValue("@Name", txtPackageName.Text.ToString().Trim() + "02");
                cmd3.Parameters.AddWithValue("@Extention", Extention);
                cmd3.ExecuteNonQuery();
            }

            if (fuImg03.HasFile)
            {
                string SavePath = Server.MapPath("~/PackageImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                fuImg03.SaveAs(SavePath + "\\" + txtPackageName.Text.ToString().Trim() + "03" + Extention);

                SqlCommand cmd4 = new SqlCommand("insert into tblPackageImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                cmd4.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd4.Parameters.AddWithValue("@Name", txtPackageName.Text.ToString().Trim() + "03");
                cmd4.Parameters.AddWithValue("@Extention", Extention);
                cmd4.ExecuteNonQuery();
            }

            if (fulImg04.HasFile)
            {
                string SavePath = Server.MapPath("~/PackageImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                fulImg04.SaveAs(SavePath + "\\" + txtPackageName.Text.ToString().Trim() + "04" + Extention);

                SqlCommand cmd5 = new SqlCommand("insert into tblPackageImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                cmd5.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd5.Parameters.AddWithValue("@Name", txtPackageName.Text.ToString().Trim() + "04");
                cmd5.Parameters.AddWithValue("@Extention", Extention);
                cmd5.ExecuteNonQuery();
            }

            if (fulImg05.HasFile)
            {
                string SavePath = Server.MapPath("~/PackageImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                fulImg05.SaveAs(SavePath + "\\" + txtPackageName.Text.ToString().Trim() + "05" + Extention);

                SqlCommand cmd6 = new SqlCommand("insert into tblPackageImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                cmd6.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd6.Parameters.AddWithValue("@Name", txtPackageName.Text.ToString().Trim() + "05");
                cmd6.Parameters.AddWithValue("@Extention", Extention);
                cmd6.ExecuteNonQuery();
            }
            Response.Write("<script> alert('Package Added Successfully ');  </script>");
            con.Close();
        }
        Response.Redirect("AddPackage.aspx");
    }

    private void BindDestination()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblDestination", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlDestination.DataSource = dt;
                ddlDestination.DataTextField = "DestinationName";
                ddlDestination.DataValueField = "DestinationID";
                ddlDestination.DataBind();
                ddlDestination.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
    private void BindDetail()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblDetail", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlDetail.DataSource = dt;
                ddlDetail.DataTextField = "DetailName";
                ddlDetail.DataValueField = "DetailID";
                ddlDetail.DataBind();
                ddlDetail.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    private void BindPerson()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblPerson", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlPerson.DataSource = dt;
                ddlPerson.DataTextField = "PersonName";
                ddlPerson.DataValueField = "PersonID";
                ddlPerson.DataBind();
                ddlPerson.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    private void BindDuration()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblDuration", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlDuration.DataSource = dt;
                ddlDuration.DataTextField = "DurationName";
                ddlDuration.DataValueField = "DurationID";
                ddlDuration.DataBind();
                ddlDuration.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
}