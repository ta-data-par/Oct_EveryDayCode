select * from insurance.loan;

SELECT 
    title,
    ROUND(num_of_books * price / num_of_shops, 2) AS avg_revenue_per_shop,
    stor_ids
FROM
    (SELECT 
        t.title,
            SUM(qty) num_of_books,
            COUNT(DISTINCT stor_id) num_of_shops,
            price,
            GROUP_CONCAT(DISTINCT stor_id) stor_ids
    FROM
        sales s
    INNER JOIN titles t ON t.title_id = s.title_id
    GROUP BY t.title) new_table;
    
    
    
select title,price,stor_name, a.au_lname
from (
select t.title_id,t.title, t.price,st.stor_name, st.city, st.zip, st.state
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores st on st.stor_id=s.stor_id
where t.type='business') new_table
inner join titleauthor ta on ta.title_id=new_table.title_id
inner join authors a on a.au_id=ta.au_id
where new_table.zip=a.zip or new_table.city=a.city or new_table.state=a.state;

create temporary table if not exists store_title_address(
select t.title_id,t.title, t.price,st.stor_name, st.city, st.zip, st.state
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores st on st.stor_id=s.stor_id
where t.type='business');

select * from store_title_address;

create table if not exists store_title_address(
select t.title_id,t.title, t.price,st.stor_name, st.city, st.zip, st.state
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores st on st.stor_id=s.stor_id
where t.type='business');