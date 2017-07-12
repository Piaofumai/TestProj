if exists (select * from sysobjects where name = 'bob_article_view')
      drop view bob_article_view 


if exists (select * from sysobjects where name = 'bob_class_view')
      drop view bob_class_view


go 


--��������--�����������ڵķ������������µ�������


create view bob_article_view
as
select a.*,c.cname,cmt.countcomment from bob_article a
inner join bob_class c on a.cid=c.cid 
left join (select a.aid,count(c.comid) as countcomment from bob_article a 
left join bob_comment c on a.aid=c.aid group by a.aid) cmt on a.aid=cmt.aid

go


--������Ϣ���Լ�ÿ�������µ�������
create view bob_class_view
as
select c.*,a.articlecount as articlecount from bob_class c
inner join (select c.cid,count(a.cid) articlecount from bob_class c
left join bob_article a on c.cid=a.cid group by c.cid) a on c.cid=a.cid

