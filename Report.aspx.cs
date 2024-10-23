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
using System.IO;

public partial class Report : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
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
        divAlert.InnerHtml = sb.ToString();

    }

    public void FillGrid(GridView grd, string proc, string[] prm = null, string[] values = null)
    {
        try
        {
            using (SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr))
            {
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

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    grd.DataSource = ds.Tables[0];
                    grd.DataBind();
                }
                else
                {
                    alertmsg("Table is Empty", "bg-warning");
                }
            }
        }
        catch (Exception ex)
        {
            alertmsg(ex.Message, "bg-danger");
        }
    }






    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGrid(grdItems, "uspTransReport", new[] { "FromDate", "ToDate" },
               new[] { FromTxtdate.Text, ToTxtdate.Text });


        //DateTime fromDateValue;
        //DateTime toDateValue;
        //if (DateTime.TryParse(FromTxtdate.Text, out fromDateValue) &&
        //    DateTime.TryParse(ToTxtdate.Text, out toDateValue))
        //{
            
        //    string[] prm = { "@FromDate", "@ToDate" };
        //    string[] values = { fromDateValue.ToString("yyyy-MM-dd"), toDateValue.ToString("yyyy-MM-dd") };

            
        //    FillGrid(grdItems, "uspTransReport", prm, values);
        //}
        //else
        //{
        //    alertmsg("Invalid date format. Please enter valid dates.", "bg-warning");
        //}
    }
}


    
