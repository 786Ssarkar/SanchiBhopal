using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillddl(DdlUnit, "Usp_GetinflowUnit");
            obj.FillGrid(GVInflow, "Usp_GetInflowDetails", Connstr, divAlert);
            Txtdate.Text = (DateTime.Now).ToString("yyyy-MM-dd");
            Txtdate_TextChanged(sender, e);
        }
        else
        {

            MaintainScrollPositionOnPostBack = true;
        }

    }

    private string ParseValue(TextBox textBox)
    {
        if (textBox != null && !string.IsNullOrEmpty(textBox.Text.Trim()))
        {
            // Try to parse the value, return 0 if parsing fails
            int result;
            decimal resultDecimal;
            if (int.TryParse(textBox.Text, out result)) // Use out parameter without declaration
            {
                return result.ToString();
            }
            else if (decimal.TryParse(textBox.Text, out resultDecimal))
            {
                return resultDecimal.ToString();
            }

        }
        return "0"; // Return 0 if the TextBox is null or empty
    }


    public decimal getPercent(string Percent = "0.00", string Qty = "0.00")
    {
        decimal CalPercent, CalQty;

        if (decimal.TryParse(Percent, out CalPercent) && decimal.TryParse(Qty, out CalQty))
        {
            return ((CalPercent / 100) * CalQty);
        }
        else
        {
            return Convert.ToDecimal(0.00);
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            {
                DataSet ds = new DataSet();
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddInFlow", Connstr))
                {
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    if (btnSubmit.Text == "Update")
                    {
                        sqlDataAdapter.SelectCommand.CommandText = "usp_UpdateInFlow";
                        sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@InflowId", ViewState["InflowId"].ToString());
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@UpdatedByIP", Request.ServerVariables["REMOTE_ADDR"]);


                    }
                    if (btnSubmit.Text == "Submit")
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@CreatedByIP", Request.ServerVariables["REMOTE_ADDR"]);

                    }
                    if (!string.IsNullOrEmpty(Txtdate.Text))
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Date", Txtdate.Text);

                    }
                    else
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy-MM-dd"));
                    }
                    if (!string.IsNullOrEmpty(txtLYSDDate.Text))
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDDate", txtLYSDDate.Text);

                    }
                    else
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDDate", ((DateTime.Now).AddYears(-1)).ToString("yyyy-MM-dd"));
                    }


                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@UnitID", DdlUnit.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkqty", ParseValue(qtyDispatched));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@", ParseValue(txtLYSDDate)); //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@lysdqty", ParseValue(txtLYSDQty));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatPercent", string.IsNullOrEmpty(txtLYSDFatPercent.Text) ? "0" : txtLYSDFatPercent.Text);      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFPercent", string.IsNullOrEmpty(txtLYSDSNFPercent.Text) ? "0" : txtLYSDSNFPercent.Text);      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatKG", getPercent(txtLYSDFatPercent.Text, txtLYSDQty.Text).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFKG", getPercent(txtLYSDSNFPercent.Text, txtLYSDQty.Text).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfat", getPercent(fatPercent.Text, qtyDispatched.Text).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNF", getPercent(snfPercent.Text, qtyDispatched.Text).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfatperc", string.IsNullOrEmpty(fatPercent.Text) ? "0" : fatPercent.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNFperc", string.IsNullOrEmpty(snfPercent.Text) ? "0" : snfPercent.Text);







                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WBVerient", 12);

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WBOBal", ParseValue(WBOpeningBln));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WBManuf", ParseValue(WbManufacturer));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterqty", ParseValue(WbQty));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterstock", GetTotal(ParseValue(WBOpeningBln), ParseValue(WbManufacturer), ParseValue(WbQty)));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SMPVerient", 10);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SMPBal", ParseValue(MilkPowderBal));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SMPManuf", ParseValue(MilkPowderManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderqty", ParseValue(MilkPowderQty));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderstock", GetTotal(ParseValue(MilkPowderBal), ParseValue(MilkPowderManuf), ParseValue(MilkPowderQty)));

                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPVerient", 43);  // server
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPVerient", 47);  //    local

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPBal", ParseValue(WMPblnc));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPManuf", ParseValue(WMPManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderqty", ParseValue(WholeMilkPowderQty));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderstock", GetTotal(ParseValue(WMPblnc), ParseValue(WMPManuf), ParseValue(WholeMilkPowderQty)));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@GheeVerient", DdlGheeVerient.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@GheeBal", ParseValue(Gheebalnc));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@GheeManuf", ParseValue(GheeManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheeqty", ParseValue(txtGheeQty));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheestock", GetTotal(ParseValue(Gheebalnc), ParseValue(GheeManuf), ParseValue(txtGheeQty)));

                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetDate", ParseValue(TargetDate));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetMilk", ParseValue(txtTargetmilk));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkCumulative", ParseValue(txtMilkCumulative));
                    sqlDataAdapter.Fill(ds);
                }
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.clearFields((HtmlForm)Master.FindControl("form1"));
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(GVInflow, "Usp_GetInflowDetails", Connstr, divAlert, new[] { "@FromDate", "@ToDate" }, new[] { FromTxtdate.Text, ToTxtdate.Text });
                        btnSubmit.Text = "Submit";
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
    public static decimal GetTotal(string bal, string manf, string Qty)
    {
        return (decimal.Parse(bal ?? "0")) + (decimal.Parse(manf ?? "0")) + (decimal.Parse(Qty ?? "0"));
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

    protected void GVInflow_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "EditData")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                HiddenField hfUnitID = (HiddenField)row.FindControl("hfUnitID");
                Label lblDate = (Label)row.FindControl("lblDate");
                Label lblMilkQty = (Label)row.FindControl("lblMilkQty");
                Label lblMilkFatPerc = (Label)row.FindControl("lblMilkFatPerc");
                Label lblMilkSNFPerc = (Label)row.FindControl("lblMilkSNFPerc");
                Label lblMilkFatKg = (Label)row.FindControl("lblMilkFatKg");
                Label lblMilkSNFKg = (Label)row.FindControl("lblMilkSNFKg");

                Label lblLYSDDate = (Label)row.FindControl("lblLYSDDate");
                Label lbllysdqty = (Label)row.FindControl("lbllysdqty");
                Label lblLYSDFatPercent = (Label)row.FindControl("lblLYSDFatPercent");
                Label lblLYSDSNFPercent = (Label)row.FindControl("lblLYSDSNFPercent");
                Label lblLYSDFatKG = (Label)row.FindControl("lblLYSDFatKG");
                Label lblLYSDSNFKG = (Label)row.FindControl("lblLYSDSNFKG");

                Label lblWBOpeningBln = (Label)row.FindControl("lblWBOBal");
                Label lblWbManufacturer = (Label)row.FindControl("lblWBManuf");
                Label lblWbQty = (Label)row.FindControl("lblButterqty");
                Label lblWBTotal = (Label)row.FindControl("lblButterstock");

                Label lblSMPBal = (Label)row.FindControl("lblSMPBal");
                Label lblSMPManuf = (Label)row.FindControl("lblSMPManuf");
                Label lblMilkPowderqty = (Label)row.FindControl("lblMilkPowderqty");
                Label lblMilkPowderstock = (Label)row.FindControl("lblMilkPowderstock");

                Label lblWMPBal = (Label)row.FindControl("lblWMPBal");
                Label lblWMPManuf = (Label)row.FindControl("lblWMPManuf");
                Label lblWholeMilkPowderqty = (Label)row.FindControl("lblWholeMilkPowderqty");
                Label lblWholeMilkPowderstock = (Label)row.FindControl("lblWholeMilkPowderstock");

                HiddenField hfGheeID = (HiddenField)row.FindControl("hfGheeID");
                Label lblGheeBal = (Label)row.FindControl("lblGheeBal");
                Label lblGheeManuf = (Label)row.FindControl("lblGheeManuf");
                Label lblGheeqty = (Label)row.FindControl("lblGheeqty");
                Label lblGheestock = (Label)row.FindControl("lblGheestock");

                DdlUnit.ClearSelection();
                DdlUnit.Items.FindByValue(hfUnitID.Value).Selected = true;
                //SMP
                MilkPowderBal.Text = lblSMPBal.Text;
                MilkPowderManuf.Text = lblSMPManuf.Text;
                MilkPowderQty.Text = lblMilkPowderqty.Text;
                MilkPowderStock.Text = lblMilkPowderstock.Text;
                //WMP
                WMPblnc.Text = lblWMPBal.Text;
                WMPManuf.Text = lblWMPManuf.Text;
                WholeMilkPowderQty.Text = lblWholeMilkPowderqty.Text;
                WholeMilkPowderStock.Text = lblWholeMilkPowderstock.Text;
                //Ghee
                DdlGheeVerient.ClearSelection();
                DdlGheeVerient.Items.FindByValue(hfGheeID.Value).Selected = true;
                Gheebalnc.Text = lblGheeBal.Text;
                GheeManuf.Text = lblGheeManuf.Text;
                txtGheeQty.Text = lblGheeqty.Text;
                txtGheeStock.Text = lblGheestock.Text;
                //WB
                WBOpeningBln.Text = lblWBOpeningBln.Text;
                WbManufacturer.Text = lblWbManufacturer.Text;
                WbQty.Text = lblWbQty.Text;
                Wbstock.Text = lblWBTotal.Text;

                //lysd
                txtLYSDDate.Text = DateTime.ParseExact(lblLYSDDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                txtLYSDQty.Text = lbllysdqty.Text;
                txtLYSDFatPercent.Text = lblLYSDFatPercent.Text;
                txtLYSDFatKG.Text = lblLYSDFatKG.Text;
                txtLYSDSNFPercent.Text = lblLYSDSNFPercent.Text;
                txtLYSDSNFKG.Text = lblLYSDSNFKG.Text;
                //cysd
                Txtdate.Text = DateTime.ParseExact(lblDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                qtyDispatched.Text = lblMilkQty.Text;
                fatPercent.Text = lblMilkFatPerc.Text;
                fatKg.Text = lblMilkFatKg.Text;
                snfPercent.Text = lblMilkSNFPerc.Text;
                snfKg.Text = lblMilkSNFKg.Text;

                ViewState["InflowId"] = e.CommandArgument;
                btnSubmit.Text = "Update";
            }
            else if (e.CommandName == "DeleteData")
            {

                DataSet ds = obj.ByProcedure("usp_DeleteInFlow", new[] { "InflowId" }, new[] { e.CommandArgument.ToString() }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(GVInflow, "Usp_GetInflowDetails", Connstr, divAlert, new[] { "@FromDate", "@ToDate" }, new[] { FromTxtdate.Text, ToTxtdate.Text});
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


    protected void Txtdate_TextChanged(object sender, EventArgs e)
    {
        txtLYSDDate.Text = (DateTime.Parse(Txtdate.Text).AddYears(-1)).ToString("yyyy-MM-dd");

        getOpningBal(WBOpeningBln, WbManufacturer, "12", "WB");
        getOpningBal(MilkPowderBal, MilkPowderManuf, "10", "SMP");
        getOpningBal(WMPblnc, WMPManuf, "43", "WMP");//on server
        DdlUnit_SelectedIndexChanged(sender, e);
        DdlGheeVerient_SelectedIndexChanged(sender, e);
    }


    protected void DdlUnit_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtLYSDQty.Text = "0.00";
        txtLYSDFatPercent.Text = "0.00";
        txtLYSDFatKG.Text = "0.00";
        txtLYSDSNFPercent.Text = "0.00";
        txtLYSDSNFKG.Text = "0.00";

        DataSet ds = obj.ByProcedure("Usp_GetLYSDQty", new[] { "date", "UnitID" }, new[] { Txtdate.Text, DdlUnit.SelectedValue }, Connstr);
        if (ds.Tables.Count > 1)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtLYSDQty.Text = ds.Tables[0].Rows[0]["Milkqty"].ToString();
                txtLYSDFatPercent.Text = ds.Tables[0].Rows[0]["Milkfatperc"].ToString();
                txtLYSDFatKG.Text = ds.Tables[0].Rows[0]["Milkfat"].ToString();
                txtLYSDSNFPercent.Text = ds.Tables[0].Rows[0]["MilkSNFperc"].ToString();
                txtLYSDSNFKG.Text = ds.Tables[0].Rows[0]["MilkSNF"].ToString();
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
    public void getOpningBal(TextBox balence, TextBox mnf, String ID, String Condition)
    {
        if (!string.IsNullOrEmpty(Txtdate.Text))
        {

            DataSet ds = obj.ByProcedure("Usp_GetOpeningBal",
                new[] { "ItemID", "date", "Condition" },
                new[] { ID, Txtdate.Text, Condition }, Connstr);
            if (ds.Tables.Count > 1)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    balence.Text = ds.Tables[0].Rows[0]["OpeningBal"].ToString();
                    //mnf.Text = ds.Tables[0].Rows[0]["mnf"].ToString();

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

    }

    protected void DdlGheeVerient_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlGheeVerient.SelectedValue != "")
        {
            getOpningBal(Gheebalnc, GheeManuf, DdlGheeVerient.SelectedValue, "Ghee");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        obj.FillGrid(GVInflow, "Usp_GetInflowDetails", Connstr, divAlert, new[] { "@FromDate", "@ToDate" },
               new[] { FromTxtdate.Text, ToTxtdate.Text});

    }

}


