using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;


public partial class TargetDetails : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            FS_Details.Visible = false;

            FillGrid(grdItems, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { DdlItemCat.SelectedValue });
        }

    }

    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml = sb.ToString();

    }


    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    {
        try
        {
            SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            adpt.SelectCommand.Parameters.Clear();
            if (prm.Length != 0 && values.Length != 0)
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



    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            if (DdlItemCat.SelectedValue != "")
            {
                FillGrid(grdItems, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { DdlItemCat.SelectedValue });
                FS_Details.Visible = true;
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                DataTable dtItems = new DataTable();

                dtItems.Columns.Add("ItemID", typeof(string));
                dtItems.Columns.Add("ItemName", typeof(string));
                dtItems.Columns.Add("TargetData", typeof(decimal));
                dtItems.Columns.Add("SaleCumulative", typeof(decimal));
                dtItems.Columns.Add("SaleAbsolute", typeof(decimal));
                dtItems.Columns.Add("AvgGrowthPer", typeof(decimal));

                foreach (GridViewRow row in grdItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemId"] = ((HiddenField)row.FindControl("lblItemId")).Value;
                    dr["ItemName"] = ((Label)row.FindControl("lblItemName")).Text;
                    dr["TargetData"] = int.Parse(((TextBox)row.FindControl("txtTarget")).Text);
                    dr["SaleCumulative"] = int.Parse(((TextBox)row.FindControl("txtCumulative")).Text);
                    dr["SaleAbsolute"] = int.Parse(((TextBox)row.FindControl("txtAbsolute")).Text);
                    dr["AvgGrowthPer"] = int.Parse(((TextBox)row.FindControl("txtPerc")).Text);
                    dtItems.Rows.Add(dr);
                }


                DataSet ds = new DataSet();
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddTarget", Connstr))
                {
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Targetmonth", Txtdate.Value);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", DdlItemCat.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetItems", dtItems);

                    sqlDataAdapter.Fill(ds);
                }
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                        Page_Load(sender, e);

                    }
                    else
                    {
                        alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-danger");
                    }

                }
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
        }
    }
}
