if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_bob_comment_bob_article]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[bob_comment] DROP CONSTRAINT FK_bob_comment_bob_article
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_bob_article_bob_class]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[bob_article] DROP CONSTRAINT FK_bob_article_bob_class
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_article_view]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bob_article_view]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_class_view]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bob_class_view]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_admin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bob_admin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_article]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bob_article]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bob_class]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_comment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bob_comment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bob_pop]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bob_pop]
GO

CREATE TABLE [dbo].[bob_admin] (
	[admin_id] [int] IDENTITY (1, 1) NOT NULL ,
	[admin_name] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[admin_pwd] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bob_article] (
	[aid] [int] IDENTITY (1, 1) NOT NULL ,
	[cid] [int] NOT NULL ,
	[title] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[content] [text] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[posttime] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[bob_class] (
	[cid] [int] IDENTITY (1, 1) NOT NULL ,
	[cname] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[description] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bob_comment] (
	[comid] [int] IDENTITY (1, 1) NOT NULL ,
	[aid] [int] NOT NULL ,
	[comment] [text] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[cposttime] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[bob_pop] (
	[pid] [int] IDENTITY (1, 1) NOT NULL ,
	[pname] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[pmail] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[pcontent] [text] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[posttime] [datetime] NULL ,
	[sex] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[adminRev] [text] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--分类信息，以及每个分类下的文章数
create view bob_class_view
as
select c.*,a.articlecount as articlecount from bob_class c
inner join (select c.cid,count(a.cid) articlecount from bob_class c
left join bob_article a on c.cid=a.cid group by c.cid) a on c.cid=a.cid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--文章所有--包括文章所在的分类名，和文章的评论数


create view bob_article_view
as
select a.*,c.cname,cmt.countcomment from bob_article a
inner join bob_class c on a.cid=c.cid 
left join (select a.aid,count(c.comid) as countcomment from bob_article a 
left join bob_comment c on a.aid=c.aid group by a.aid) cmt on a.aid=cmt.aid


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

