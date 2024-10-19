using Microsoft.SqlServer.Server;
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

public partial class Default2 : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillddl(DddlUnit, "[Usp_GetinflowUnit]");

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
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Date", Txtdate.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@UnitID", DddlUnit.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkqty", qtyDispatched.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDDate", txtLYSDDate.Text); //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@lysdqty", txtLYSDQty.Text);      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatPercent", txtLYSDFatPercent.Text);      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFPercent", txtLYSDSNFPercent.Text);      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatKG", ((Convert.ToDecimal(txtLYSDFatPercent.Text) / 100) * Convert.ToDecimal(txtLYSDQty.Text)).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFKG", ((Convert.ToDecimal(txtLYSDSNFPercent.Text) / 100) * Convert.ToDecimal(txtLYSDQty.Text)).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfat", ((Convert.ToDecimal(fatPercent.Text) / 100) * Convert.ToDecimal(qtyDispatched.Text)).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNF", ((Convert.ToDecimal(snfPercent.Text) / 100) * Convert.ToDecimal(qtyDispatched.Text)).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfatperc", fatPercent.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNFperc", snfPercent.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterqty", WbQty.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterstock", Wbstock.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderqty", MilkPowderQty.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderstock", MilkPowderStock.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderqty", WholeMilkPowderQty.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderstock", WholeMilkPowderStock.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheeqty", txtGheeQty.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheestock", txtGheeStock.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetDate", TargetDate.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetMilk", txtTargetmilk.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkCumulative", txtMilkCumulative.Text);
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
}


