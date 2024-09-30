using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifierAndApprover : System.Web.UI.Page
{
    string _connectionString = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
        }
    }

    protected void FillGrid()
    {
        using (SqlConnection sqlConnection = new SqlConnection(_connectionString))
        {
            DataSet ds = new DataSet();
            try
            {
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("uspVerifierDetails", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    ds.Clear();
                    sda.Fill(ds);
                }
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            GVDetails.DataSource = ds.Tables[0];
                            GVDetails.DataBind();
                        }
                    }
                }
            }
            catch (Exception)
            {

            }
            finally
            {

            }
        }
    }

    protected void GVDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow gridViewRow = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
        TextBox GVIUnitName = ((TextBox)gridViewRow.FindControl("GVIUnitName"));
        TextBox GVIMilkQty = ((TextBox)gridViewRow.FindControl("GVIMilkQty"));
        TextBox GVIMilkFat = ((TextBox)gridViewRow.FindControl("GVIMilkFat"));
        TextBox GVIMilkSNF = ((TextBox)gridViewRow.FindControl("GVIMilkSNF"));
        TextBox GVIMilkFatPerc = ((TextBox)gridViewRow.FindControl("GVIMilkFatPerc"));
        TextBox GVIMilkSNFPerc = ((TextBox)gridViewRow.FindControl("GVIMilkSNFPerc"));
        TextBox GVIButterQty = ((TextBox)gridViewRow.FindControl("GVIButterQty"));
        TextBox GVIButterStck = ((TextBox)gridViewRow.FindControl("GVIButterStck"));
        TextBox GVIMilkPwderQty = ((TextBox)gridViewRow.FindControl("GVIMilkPwderQty"));
        TextBox GVIMilkPwderStk = ((TextBox)gridViewRow.FindControl("GVIMilkPwderStk"));


        ViewState["id"] = e.CommandArgument.ToString();

        if (e.CommandName == "btnUpdate")
        {
            using (SqlConnection sqlConnection = new SqlConnection(_connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    sqlConnection.Open();
                    SqlCommand cmd = new SqlCommand("uspVerifierUpdate", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InflowId", ViewState["id"]);
                    cmd.Parameters.AddWithValue("@Milkqty", GVIMilkQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Milkfat", GVIMilkFat.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkSNF", GVIMilkSNF.Text.Trim());
                    cmd.Parameters.AddWithValue("@Milkfatperc", GVIMilkFatPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkSNFperc", GVIMilkSNFPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterqty", GVIButterQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterstock", GVIButterStck.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderqty", GVIMilkPwderQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderstock", GVIMilkPwderStk.Text.Trim());

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(ds);
                    }
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["sts"]))
                                {
                                    lblmsg.Text = ds.Tables[0].Rows[0]["msg"].ToString();
                                    lblmsg.CssClass = "text-success";

                                }
                                else
                                {
                                    lblmsg.Text = ds.Tables[0].Rows[0]["msg"].ToString();
                                    lblmsg.CssClass = "text-danger";
                                }
                                ViewState["id"] = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    sqlConnection.Close();
                }
            }

        }
    }



    protected void GVIMilkQty_TextChanged(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((TextBox)sender).NamingContainer;
        TextBox TxtMilkFatPerc = (TextBox)row.FindControl("GVIMilkFatPerc");
        TextBox TxtMilkSNFPerc = (TextBox)row.FindControl("GVIMilkSNFPerc");
        TextBox TxtMilkQty = (TextBox)row.FindControl("GVIMilkQty");
        TextBox TxtMilkSNF = (TextBox)row.FindControl("GVIMilkSNF");
        TextBox TxtMilkFat = (TextBox)row.FindControl("GVIMilkFat");

        decimal milkQty = decimal.Parse(TxtMilkQty.Text);
        decimal milkSNFPerc = decimal.Parse(TxtMilkSNFPerc.Text);

        decimal milkSNF = (milkQty * milkSNFPerc) / 100;
        TxtMilkSNF.Text = milkSNF.ToString();


        decimal milkFatPerc = decimal.Parse(TxtMilkFatPerc.Text);

        decimal milkFat = (milkQty * milkFatPerc) / 100;
        TxtMilkFat.Text = milkFat.ToString();
    }
}