#joining
SELECT a.au_id, a.au_lname, a.au_fname, ti.title, p.pub_name
  FROM authors a 
  inner join titleauthor ta on a.au_id=ta.au_id
  inner join titles ti on ti.title_id=ta.title_id
  inner join publishers p on p.pub_id=ti.pub_id;
  
#counting nb of publications by author in each publisher
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(ti.title) as nbpub
  FROM authors a 
  inner join titleauthor ta on a.au_id=ta.au_id
  inner join titles ti on ti.title_id=ta.title_id
  inner join publishers p on p.pub_id=ti.pub_id
  group by a.au_id, p.pub_name
  order by nbpub desc;
  
#CHALLENGE 3 :nb of sales 
SELECT a.au_id, a.au_lname, a.au_fname, sum(ti.ytd_sales) as TOTAL
  FROM authors a 
  inner join titleauthor ta on a.au_id=ta.au_id
  inner join titles ti on ti.title_id=ta.title_id
  group by ti.title
  order by TOTAL desc
  limit 3
  ;

#CHALLENGE 4
SELECT a.au_id, a.au_lname, a.au_fname, ifnull(sum(ti.ytd_sales),0) as TOTAL
  FROM authors a 
  inner join titleauthor ta on a.au_id=ta.au_id
  inner join titles ti on ti.title_id=ta.title_id
  group by ti.title
  order by TOTAL desc
  ;
  
  #BOOOONUS:
  SELECT a.au_id, a.au_lname, a.au_fname, 
  ((ta.royaltyper/100)*(ti.advance+((ti.royalty/100)*(sales.qty*ti.price)))) as PROFIT
  FROM authors a 
  inner join titleauthor ta on a.au_id=ta.au_id
  inner join titles ti on ti.title_id=ta.title_id
  inner join sales on ti.title_id=sales.title_id
  group by a.au_id, ti.title_id
  order by PROFIT desc
  ;
  # 
  
