using System.Data.OleDb;
using System.Configuration;

/// <summary>
/// ConDB 的摘要说明
/// </summary>
public class ConDB
{
    public ConDB()
    {

        // TODO: 在此处添加构造函数逻辑
        //
    }

    //public static SqlConnection getConnection(int i)
    //{
    //    return new SqlConnection(ConfigurationManager.ConnectionStrings["blogConnectionString"].ConnectionString);
    //}

    public static OleDbConnection getConnection()
    {
        string connstring = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("~/App_Data/cs2010.aspx") + ";Persist Security Info=False";
        //connstring = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath(ConfigurationManager.ConnectionStrings["blogMdbPath"].ConnectionString) + ";Persist Security Info=False";

        return new OleDbConnection(connstring);
    }
}
