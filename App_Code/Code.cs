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
}