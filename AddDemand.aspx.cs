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
            Fillddl(DdlVehicleName, "Usp_GetUnit");
            obj.FillGrid(grdDemands, "Usp_GetDemand", Connstr, divAlert);
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

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (DdlItemCat.SelectedValue != "")
            {
                DataSet ds = obj.ByProcedure("GetItemsByCategory", new[] { "ItemCategory" }, new[] { DdlItemCat.SelectedValue }, Connstr);

                if (ds.Tables.Count > 1)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ds.Tables[0].Columns.Add("Quantity", typeof(int));
                        ds.Tables[0].Columns.Add("AdvancedCard", typeof(int));

                        grdItems.DataSource = ds.Tables[0];
                        grdItems.DataBind();
                        FS_Details.Visible = true;
                        BtnSubmit.Text = "Submit";
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
                    if (BtnSubmit.Text == "Update")
                    {
                        sqlDataAdapter.SelectCommand.CommandText = "usp_UpdateDemand";
                        sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@DemandId", ViewState["DemandId"].ToString());
                    }
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@date", Txtdate.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", DdlItemCat.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Shift", DdlShift.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Retailer", DdlRetailer.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@VehicleName", DdlVehicleName.SelectedValue);
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

                        DdlShift.ClearSelection();
                        DdlShift.Items.FindByValue("Morning").Selected = true;

                        DdlDemandType.ClearSelection();
                        DdlDemandType.Items.FindByValue("Regular").Selected = true;

                        FS_Details.Visible = false;
                        obj.FillGrid(grdDemands, "Usp_GetDemand", Connstr, divAlert);
                        BtnSubmit.Text = "Submit";
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
    protected void grdDemands_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "EditData")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                Label lblDate = (Label)row.FindControl("lblDate");
                //Label hfDemandId = (Label)row.FindControl("hfDemandId");
                Label lblItemCategory = (Label)row.FindControl("lblItemCategory");
                Label lblShift = (Label)row.FindControl("lblShift");
                Label lblRetailer = (Label)row.FindControl("lblRetailer");
                Label lblVehicleName = (Label)row.FindControl("lblVehicleName");
                HiddenField hfUnitID = (HiddenField)row.FindControl("hfUnitID");
                Label lblDemandType = (Label)row.FindControl("lblDemandType");
                ViewState["DemandId"] = e.CommandArgument;
                Txtdate.Text = DateTime.Parse(lblDate.Text).ToString("yyyy-MM-dd");

                DdlDemandType.ClearSelection();
                DdlDemandType.Items.FindByValue(lblDemandType.Text).Selected = true;

                DdlItemCat.ClearSelection();
                DdlItemCat.Items.FindByValue(lblItemCategory.Text).Selected = true;

                DdlRetailer.ClearSelection();
                DdlRetailer.Items.FindByValue(lblRetailer.Text).Selected = true;

                DdlShift.ClearSelection();
                DdlShift.Items.FindByValue(lblShift.Text).Selected = true;

                DdlVehicleName.ClearSelection();
                DdlVehicleName.Items.FindByValue(hfUnitID.Value).Selected = true;

                DataSet ds = obj.ByProcedure("Usp_GetDemandItems", new[] { "DemandId" }, new[] { e.CommandArgument.ToString() }, Connstr);

                if (ds.Tables.Count > 1)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ViewState["DemandItems"] = ds.Tables[0];
                        grdItems.DataSource = ds.Tables[0];
                        grdItems.DataBind();
                        FS_Details.Visible = true;
                        BtnSubmit.Text = "Update";
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
            else if (e.CommandName == "DeleteData")
            {
                DataSet ds = obj.ByProcedure("usp_DeleteDemand", new[] { "DemandId" }, new[] { e.CommandArgument.ToString() }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grdDemands, "Usp_GetDemand", Connstr, divAlert);
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

