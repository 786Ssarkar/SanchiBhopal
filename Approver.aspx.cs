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

public partial class Approver : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            FillGrid(grdApprove, "Usp_GetInflowToAprove", new[] { "IsApproved"},new[] { "0"});

        }

    }

    protected void grdApprove_RowCommand(object sender, GridViewCommandEventArgs e)
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

            Code by = new Code();
            DataSet ds = by.ByProcedure("Usp_AproveInflow",
                 new[] {"InflowId","Milkqty",
                    "Milkfat", "MilkSNF",
                    "Milkfatperc","MilkSNFperc",
                    "Butterqty","Butterstock",
                    "MilkPowderqty", "MilkPowderstock"
                 }, new[] {e.CommandArgument.ToString(),Row_TxtMilkQty.Text,
                    Row_TxtMilkFat.Text, Row_TxtMilkSNF.Text,
                    Row_TxtMilkFatPerc.Text,Row_TxtMilkSNFPerc.Text,
                   Row_TxtButterQty.Text,Row_TxtButterStck.Text,
                    Row_TxtMilkPwderQty.Text, Row_TxtMilkPwderStk.Text,
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
    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
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
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();
    }
}