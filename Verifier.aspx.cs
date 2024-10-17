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
    Code obj = new Code();
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
            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }


    }


    protected void GVDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow gridViewRow = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
        Label GVIUnitName = ((Label)gridViewRow.FindControl("GVIUnitName"));
        TextBox GVIMilkQty = ((TextBox)gridViewRow.FindControl("GVIMilkQty"));
        //TextBox GVIMilkFat = ((TextBox)gridViewRow.FindControl("GVIMilkFatKg"));
        //TextBox GVIMilkSNF = ((TextBox)gridViewRow.FindControl("GVIMilkSNFKg"));
        TextBox GVIMilkFatPerc = ((TextBox)gridViewRow.FindControl("GVIMilkFatPerc"));
        TextBox GVIMilkSNFPerc = ((TextBox)gridViewRow.FindControl("GVIMilkSNFPerc"));
        TextBox GVIButterQty = ((TextBox)gridViewRow.FindControl("GVIButterQty"));
        TextBox GVIButterStck = ((TextBox)gridViewRow.FindControl("GVIButterStck"));
        TextBox GVIMilkPwderQty = ((TextBox)gridViewRow.FindControl("GVIMilkPwderQty"));
        TextBox GVIMilkPwderStk = ((TextBox)gridViewRow.FindControl("GVIMilkPwderStk"));
        TextBox GVIWholeMilkPwderqty = ((TextBox)gridViewRow.FindControl("GVIWholeMilkPwderqty"));
        TextBox GVIWholeMilkPwderStk = ((TextBox)gridViewRow.FindControl("GVIWholeMilkPwderStk"));
        TextBox GVIGheeqty = ((TextBox)gridViewRow.FindControl("GVIGheeqty"));
        TextBox GVIGheeStk = ((TextBox)gridViewRow.FindControl("GVIGheeStk"));

        TextBox GVIlysdqty = ((TextBox)gridViewRow.FindControl("GVIlysdqty"));    
        TextBox GVILYSDFatPercent = ((TextBox)gridViewRow.FindControl("GVILYSDFatPercent"));
        TextBox GVILYSDSNFPercent = ((TextBox)gridViewRow.FindControl("GVILYSDSNFPercent"));
        //TextBox GVILYSDFatKG = ((TextBox)gridViewRow.FindControl("GVILYSDFatKG"));
        //TextBox GVILYSDSNFKG = ((TextBox)gridViewRow.FindControl("GVILYSDSNFKG"));


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
                    cmd.Parameters.AddWithValue("@Milkfat", ((Convert.ToDecimal(GVIMilkFatPerc.Text) / 100) * Convert.ToDecimal(GVIMilkQty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@MilkSNF", ((Convert.ToDecimal(GVIMilkSNFPerc.Text) / 100) * Convert.ToDecimal(GVIMilkQty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@Milkfatperc", GVIMilkFatPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkSNFperc", GVIMilkSNFPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterqty", GVIButterQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterstock", GVIButterStck.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderqty", GVIMilkPwderQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderstock", GVIMilkPwderStk.Text.Trim());
                    cmd.Parameters.AddWithValue("@WholeMilkPowderqty", GVIWholeMilkPwderqty.Text);
                    cmd.Parameters.AddWithValue("@WholeMilkPowderstock", GVIWholeMilkPwderStk.Text);
                    cmd.Parameters.AddWithValue("@Gheeqty", GVIGheeqty.Text);
                    cmd.Parameters.AddWithValue("@Gheestock", GVIGheeStk.Text);
                    cmd.Parameters.AddWithValue("@lysdqty", GVIlysdqty.Text);
                    cmd.Parameters.AddWithValue("@LYSDFatPercent", GVILYSDFatPercent.Text);
                    cmd.Parameters.AddWithValue("@LYSDSNFPercent", GVILYSDSNFPercent.Text);
                    cmd.Parameters.AddWithValue("@LYSDFatKG", ((Convert.ToDecimal(GVILYSDFatPercent.Text) / 100) * Convert.ToDecimal(GVIlysdqty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@LYSDSNFKG", ((Convert.ToDecimal(GVILYSDSNFPercent.Text) / 100) * Convert.ToDecimal(GVIlysdqty.Text)).ToString("F2"));

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
                                    obj.alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), divAlert, "bg-success");

                                    FillGrid();
                                }
                                else
                                {
                                    obj.alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), divAlert, "bg-danger");
                                }
                                ViewState["id"] = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    obj.alertmsg(ex.Message, divAlert, "bg-danger");
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
        sb.Append("<button type=\"button\" class=\" btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml = sb.ToString();
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



    protected void VerifyAll_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in GVDetails.Rows)
            {
                Label GVIUnitName = ((Label)row.FindControl("GVIUnitName"));
                TextBox GVIMilkQty = ((TextBox)row.FindControl("GVIMilkQty"));
                //TextBox GVIMilkFat = ((TextBox)row.FindControl("GVIMilkFatKg"));
                //TextBox GVIMilkSNF = ((TextBox)row.FindControl("GVIMilkSNFKg"));
                TextBox GVIMilkFatPerc = ((TextBox)row.FindControl("GVIMilkFatPerc"));
                TextBox GVIMilkSNFPerc = ((TextBox)row.FindControl("GVIMilkSNFPerc"));
                TextBox GVIButterQty = ((TextBox)row.FindControl("GVIButterQty"));
                TextBox GVIButterStck = ((TextBox)row.FindControl("GVIButterStck"));
                TextBox GVIMilkPwderQty = ((TextBox)row.FindControl("GVIMilkPwderQty"));
                TextBox GVIMilkPwderStk = ((TextBox)row.FindControl("GVIMilkPwderStk"));
                TextBox GVIWholeMilkPwderqty = ((TextBox)row.FindControl("GVIWholeMilkPwderqty"));
                TextBox GVIWholeMilkPwderStk = ((TextBox)row.FindControl("GVIWholeMilkPwderStk"));
                TextBox GVIGheeqty = ((TextBox)row.FindControl("GVIGheeqty"));
                TextBox GVIGheeStk = ((TextBox)row.FindControl("GVIGheeStk"));
                LinkButton BtnAction = ((LinkButton)row.FindControl("BtnAction"));

                TextBox GVIlysdqty = ((TextBox)row.FindControl("GVIlysdqty"));
                TextBox GVILYSDFatPercent = ((TextBox)row.FindControl("GVILYSDFatPercent"));
                TextBox GVILYSDSNFPercent = ((TextBox)row.FindControl("GVILYSDSNFPercent"));
                //TextBox GVILYSDFatKG = ((TextBox)row.FindControl("GVILYSDFatKG"));
                //TextBox GVILYSDSNFKG = ((TextBox)row.FindControl("GVILYSDSNFKG"));

                ViewState["id"] = BtnAction.CommandArgument.ToString();


                using (SqlConnection sqlConnection = new SqlConnection(_connectionString))
                {
                    DataSet ds = new DataSet();

                    sqlConnection.Open();
                    SqlCommand cmd = new SqlCommand("uspVerifierUpdate", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InflowId", ViewState["id"]);
                    cmd.Parameters.AddWithValue("@Milkqty", GVIMilkQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Milkfat",  ((Convert.ToDecimal(GVIMilkFatPerc.Text) / 100) * Convert.ToDecimal(GVIMilkQty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@MilkSNF", ((Convert.ToDecimal(GVIMilkSNFPerc.Text) / 100) * Convert.ToDecimal(GVIMilkQty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@Milkfatperc", GVIMilkFatPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkSNFperc", GVIMilkSNFPerc.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterqty", GVIButterQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Butterstock", GVIButterStck.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderqty", GVIMilkPwderQty.Text.Trim());
                    cmd.Parameters.AddWithValue("@MilkPowderstock", GVIMilkPwderStk.Text.Trim());
                    cmd.Parameters.AddWithValue("@WholeMilkPowderqty", GVIWholeMilkPwderqty.Text);
                    cmd.Parameters.AddWithValue("@WholeMilkPowderstock", GVIWholeMilkPwderStk.Text);
                    cmd.Parameters.AddWithValue("@Gheeqty", GVIGheeqty.Text);
                    cmd.Parameters.AddWithValue("@Gheestock", GVIGheeStk.Text);

                    cmd.Parameters.AddWithValue("@lysdqty", GVIlysdqty.Text);
                    cmd.Parameters.AddWithValue("@LYSDFatPercent", GVILYSDFatPercent.Text);
                    cmd.Parameters.AddWithValue("@LYSDSNFPercent", GVILYSDSNFPercent.Text);
                    cmd.Parameters.AddWithValue("@LYSDFatKG", ((Convert.ToDecimal(GVILYSDFatPercent.Text) / 100) * Convert.ToDecimal(GVIlysdqty.Text)).ToString("F2"));
                    cmd.Parameters.AddWithValue("@LYSDSNFKG", ((Convert.ToDecimal(GVILYSDSNFPercent.Text) / 100) * Convert.ToDecimal(GVIlysdqty.Text)).ToString("F2"));

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


                                }
                                else
                                {
                                    obj.alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), divAlert, "bg-danger");

                                }
                                ViewState["id"] = "";
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            obj.alertmsg((ex.Message).ToString(), divAlert, "bg-danger");
        }

    }

   

}





