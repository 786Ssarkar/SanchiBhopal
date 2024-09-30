using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
         DataSet ds = new DataSet();
            try
            {                                
                using (SqlDataAdapter sda = new SqlDataAdapter("uspVerifierDetails", _connectionString))
                {
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
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
            catch (Exception ex)
            {
            alertmsg(ex.Message, "bg-danger");
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
                                    alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), "bg-success");

                                    FillGrid();

                                }
                                else
                                {
                                    alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), "bg-danger");

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

    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();
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