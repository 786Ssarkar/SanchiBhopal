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
            FillDetailGrid("Milk");
            FillDetailGrid("Product");


        }
    }
    protected void btnMilk_Click(object sender, EventArgs e)
    {
        try
        {


            if (((Button)sender).Text == "Milk")
            {
                FillGrid(grdMilk, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { "Milk" });
                ViewState["Category"] = "Milk";
                grdProduct.DataSource = null;
                grdProduct.DataBind();
            }
            else if (((Button)sender).Text == "Product")
            {
                FillGrid(grdProduct, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { "Product" });
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
                    //value = ds.Tables[0].AsEnumerable().Select(row => row["ItemName"].ToString()).ToList();
                    //ViewState[values[0]] = value;
                }
                else
                {
                    obj.alertmsg("Table is Empty", divAlert, "bg-warning");
                }
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
                    FillDetailGrid(ViewState["Category"].ToString());
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

        dtItems.Columns.Add("ItemName", typeof(string));
        dtItems.Columns.Add("Quantity", typeof(int));
        dtItems.Columns.Add("AdvancedCard", typeof(int));

        foreach (GridViewRow row in grd.Rows)
        {
            DataRow dr = dtItems.NewRow();
            dr["ItemName"] = ((Label)row.FindControl("lblItemName")).Text;
            dr["Quantity"] = int.Parse(((TextBox)row.FindControl("TxtQty")).Text);

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

                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@date", TxtDate.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", Category);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@NameOfUnit", DdlUnit.SelectedValue);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Items", td);

                sqlDataAdapter.Fill(ds);
                FillDetailGrid(ViewState["Category"].ToString());
            }
            if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");

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



    protected void FillDetailGrid(string Category)
    {
        using (SqlConnection sqlConnection = new SqlConnection(Connstr))
        {
            DataSet ds = new DataSet();
            try
            {
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("sp_GetItemDetails", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemCategory", Category);
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
                            grdItems.DataSource = ds.Tables[0];
                            grdItems.DataBind();
                        }
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                sqlConnection.Close();
            }
        }

    }
}