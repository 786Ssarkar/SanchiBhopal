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
    //Code by = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            ViewState["Category"] = null;
        }
    }
    protected void btnMilk_Click(object sender, EventArgs e)
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
    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
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
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append("alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();
    }

    //protected void txt_TextChanged(object sender, EventArgs e)
    //{
    //    int total = 0;
    //    foreach (GridViewRow row in grdProduct.Rows)
    //    {
    //        if (row.RowType == DataControlRowType.DataRow)
    //        {
    //            TextBox qty = (TextBox)row.FindControl("txtQty");
    //            total += int.Parse(qty.Text);
    //        }
    //    }
    //    grdProduct.FooterRow.Cells[0].Text = "Totel";
    //    grdProduct.FooterRow.Cells[1].Text = total.ToString();
    //}

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["Category"] != null)
        {

            if (ViewState["Category"].ToString() == "Milk")
            {
                //by.ByProcedure(string proc, string[] parm, string[] parmValues, string constr)
            }
        }
    }

    protected void btnProduct_Click(object sender, EventArgs e)
    {

    }
}