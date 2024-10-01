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

public partial class _Default : System.Web.UI.Page
{
    string _connectionString = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //FillGrid(gvPlantItems, "GetItemsByCategory");
            FillGrid(gvProductItems, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { "Product" });
            FillGrid(gvMilkItems, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { "Milk" });
            divAlert.InnerHtml = "";
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


    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    {
        try
        {

      
        SqlDataAdapter adpt = new SqlDataAdapter(proc, _connectionString);
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

    protected void BtnSubmit_Click1(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                DataTable dtItems = new DataTable();

                dtItems.Columns.Add("ItemName", typeof(string));
                dtItems.Columns.Add("Quantity", typeof(int));
                dtItems.Columns.Add("advance", typeof(int));


                foreach (GridViewRow row in gvProductItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemName"] = ((Label)row.FindControl("GVItemName")).Text;
                    dr["Quantity"] = int.Parse(((TextBox)row.FindControl("GVIQuantity")).Text);

                    dtItems.Rows.Add(dr);
                }   
                foreach (GridViewRow row in gvMilkItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemName"] = ((Label)row.FindControl("GVItemName")).Text;
                    dr["Quantity"] = int.Parse(((TextBox)row.FindControl("GVIQuantity")).Text);

                    dtItems.Rows.Add(dr);
                }


                DataSet ds = new DataSet();
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddManufItem", _connectionString))
                {
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@date", (DateTime.Now).ToString("yyyy-MM-dd"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ManufItems", dtItems);

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