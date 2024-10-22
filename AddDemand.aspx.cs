using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;



public partial class AddDemand : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            FS_Details.Visible = false;
        }

    }
    //public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    //{
    //    try
    //    {
    //        SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
    //        adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        adpt.SelectCommand.Parameters.Clear();
    //        if (prm.Length != 0 && values.Length != 0)
    //        {
    //            for (int i = 0; i < prm.Length; i++)
    //            {
    //                adpt.SelectCommand.Parameters.AddWithValue(prm[i], values[i]);
    //            }
    //        }

    //        DataSet ds = new DataSet();
    //        adpt.Fill(ds);
    //        if (ds.Tables.Count > 1)
    //        {
    //            if (ds.Tables[0].Rows.Count > 0)
    //            {
    //                grd.DataSource = ds.Tables[0];
    //                grd.DataBind();
    //            }
    //            else
    //            {
    //                obj.alertmsg("Table is Empty", divAlert, "bg-warning");
    //            }
    //        }
    //        else if (ds.Tables.Count > 0)
    //        {
    //            if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
    //            {
    //                obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");

    //            }
    //        }
    //        else
    //        {
    //            obj.alertmsg("Somthing went wrong", divAlert, "bg-warning");
    //        }

    //    }
    //    catch (Exception ex)
    //    {

    //        obj.alertmsg(ex.Message, divAlert, "bg-danger");
    //    }




    //}



    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            if (DdlItemCat.SelectedValue != "")
            {
                obj.FillGrid(grdItems, "GetItemsByCategory", Connstr, divAlert, new[] { "@ItemCategory" }, new[] { DdlItemCat.SelectedValue });
                FS_Details.Visible = true;
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
            if (Page.IsValid)
            {
                DataTable dtItems = new DataTable();

                dtItems.Columns.Add("ItemID", typeof(int));
                dtItems.Columns.Add("ItemName", typeof(string));
                dtItems.Columns.Add("Quantity", typeof(int));
                dtItems.Columns.Add("AdvancedCard", typeof(int));

                foreach (GridViewRow row in grdItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();



                    dr["ItemID"] = ((HiddenField)row.FindControl("hfItemID")).Value;
                    dr["ItemName"] = ((Label)row.FindControl("lblItemName")).Text;
                    dr["Quantity"] = string.IsNullOrEmpty(((TextBox)row.FindControl("txtQuantity")).Text)
                                    ? 0
                                    : int.Parse(((TextBox)row.FindControl("txtQuantity")).Text);
                    dr["AdvancedCard"] = string.IsNullOrEmpty(((TextBox)row.FindControl("txtAdvancedCard")).Text)
                                         ? 0
                                         : int.Parse(((TextBox)row.FindControl("txtAdvancedCard")).Text);




                    dtItems.Rows.Add(dr);
                }


                DataSet ds = new DataSet();
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddDemand", Connstr))
                {
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@date", Txtdate.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", DdlItemCat.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Shift", DdlShift.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Retailer", DdlRetailer.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@VehicleNo", DdlVehicleNo.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@DemandType", DdlDemandType.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@DemandItems", dtItems);

                    sqlDataAdapter.Fill(ds);
                }
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.clearFields((HtmlForm)Master.FindControl("form1"));
                        FS_Details.Visible = false;
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
