using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Text;

/// <summary>
/// Summary description for Code
/// </summary>
public class Code
{
    public DataSet ByProcedure(string proc, string[] parm, string[] parmValues, string constr)
    {
        DataSet dataSet = new DataSet();
        using (SqlConnection connection = new SqlConnection(constr))
        {
            using (SqlCommand sqlCommand = new SqlCommand(proc, connection))
            {
                sqlCommand.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < parm.Length; i++)
                {
                    sqlCommand.Parameters.AddWithValue("@" + parm[i], parmValues[i]);
                }

                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand))
                {
                    sqlDataAdapter.Fill(dataSet);
                    return dataSet;
                }
            }
        }

    }
    public void ClearControl(Control control)
    {
        // Check the type of control and clear it accordingly
        if (control is TextBox)
        {
            ((TextBox)control).Text = string.Empty;
        }
        else if (control is DropDownList)
        {
            ((DropDownList)control).SelectedIndex = 0; // Reset to default
        }
        else if (control.HasControls())
        {
            // If the control has child controls, recursively clear them
            foreach (Control childControl in control.Controls)
            {
                ClearControl(childControl);
            }
        }
    }
    public void clearFields(HtmlForm form)
    {
        foreach (Control c in form.Controls)
        {
            ClearControl(c);
        }
    }
    public void alertmsg(string msg, HtmlGenericControl div, string bgcolor)
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
        div.InnerHtml = sb.ToString();

    }
    public void FillGrid(GridView grd, string proc, string ConnStr, HtmlGenericControl alertdiv, string[] prm = null, string[] values = null )
    {                                                                                                         
        try
        {
            grd.DataSource = null;
            grd.DataBind();

            SqlDataAdapter adpt = new SqlDataAdapter(proc, ConnStr);
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
                }
                else
                {
                    alertmsg("Table is Empty", alertdiv, "bg-warning");
                }
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), alertdiv, "bg-warning");

                }
            }
            else
            {
                alertmsg("Somthing went wrong", alertdiv, "bg-warning");
            }
        }
        catch (Exception ex)
        {

            alertmsg(ex.Message, alertdiv, "bg-danger");
        }


    }
}