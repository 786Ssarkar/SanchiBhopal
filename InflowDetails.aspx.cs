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
            txtLYSDDate.Text = ((DateTime.Now).AddYears(-1)).ToString("yyyy-MM-dd");
            TargetDate.Text = (DateTime.Now).ToString("yyyy-MM-dd");
            Txtdate.Text = (DateTime.Now).ToString("yyyy-MM-dd");
        }
    }

    private string ParseValue(TextBox textBox)
    {
        if (textBox != null && !string.IsNullOrEmpty(textBox.Text.Trim()))
        {
            // Try to parse the value, return 0 if parsing fails
            int result;
            if (int.TryParse(textBox.Text, out result)) // Use out parameter without declaration
            {
                return result.ToString();
            }
        }
        return "0"; // Return 0 if the TextBox is null or empty
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
                    if (!string.IsNullOrEmpty(TargetDate.Text))
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetDate", TargetDate.Text);

                    }
                    else
                    {
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetDate", DateTime.Now.ToString("yyyy-MM-dd"));
                    }
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@UnitID", DddlUnit.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkqty", ParseValue(qtyDispatched));
                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@", ParseValue(txtLYSDDate)); //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@lysdqty", ParseValue(txtLYSDQty));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatPercent", ParseValue(txtLYSDFatPercent));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFPercent", ParseValue(txtLYSDSNFPercent));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDFatKG", ((Convert.ToDecimal(ParseValue(txtLYSDFatPercent)) / 100) * Convert.ToDecimal(ParseValue(txtLYSDQty))).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@LYSDSNFKG", ((Convert.ToDecimal(ParseValue(txtLYSDSNFPercent)) / 100) * Convert.ToDecimal(ParseValue(txtLYSDQty))).ToString("F2"));      //
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfat", ((Convert.ToDecimal(ParseValue(fatPercent)) / 100) * Convert.ToDecimal(ParseValue(qtyDispatched))).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNF", ((Convert.ToDecimal(ParseValue(snfPercent)) / 100) * Convert.ToDecimal(ParseValue(qtyDispatched))).ToString("F2"));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfatperc", ParseValue(fatPercent));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNFperc", ParseValue(snfPercent));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WBOBal", ParseValue(WBOpeningBln));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WBManuf", ParseValue(WbManufacturer));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterqty", ParseValue(WbQty));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterstock", GetTotal(ParseValue(WBOpeningBln), ParseValue(WbManufacturer), ParseValue(WbQty)));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SMPBal", ParseValue(MilkPowderBal));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@SMPManuf", ParseValue(MilkPowderManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderqty", ParseValue(MilkPowderQty));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderstock", GetTotal(ParseValue(MilkPowderBal), ParseValue(MilkPowderManuf), ParseValue(MilkPowderQty)));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPBal", ParseValue(WMPblnc));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WMPManuf", ParseValue(WMPManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderqty", ParseValue(WholeMilkPowderQty));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@WholeMilkPowderstock", GetTotal(ParseValue(WMPblnc), ParseValue(WMPManuf), ParseValue(WholeMilkPowderQty)));

                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@GheeBal", ParseValue(Gheebalnc));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@GheeManuf", ParseValue(GheeManuf));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheeqty", ParseValue(txtGheeQty));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Gheestock",GetTotal(ParseValue(Gheebalnc), ParseValue(GheeManuf), ParseValue(txtGheeQty)));

                    //sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetDate", ParseValue(TargetDate));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetMilk", ParseValue(txtTargetmilk));
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkCumulative", ParseValue(txtMilkCumulative));
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
    public static int GetTotal(string bal, string manf, string Qty)
    {
        return (int.Parse(bal ?? "0")) +
               (int.Parse(manf ?? "0")) +
               (int.Parse(Qty ?? "0"));
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


