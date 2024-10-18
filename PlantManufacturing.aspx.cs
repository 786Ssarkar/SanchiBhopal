using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string _connectionString = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //FillGrid(gvPlantItems, "GetItemsByCategory");
            obj.FillGrid(gvProductItems, "GetItemsByCategory", _connectionString, divAlert, new[] { "@ItemCategory" }, new[] { "Product" });
            obj.FillGrid(gvMilkItems, "GetItemsByCategory", _connectionString, divAlert, new[] { "@ItemCategory" }, new[] { "Milk" });
            divAlert.InnerHtml = "";
        }
    }

    protected void BtnSubmit_Click1(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("ItemID", typeof(int));
                dtItems.Columns.Add("ItemName", typeof(string));
                dtItems.Columns.Add("Quantity", typeof(int));
                dtItems.Columns.Add("advance", typeof(int));

                foreach (GridViewRow row in gvMilkItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemID"] = ((HiddenField)row.FindControl("hfItemID")).Value;
                    dr["ItemName"] = ((Label)row.FindControl("GVItemName")).Text;
                    dr["Quantity"] = string.IsNullOrEmpty(((TextBox)row.FindControl("GVIQuantity")).Text)
                                     ? 0
                                     : int.Parse(((TextBox)row.FindControl("GVIQuantity")).Text);

                    dtItems.Rows.Add(dr);
                }

                foreach (GridViewRow row in gvProductItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemID"] = ((HiddenField)row.FindControl("hfItemID")).Value;
                    dr["ItemName"] = ((Label)row.FindControl("GVItemName")).Text;
                    dr["Quantity"] = string.IsNullOrEmpty(((TextBox)row.FindControl("GVIQuantity")).Text)
                                     ? 0
                                     : int.Parse(((TextBox)row.FindControl("GVIQuantity")).Text);


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
                        obj.clearFields((HtmlForm)Master.FindControl("form1"));
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");

                    }
                    else
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-danger");
                    }

                }
            }
        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }

    }
}