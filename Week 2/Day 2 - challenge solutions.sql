select au_id, sum(ssr) + sum(sales_advance) total_profit
from
(select title_id,au_id,sum(sales_royalty) as ssr, sales_advance
from
(select ta.title_id, ta.au_id, t.price*s.qty*t.royalty*ta.royaltyper/10000 as sales_royalty, t.advance*ta.royaltyper/100 as sales_advance
from titleauthor ta
inner join titles t on t.title_id=ta.title_id
inner join sales s on s.title_id=ta.title_id
order by ta.title_id, ta.au_id) new_temporary
group by title_id,au_id) second_temporary
group by au_id
order by total_profit desc;

create temporary table new_temp(
select ta.title_id, ta.au_id, t.price*s.qty*t.royalty*ta.royaltyper/10000 as sales_royalty, t.advance*ta.royaltyper/100 as sales_advance
from titleauthor ta
inner join titles t on t.title_id=ta.title_id
inner join sales s on s.title_id=ta.title_id
order by ta.title_id, ta.au_id);

create temporary table second_temp
(select title_id,au_id,sum(sales_royalty) as ssr, sales_advance
from
new_temp
group by title_id,au_id);
select au_id, sum(ssr+sales_advance) total_profit
from second_temp
group by au_id
order by total_profit desc;

create table new_table(
select au_id, sum(ssr+sales_advance) total_profit
from second_temp
group by au_id
order by total_profit desc)