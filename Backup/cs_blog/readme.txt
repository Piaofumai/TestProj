单用户Blog程序源码(Asp.net2.0、Access数据库)
开发工具:VS2008,FrameWork框架使用2.0


根据钱豹单用户Blog程序源码修改,主要修改内容如下

1.编缉器改用FckEditor(主要由于在使用原版的过程中发现发布网站后浏览不了,所以自已根据程序修改了个新版本)
2.去除原来使用dotnetTextBox控件
3.去除每个CS文件中未使用的类空间,加快执行效率
4.修改SQL语句执行页添加在执行SELECT语句时显示查询结果功能
5.修改留言发布未添加日期(原版本在数据库中设置时间为now())功能
6.修改发表新文章添加日期(在CS代码中添加)
6.修改发表评论添加日期(在CS代码中添加)

采用面向对象开发，页面简洁（采用Div+CSS构建）
采用了Asp.net2.0中的模板，数据库采用Access，密码采用32位md5加密

默认管理帐号密码均为51aspx

App_Data下的cs2010.aspx为数据库文件，
cs_chen.mdb为原始MDB数据库文件(无用户)


作者BLOG:
http://chenzz.cnblogs.com
http://chen2008.spaces.live.com
源码下载及讨论地址：http://www.51aspx.com/CV/SingleBlog

