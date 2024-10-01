using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;

public partial class Approver : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            FillGrid(grdApprove, "Usp_GetInflowToAprove", new[] { "IsApproved" }, new[] { "0" });
            FillGrid(grdApproved, "Usp_GetInflowToAprove", new[] { "IsApproved" }, new[] { "1" });

        }

    }

    protected void grdApprove_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Approve")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                TextBox Row_TxtMilkQty = (TextBox)row.FindControl("TxtMilkQty");
                TextBox Row_TxtMilkFat = (TextBox)row.FindControl("TxtMilkFat");
                TextBox Row_TxtMilkSNF = (TextBox)row.FindControl("TxtMilkSNF");
                TextBox Row_TxtMilkFatPerc = (TextBox)row.FindControl("TxtMilkFatPerc");
                TextBox Row_TxtMilkSNFPerc = (TextBox)row.FindControl("TxtMilkSNFPerc");
                TextBox Row_TxtButterQty = (TextBox)row.FindControl("TxtButterQty");
                TextBox Row_TxtButterStck = (TextBox)row.FindControl("TxtButterStck");
                TextBox Row_TxtMilkPwderQty = (TextBox)row.FindControl("TxtMilkPwderQty");
                TextBox Row_TxtMilkPwderStk = (TextBox)row.FindControl("TxtMilkPwderStk");
                TextBox Row_TxtWholeMilkPwderqty = (TextBox)row.FindControl("TxtWholeMilkPwderqty");
                TextBox Row_TxtWholeMilkPwderStk = (TextBox)row.FindControl("TxtWholeMilkPwderStk");
                TextBox Row_TxtGheeqty = (TextBox)row.FindControl("TxtGheeqty");
                TextBox Row_TxtGheeStk = (TextBox)row.FindControl("TxtGheeStk");

                Code by = new Code();
                DataSet ds = by.ByProcedure("Usp_AproveInflow",
                     new[] {"InflowId","Milkqty",
                    "Milkfat", "MilkSNF",
                    "Milkfatperc","MilkSNFperc",
                    "Butterqty","Butterstock",
                    "MilkPowderqty", "MilkPowderstock", "WholeMilkPowderqty"  ,"WholeMilkPowderstock","Gheeqty","Gheestock"
                     }, new[] {e.CommandArgument.ToString(),Row_TxtMilkQty.Text,
                    Row_TxtMilkFat.Text, Row_TxtMilkSNF.Text,
                    Row_TxtMilkFatPerc.Text,Row_TxtMilkSNFPerc.Text,
                   Row_TxtButterQty.Text,Row_TxtButterStck.Text,
                    Row_TxtMilkPwderQty.Text, Row_TxtMilkPwderStk.Text,Row_TxtWholeMilkPwderqty.Text,Row_TxtWholeMilkPwderStk.Text,Row_TxtGheeqty.Text,Row_TxtGheeStk.Text
                     }, Connstr);


                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                        FillGrid(grdApprove, "Usp_GetInflowToAprove", new[] { "IsApproved" }, new[] { "0" });
                    }
                    else
                    {
                        alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-warning");
                    }
                }
                else
                {
                    alertmsg("Somthing went wrong", "bg-danger");
                }
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
        }
    }
    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    {
        try
        {
            SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            adpt.SelectCommand.Parameters.Clear();
            if (prm != null && values != null)
            {
                for (int i = 0; i < prm.Length; i++)
                {
                    adpt.SelectCommand.Parameters.AddWithValue(prm[i], values[i]);
                }
            }
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables.Count > 1)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grd.DataSource = ds.Tables[0];
                    grd.DataBind();

                }
                else
                {
                    alertmsg("Table is Empty", "bg-warning");
                }
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-warning");
                }
            }
            else
            {
                alertmsg("Somthing went wrong", "bg-warning");
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
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

    protected void CalculateSnfAndFat(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)((TextBox)sender).NamingContainer;
            TextBox TxtMilkFatPerc = (TextBox)row.FindControl("TxtMilkFatPerc");
            TextBox TxtMilkSNFPerc = (TextBox)row.FindControl("TxtMilkSNFPerc");
            TextBox TxtMilkQty = (TextBox)row.FindControl("TxtMilkQty");

            TextBox TxtMilkSNF = (TextBox)row.FindControl("TxtMilkSNF");
            TextBox TxtMilkFat = (TextBox)row.FindControl("TxtMilkFat");

            decimal milkQty = decimal.Parse(TxtMilkQty.Text);
            decimal milkSNFPerc = decimal.Parse(TxtMilkSNFPerc.Text);
            decimal milkFatPerc = decimal.Parse(TxtMilkFatPerc.Text);

            decimal milkSNF = (milkQty * milkSNFPerc) / 100;
            decimal milkFat = (milkQty * milkFatPerc) / 100;
            TxtMilkSNF.Text = milkSNF.ToString();
            TxtMilkFat.Text = milkFat.ToString();
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
        }

    }
}