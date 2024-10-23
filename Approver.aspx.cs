using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;

public partial class Approver : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            obj.FillGrid(grdApprove, "Usp_GetInflowToAprove", Connstr, divAlert, new[] { "IsApproved" }, new[] { "0" });
            obj.FillGrid(grdApproved, "Usp_GetInflowToAprove", Connstr, divAlert, new[] { "IsApproved" }, new[] { "1" });
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
    protected void grdApprove_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Approve")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                TextBox Row_TxtMilkQty = (TextBox)row.FindControl("TxtMilkQty");

                //TextBox Row_TxtMilkFat = (TextBox)row.FindControl("TxtMilkFatKg");
                //TextBox Row_TxtMilkSNF = (TextBox)row.FindControl("TxtMilkSNFKg");
                TextBox Row_TxtMilkFatPerc = (TextBox)row.FindControl("TxtMilkFatPerc");
                TextBox Row_TxtMilkSNFPerc = (TextBox)row.FindControl("TxtMilkSNFPerc");

                string Row_TxtMilkFat = getPercent(Row_TxtMilkFatPerc.Text, Row_TxtMilkQty.Text).ToString("F2");
                string Row_TxtMilkSNF = getPercent(Row_TxtMilkSNFPerc.Text, Row_TxtMilkQty.Text).ToString("F2");

                TextBox Row_TxtButterQty = (TextBox)row.FindControl("TxtButterQty");
                TextBox Row_TxtButterStck = (TextBox)row.FindControl("TxtButterStck");
                TextBox Row_TxtMilkPwderQty = (TextBox)row.FindControl("TxtMilkPwderQty");
                TextBox Row_TxtMilkPwderStk = (TextBox)row.FindControl("TxtMilkPwderStk");
                TextBox Row_TxtWholeMilkPwderqty = (TextBox)row.FindControl("TxtWholeMilkPwderqty");
                TextBox Row_TxtWholeMilkPwderStk = (TextBox)row.FindControl("TxtWholeMilkPwderStk");
                TextBox Row_TxtGheeqty = (TextBox)row.FindControl("TxtGheeqty");
                TextBox Row_TxtGheeStk = (TextBox)row.FindControl("TxtGheeStk");

                TextBox Row_Txtlysdqty = (TextBox)row.FindControl("Txtlysdqty");
                TextBox Row_TxtLYSDFatPercent = (TextBox)row.FindControl("TxtLYSDFatPercent");
                TextBox Row_TxtLYSDSNFPercent = (TextBox)row.FindControl("TxtLYSDSNFPercent");
                //TextBox Row_TxtLYSDFatKG = (TextBox)row.FindControl("TxtLYSDFatKG");
                //TextBox Row_TxtLYSDSNFKG = (TextBox)row.FindControl("TxtLYSDSNFKG");
               string Row_TxtLYSDFatKG = getPercent(Row_TxtLYSDFatPercent.Text, Row_Txtlysdqty.Text).ToString("F2");
               string Row_TxtLYSDSNFKG = getPercent(Row_TxtLYSDSNFPercent.Text,Row_Txtlysdqty.Text).ToString("F2");



              
                DataSet ds = obj.ByProcedure("Usp_AproveInflow",
                     new[] {
                         "InflowId",
                         "Milkqty",
                         "Milkfat",
                         "MilkSNF",
                         "Milkfatperc",
                         "MilkSNFperc",                    
                         "Butterqty",
                         "Butterstock",
                         "MilkPowderqty",
                         "MilkPowderstock", 
                         "WholeMilkPowderqty"  ,
                         "WholeMilkPowderstock",
                         "Gheeqty",
                         "Gheestock",

                         "lysdqty",   
                         "LYSDFatPercent", 
                         "LYSDSNFPercent",
                         "LYSDFatKG",  
                         "LYSDSNFKG"
                     }, 
                     new[] {
                         e.CommandArgument.ToString(),
                         ParseValue(Row_TxtMilkQty),

                         Row_TxtMilkFat,
                         Row_TxtMilkSNF,
                         (string.IsNullOrEmpty(Row_TxtMilkFatPerc.Text)?"0": Row_TxtMilkFatPerc.Text),
                         (string.IsNullOrEmpty(Row_TxtMilkSNFPerc.Text) ? "0" : Row_TxtMilkSNFPerc.Text), 
                         ParseValue(Row_TxtButterQty),
                         ParseValue(Row_TxtButterStck),
                         ParseValue(Row_TxtMilkPwderQty) ,
                         ParseValue(Row_TxtMilkPwderStk),
                         ParseValue(Row_TxtWholeMilkPwderqty),
                         ParseValue(Row_TxtWholeMilkPwderStk),
                         ParseValue(Row_TxtGheeqty),
                         ParseValue(Row_TxtGheeStk),

                         ParseValue(Row_Txtlysdqty),
                         (string.IsNullOrEmpty(Row_TxtLYSDFatPercent.Text) ? "0" : Row_TxtLYSDFatPercent.Text),
                         (string.IsNullOrEmpty(Row_TxtLYSDSNFPercent.Text) ? "0" : Row_TxtLYSDSNFPercent.Text),
                        Row_TxtLYSDFatKG,
                        Row_TxtLYSDSNFKG
                     }, Connstr);


                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]),divAlert, "bg-success");
                        obj.FillGrid(grdApprove, "Usp_GetInflowToAprove", Connstr, divAlert, new[] { "IsApproved" }, new[] { "0" });
                        obj.FillGrid(grdApproved, "Usp_GetInflowToAprove", Connstr, divAlert, new[] { "IsApproved" }, new[] { "1" });
                    }
                    else
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");
                    }
                }
                else
                {
                    obj.alertmsg("Somthing went wrong", divAlert, "bg-danger");
                }
            }
        }
        catch (Exception ex)
        {

                obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }
    

    protected void CalculateSnfAndFat(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)((TextBox)sender).NamingContainer;
            TextBox TxtMilkFatPerc = (TextBox)row.FindControl("TxtMilkFatPerc");
            TextBox TxtMilkSNFPerc = (TextBox)row.FindControl("TxtMilkSNFPerc");
            TextBox TxtMilkQty = (TextBox)row.FindControl("TxtMilkQty");

            TextBox TxtMilkSNF = (TextBox)row.FindControl("TxtMilkSNF");
            TextBox TxtMilkFat = (TextBox)row.FindControl("TxtMilkFat");

            decimal milkQty = decimal.Parse(TxtMilkQty.Text);
            decimal milkSNFPerc = decimal.Parse(TxtMilkSNFPerc.Text);
            decimal milkFatPerc = decimal.Parse(TxtMilkFatPerc.Text);

            decimal milkSNF = (milkQty * milkSNFPerc) / 100;
            decimal milkFat = (milkQty * milkFatPerc) / 100;
            TxtMilkSNF.Text = milkSNF.ToString();
            TxtMilkFat.Text = milkFat.ToString();
        }
        catch (Exception ex)
        {

            obj.alertmsg(ex.Message,divAlert, "bg-danger");
        }

    }
}