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
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkqty", qtyDispatched.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfat",fatKg.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNF", snfKg.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Milkfatperc", (Convert.ToDecimal(fatKg.Text) / Convert.ToInt32(qtyDispatched.Text) * 100).ToString("F2"));
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkSNFperc", (Convert.ToDecimal(snfKg.Text) / Convert.ToInt32(qtyDispatched.Text) * 100).ToString("F2"));
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterqty", WbQty.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Butterstock",Wbstock.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderqty",MilkPowderQty.Text);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@MilkPowderstock",MilkPowderStock.Text);
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
}


