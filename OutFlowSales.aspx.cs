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
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
public partial class _Default : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            ViewState["Category"] = null;
            Fillddl(DdlUnit, "Usp_GetUnit");
            obj.FillGrid(grdOutFlow, "Usp_GetItemDetails", Connstr, divAlert);
            TxtDate.Text = DateTime.Now.ToString();
            txtLYSDQty.Text = "";

        }
    }
    protected void btnMilk_Click(object sender, EventArgs e)
    {
        try
        {


            if (((Button)sender).Text == "Milk")
            {
                FillGrid(grdMilk, "GetItemsByCategory", Connstr, divAlert, new[] { "@ItemCategory" }, new[] { "Milk" });
                ViewState["Category"] = "Milk";
                grdProduct.DataSource = null;
                grdProduct.DataBind();
            }
            else if (((Button)sender).Text == "Product")
            {
                FillGrid(grdProduct, "GetItemsByCategory", Connstr, divAlert, new[] { "@ItemCategory" }, new[] { "Product" });
                ViewState["Category"] = "Product";
                grdMilk.DataSource = null;
                grdMilk.DataBind();
            }
        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (ViewState["Category"] != null)
            {
                DataTable td;
                if (ViewState["Category"].ToString() == "Milk")
                {
                    td = GetGridData(grdMilk);
                    SubmitItems(td, "Milk");
                    obj.FillGrid(grdOutFlow, "Usp_GetItemDetails", Connstr, divAlert);
                }
                else if (ViewState["Category"].ToString() == "Product")
                {
                    td = GetGridData(grdProduct);
                    SubmitItems(td, "Product");
                }
            }
        }
        catch (Exception ex)
        {

            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }
    public DataTable GetGridData(GridView grd)

    {
        DataTable dtItems = new DataTable();
        dtItems.Columns.Add("ItemID", typeof(int));
        dtItems.Columns.Add("ItemName", typeof(string));
        dtItems.Columns.Add("Quantity", typeof(int));
        dtItems.Columns.Add("AdvancedCard", typeof(int));

        foreach (GridViewRow row in grd.Rows)
        {
            DataRow dr = dtItems.NewRow();
            dr["ItemID"] = ((HiddenField)row.FindControl("hfItemID")).Value;
            dr["ItemName"] = ((Label)row.FindControl("lblItemName")).Text;

            dr["Quantity"] = string.IsNullOrEmpty(((TextBox)row.FindControl("TxtQty")).Text)
            ? 0
            : int.Parse(((TextBox)row.FindControl("TxtQty")).Text);

            dtItems.Rows.Add(dr);
        }
        return dtItems;
    }
    public void SubmitItems(DataTable td, string Category)
    {
        try
        {
            DataSet ds = new DataSet();
            using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddSales", Connstr))
            {
                sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (BtnSubmit.Text == "Update")
                {
                    sqlDataAdapter.SelectCommand.CommandText = "usp_UpdateSales";
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SalesID", ViewState["SalesID"].ToString());
                }

                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@date", TxtDate.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", Category);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDQty", txtLYSDQty.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@NameOfUnit", DdlUnit.SelectedValue);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Items", td);

                sqlDataAdapter.Fill(ds);

            }
            if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                    grdProduct.DataSource = null;
                    grdProduct.DataBind();
                    grdMilk.DataSource = null;
                    grdMilk.DataBind();
                    ViewState["Category"] = null;
                    colMilk.Attributes.CssStyle.Value = "col-md-6 mt-4";
                    colProducts.Attributes.CssStyle.Value = "col-md-6 mt-4";
                    TxtDate.Text = DateTime.Now.ToString();
                    DdlUnit.ClearSelection();
                    txtLYSDQty.Text = "";
                    obj.FillGrid(grdOutFlow, "Usp_GetItemDetails", Connstr, divAlert);
                    BtnSubmit.Text = "Submit";
                }
                else
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-danger");
                }
            }
        }
        catch (Exception ex)
        {

            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }
    public void Fillddl(DropDownList ddl, string proc)
    {
        try
        {


            ddl.DataSource = null;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Select--", ""));
            SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables.Count > 1)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddl.DataSource = ds.Tables[0];
                    ddl.DataTextField = "Name";
                    ddl.DataValueField = "Id";
                    ddl.DataBind();

                }
                else
                {
                    obj.alertmsg("Table is Empty", divAlert, "bg-warning");
                }
                ddl.Items.Insert(0, new ListItem("--Select--", ""));
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");

                }
            }
            else
            {
                obj.alertmsg("Somthing went wrong", divAlert, "bg-warning");
            }
        }
        catch (Exception ex)
        {

            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }
    protected void FillGrid(GridView grd, string proc, string ConnStr, HtmlGenericControl alertdiv, string[] prm = null, string[] values = null)
    {
        try
        {
            grd.DataSource = null;
            grd.DataBind();

            SqlDataAdapter adpt = new SqlDataAdapter(proc, ConnStr);
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
                    ds.Tables[0].Columns.Add("Quantity", typeof(int));
                    grd.DataSource = ds.Tables[0];
                    grd.DataBind();
                }
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), alertdiv, "bg-warning");
                }
            }
            else
            {
                obj.alertmsg("Somthing went wrong", alertdiv, "bg-warning");
            }
        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, alertdiv, "bg-danger");
        }
    }
    protected void grdOutFlow_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "EditData")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                HiddenField hfUnitID = (HiddenField)row.FindControl("hfUnitID");
                Label lblDate = (Label)row.FindControl("lblDate");
                Label lblLYSDQty = (Label)row.FindControl("lblLYSDQty");
                Label lblItemCategory = (Label)row.FindControl("lblItemCategory");

                ViewState["SalesID"] = e.CommandArgument;
                TxtDate.Text = DateTime.Parse(lblDate.Text).ToString("yyyy-MM-dd");

                txtLYSDQty.Text = lblLYSDQty.Text;
                DdlUnit.ClearSelection();
                DdlUnit.Items.FindByValue(hfUnitID.Value).Selected = true;

                if (lblItemCategory.Text == "Milk")
                {
                    obj.FillGrid(grdMilk, "Usp_GetsalesItems", Connstr, divAlert, new[] { "@SalesID" }, new[] { e.CommandArgument.ToString() });
                    ViewState["Category"] = "Milk";
                    grdProduct.DataSource = null;
                    grdProduct.DataBind();
                    BtnSubmit.Text = "Update";
                }
                else if (lblItemCategory.Text == "Product")
                {
                    obj.FillGrid(grdProduct, "Usp_GetsalesItems", Connstr, divAlert, new[] { "@SalesID" }, new[] { e.CommandArgument.ToString() });
                    ViewState["Category"] = "Product";
                    grdMilk.DataSource = null;
                    grdMilk.DataBind();
                    BtnSubmit.Text = "Update";

                }
            }
            else if (e.CommandName == "DeleteData")
            {
                DataSet ds = obj.ByProcedure("usp_DeleteSales", new[] { "SalesID" }, new[] { e.CommandArgument.ToString() }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grdOutFlow, "Usp_GetItemDetails", Connstr, divAlert);
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