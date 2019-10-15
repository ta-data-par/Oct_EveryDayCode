use publications;
select au_lname,au_fname,city
from authors;
select distinct city
from authors;
select count(*) as number_of_rows
from authors;
select count(*) as 'number of rows'
from authors;
select count(distinct city)
from authors;
select *
from authors;
select count(distinct contract)
from authors;
select count(*) as number_of_rows, contract
from authors
group by contract;
select *
from authors;
select count(*) as number_of_rows, max(zip) ,contract
from authors
group by contract;
select *
from authors
where city is not null
order by city;
select *
from authors
where city is not null
order by city desc;
select *
from authors
where city is not null
order by city
limit 1;
select count(title),pub_id
from titles
group by pub_id;
select pub_name,count(title_id)
from publishers
inner join titles 
on publishers.pub_id=titles.pub_id
group by titles.pub_id;
select pub_name,count(title_id)
from publishers p
left join titles t
on p.pub_id=t.pub_id
group by p.pub_id;
select  t.title, sum(qty),t.price, sum(qty)*t.price as revenue, t.type
from sales s
right join titles t on t.title_id=s.title_id
group by t.title_id;
select *
from employee e
right join jobs j on e.job_id=j.job_id
left join jobs j1 on e.job_id=j1.job_id;
select *
from employee e
right join jobs j on e.job_id=j.job_id
union
select *
from employee e
left join jobs j on e.job_id=j.job_id;
