using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Code
/// </summary>
public class Code
{
    public Code()
    {
    }
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
}