using System.Configuration;

/// <summary>
/// SetTitle 的摘要说明
/// </summary>
public class SetTitle
{
	public SetTitle()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static string getTitle()
    {
        return ConfigurationManager.AppSettings["title"].ToString();
    }
}
