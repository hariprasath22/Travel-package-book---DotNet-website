using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AdminPages_EditPackage : System.Web.UI.Page
{
    string DestinationID = "";
    string DurationID = "";
    string PersonID = "";
    string DetailID = "";
    string Description = "";

    public static String CS = ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (!IsPostBack)
            {
                BindGridview();
                txtID.Text = string.Empty;
                txtName.Text = string.Empty;
                txtUpdatePackageName.Text = string.Empty;
                txtUpdatePrice.Text = string.Empty;
                txtUpdateDisPrice.Text = string.Empty;
                ddlUpdateDestination.SelectedIndex = -1;
                ddlUpdateDuration.SelectedIndex = -1;
                ddlUpdatePerson.SelectedIndex = -1;
                ddlUpdateDetail.SelectedIndex = -1;
                txtUpdateDescription.Text = string.Empty;
            }
        }
        else
        {
            Response.Redirect("UserPages/SignIn.aspx");
        }
    }

    private void BindGridview()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlDataAdapter da = new SqlDataAdapter("select * from tblPackage", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select * from tblPackage where PID=@ID", con);
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(txtID.Text));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(ds, "dt");
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            btnUpdatePackage.Enabled = true;
            btnDeletePackage.Enabled = true;
            txtUpdatePackageName.Text = ds.Tables[0].Rows[0]["PName"].ToString();

            txtUpdatePrice.Text = ds.Tables[0].Rows[0]["PPrice"].ToString();
            txtUpdateDisPrice.Text = ds.Tables[0].Rows[0]["PDisPrice"].ToString();

            DestinationID = ds.Tables[0].Rows[0]["PDestinationID"].ToString();
            BindDestination();
            ddlUpdateDestination.SelectedValue = DestinationID;

            DurationID = ds.Tables[0].Rows[0]["PDurationID"].ToString();
            BindDuration();
            ddlUpdateDuration.SelectedValue = DurationID;

            DetailID = ds.Tables[0].Rows[0]["PDetailID"].ToString();
            BindDetail();
            ddlUpdateDetail.SelectedValue = DetailID;

            PersonID = ds.Tables[0].Rows[0]["PPersonID"].ToString();
            BindPerson();
            ddlUpdatePerson.SelectedValue = PersonID;

            txtUpdateDescription.Text = ds.Tables[0].Rows[0]["PDescription"].ToString();

        }
        else
        {
            btnUpdatePackage.Enabled = false;
            btnDeletePackage.Enabled = false;
            txtUpdatePackageName.Text = string.Empty;
        }
        con.Close();
    }

    protected void txtName_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select * from tblPackage where PName=@Name", con);
        cmd.Parameters.AddWithValue("@Name", Convert.ToString(txtName.Text));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(ds, "dt");
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            btnUpdatePackage.Enabled = true;
            btnDeletePackage.Enabled = true;
            txtUpdatePackageName.Text = ds.Tables[0].Rows[0]["PName"].ToString();

            txtUpdatePrice.Text = ds.Tables[0].Rows[0]["PPrice"].ToString();
            txtUpdateDisPrice.Text = ds.Tables[0].Rows[0]["PDisPrice"].ToString();

            DestinationID = ds.Tables[0].Rows[0]["PDestinationID"].ToString();
            BindDestination();
            ddlUpdateDestination.SelectedValue = DestinationID;

            DurationID = ds.Tables[0].Rows[0]["PDurationID"].ToString();
            BindDuration();
            ddlUpdateDuration.SelectedValue = DurationID;

            DetailID = ds.Tables[0].Rows[0]["PDetailID"].ToString();
            BindDetail();
            ddlUpdateDetail.SelectedValue = DetailID;

            PersonID = ds.Tables[0].Rows[0]["PPersonID"].ToString();
            BindPerson();
            ddlUpdatePerson.SelectedValue = PersonID;

            txtUpdateDescription.Text = ds.Tables[0].Rows[0]["PDescription"].ToString();

        }
        else
        {
            btnUpdatePackage.Enabled = false;
            btnDeletePackage.Enabled = false;
            txtUpdatePackageName.Text = string.Empty;
        }
        con.Close();
    }


    protected void btnUpdatePackage_Click(object sender, EventArgs e)
    {
        if (txtID.Text != string.Empty && txtUpdatePackageName.Text != string.Empty && txtUpdatePrice.Text != string.Empty
            && txtUpdateDisPrice.Text != string.Empty && ddlUpdateDestination.SelectedIndex != -1 && ddlUpdateDuration.SelectedIndex != -1
            && ddlUpdateDetail.SelectedIndex != -1 && ddlUpdatePerson.SelectedIndex != -1 && txtUpdateDescription.Text != string.Empty)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlanMyTripDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("update tblPackage set PName=@Name,PPrice=@Price,PDisPrice=@DisPrice,PDestinationID=@DestinationID,PDurationID=@DurationID,PDetailID=@DetailID,PPersonID=@PersonID,PDescription=@Description where PID=@PID", con);
            cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(txtID.Text));
            cmd.Parameters.AddWithValue("@Name", txtUpdatePackageName.Text);
            cmd.Parameters.AddWithValue("@Price", txtUpdatePrice.Text);
            cmd.Parameters.AddWithValue("@DisPrice", txtUpdateDisPrice.Text);
            cmd.Parameters.AddWithValue("@DestinationID", ddlUpdateDestination.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@DurationID", ddlUpdateDuration.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PersonID", ddlUpdatePerson.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@DetailID", ddlUpdateDetail.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Description", txtUpdateDescription.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Package Updated successfully')</script>");
            BindGridview();
            txtID.Text = string.Empty;
            txtUpdatePackageName.Text = string.Empty;
            txtUpdatePrice.Text = string.Empty;
            txtUpdateDisPrice.Text = string.Empty;
            ddlUpdateDestination.SelectedIndex = -1;
            ddlUpdateDuration.SelectedIndex = -1;
            ddlUpdatePerson.SelectedIndex = -1;
            ddlUpdateDetail.SelectedIndex = -1;
            txtUpdateDescription.Text = string.Empty;

        }
    }

    protected void btnDeletePackage_Click(object sender, EventArgs e)
    {
        if (txtID.Text != string.Empty)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from tblPackageImages where PID = @PID", con);
                cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(txtID.Text));
                cmd.ExecuteNonQuery();
                SqlCommand cmd1 = new SqlCommand("Delete from tblPackage where PID = @PID", con);
                cmd1.Parameters.AddWithValue("@PID", Convert.ToInt32(txtID.Text));
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Package deleted successfully')</script>");
                BindGridview();
                txtID.Text = string.Empty;
                txtUpdatePackageName.Text = string.Empty;
                txtUpdatePrice.Text = string.Empty;
                txtUpdateDisPrice.Text = string.Empty;
                ddlUpdateDestination.SelectedIndex = -1;
                ddlUpdateDuration.SelectedIndex = -1;
                ddlUpdatePerson.SelectedIndex = -1;
                ddlUpdateDetail.SelectedIndex = -1;
                txtUpdateDescription.Text = string.Empty;
            }
        }
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
                ddlUpdateDestination.DataSource = dt;
                ddlUpdateDestination.DataTextField = "DestinationName";
                ddlUpdateDestination.DataValueField = "DestinationID";
                ddlUpdateDestination.DataBind();
                ddlUpdateDestination.Items.Insert(0, new ListItem("-Select-", "0"));

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
                ddlUpdateDuration.DataSource = dt;
                ddlUpdateDuration.DataTextField = "DurationName";
                ddlUpdateDuration.DataValueField = "DurationID";
                ddlUpdateDuration.DataBind();
                ddlUpdateDuration.Items.Insert(0, new ListItem("-Select-", "0"));

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
                ddlUpdateDetail.DataSource = dt;
                ddlUpdateDetail.DataTextField = "DetailName";
                ddlUpdateDetail.DataValueField = "DetailID";
                ddlUpdateDetail.DataBind();
                ddlUpdateDetail.Items.Insert(0, new ListItem("-Select-", "0"));

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
                ddlUpdatePerson.DataSource = dt;
                ddlUpdatePerson.DataTextField = "PersonName";
                ddlUpdatePerson.DataValueField = "PersonID";
                ddlUpdatePerson.DataBind();
                ddlUpdatePerson.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
}