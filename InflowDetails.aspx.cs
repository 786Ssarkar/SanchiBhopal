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
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        Fillddl(DddlUnit, "Usp_GetUnit");
            
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
        divAlert.InnerHtml += sb.ToString();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DataSet ds = new DataSet();
            using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("usp_AddInFlow", Connstr))
            {
                sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Date", Txtdate.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@UnitID", DddlUnit.SelectedValue);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkqty", qtyDispatched.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfat", ((Convert.ToDecimal(fatPercent.Text) / 100) * Convert.ToDecimal(qtyDispatched.Text)).ToString("F2"));
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNF", ((Convert.ToDecimal(snfPercent.Text) /100)* Convert.ToDecimal(qtyDispatched.Text)).ToString("F2"));
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfatperc", fatPercent.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNFperc", snfPercent.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterqty", WbQty.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterstock", Wbstock.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderqty", MilkPowderQty.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderstock", MilkPowderStock.Text);
                sqlDataAdapter.Fill(ds);
            }
            if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");


                }
                else
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-danger");
                }

            }
        }
    }
    public void Fillddl(DropDownList ddl, string proc)
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
                alertmsg("Table is Empty", "bg-warning");
            }
            ddl.Items.Insert(0, new ListItem("--Select--", ""));
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
}


