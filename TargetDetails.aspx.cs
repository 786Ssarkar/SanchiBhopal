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


public partial class TargetDetails : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            divAlert.InnerHtml = "";
            FS_Details.Visible = false;
            DateTime SelectedDate = DateTime.Now;
            obj.FillGrid(grdTargate, "usp_GetTarget", Connstr, divAlert, new[] { "@FromDate", "@ToDate" },
               new[] { FromTxtdate.Text, ToTxtdate.Text });

            if (SelectedDate.Day >= 1 && SelectedDate.Day <= 10)
            {
                BtnAdd.Enabled = true;
                BtnSubmit.Enabled = true;

            }
            else
            {
                ///else block  for Data Entry  only 
                BtnAdd.Enabled = true;
                BtnSubmit.Enabled = true;
            }


        }

    }

    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml = sb.ToString();

    }


    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    {
        try
        {
            grd.DataSource = null;
            grd.DataBind();
            SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            adpt.SelectCommand.Parameters.Clear();
            if (prm.Length != 0 && values.Length != 0)
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
                    ds.Tables[0].Columns.Add("TargetData", typeof(int));
                    ds.Tables[0].Columns.Add("SaleCumulative", typeof(int));
                    ds.Tables[0].Columns.Add("SaleAbsolute", typeof(int));
                    ds.Tables[0].Columns.Add("AvgGrowthPer", typeof(int));
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



    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            if (DdlItemCat.SelectedValue != "")
            {
                FillGrid(grdItems, "GetItemsByCategory", new[] { "@ItemCategory" }, new[] { DdlItemCat.SelectedValue });
                //obj.FillGrid(grdItems, "GetItemsByCategory", Connstr, divAlert, new[] { "@ItemCategory" }, new[] { DdlItemCat.SelectedValue });
                FS_Details.Visible = true;
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, "bg-danger");
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                DataTable dtItems = new DataTable();

                dtItems.Columns.Add("ItemID", typeof(string));
                dtItems.Columns.Add("ItemName", typeof(string));
                dtItems.Columns.Add("TargetData", typeof(decimal));
                dtItems.Columns.Add("SaleCumulative", typeof(decimal));
                dtItems.Columns.Add("SaleAbsolute", typeof(decimal));
                dtItems.Columns.Add("AvgGrowthPer", typeof(decimal));

                decimal totalTarget = 0;
                decimal totalCumulative = 0;
                decimal totalAbsolute = 0;
                decimal totalAvgGrowth = 0;

                foreach (GridViewRow row in grdItems.Rows)
                {
                    DataRow dr = dtItems.NewRow();
                    dr["ItemId"] = ((HiddenField)row.FindControl("lblItemId")).Value;
                    dr["ItemName"] = ((Label)row.FindControl("lblItemName")).Text;

                    dr["TargetData"] = ParseValue(((TextBox)row.FindControl("txtTarget")));
                    dr["SaleCumulative"] = ParseValue(((TextBox)row.FindControl("txtCumulative")));
                    dr["SaleAbsolute"] = ParseValue(((TextBox)row.FindControl("txtAchieved")));
                    dr["AvgGrowthPer"] = ParseValue(((TextBox)row.FindControl("txtPerc")));

                    totalTarget += (decimal)dr["TargetData"];
                    totalCumulative += (decimal)dr["SaleCumulative"];
                    totalAbsolute += (decimal)dr["SaleAbsolute"];
                    totalAvgGrowth += (decimal)dr["AvgGrowthPer"];

                    dtItems.Rows.Add(dr);
                }

                DataSet ds = new DataSet();
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddTarget", Connstr))
                {
                    if (BtnSubmit.Text == "Update")
                    {
                        sqlDataAdapter.SelectCommand.CommandText = "Usp_UpdateTarget";
                        sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetId", ViewState["TargetId"].ToString());
                    }
                    sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Targetmonth", Txtdate.Text);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@ItemCategory", DdlItemCat.SelectedValue);
                    sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@TargetItems", dtItems);
    
                    sqlDataAdapter.Fill(ds);
                }

                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                        grdItems.DataSource = null;
                        grdItems.DataBind();
                        FS_Details.Visible = false;
                        obj.FillGrid(grdTargate, "usp_GetTarget", Connstr, divAlert, new[] { "@FromDate", "@ToDate" }, new[] { FromTxtdate.Text, ToTxtdate.Text });
                        BtnSubmit.Text = "Submit";

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
    protected void grdTargate_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName == "EditData")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                Label lblTargetmonth = (Label)row.FindControl("lblTargetmonth");
                Label lblItemCategory = (Label)row.FindControl("lblItemCategory");
                Label lblTotalTarget = (Label)row.FindControl("lblTotalTarget");
                ViewState["TargetId"] = e.CommandArgument;
                Txtdate.Text = DateTime.Parse(lblTargetmonth.Text).ToString("yyyy-MM-dd");
                DdlItemCat.ClearSelection();
                DdlItemCat.Items.FindByValue(lblItemCategory.Text).Selected = true;
                DataSet ds = obj.ByProcedure("Usp_GetTargetItems", new[] { "TargetId" }, new[] { e.CommandArgument.ToString() }, Connstr);
                if (ds.Tables.Count > 1)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
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
                DataSet ds = obj.ByProcedure("Usp_DeleteTarget", new[] { "TargetId" }, new[] { e.CommandArgument.ToString() }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grdTargate, "usp_GetTarget", Connstr, divAlert, new[] { "@FromDate", "@ToDate" }, new[] { FromTxtdate.Text, ToTxtdate.Text });
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        obj.FillGrid(grdTargate, "usp_GetTarget", Connstr, divAlert, new[] { "@FromDate", "@ToDate" },
               new[] { FromTxtdate.Text, ToTxtdate.Text });

    }
}
