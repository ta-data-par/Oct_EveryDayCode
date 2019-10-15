#### Step 1: Calculate the royalties of each sales for each author
SELECT ta.title_id, ta.au_id, (ti.price * sales.qty * ti.royalty / 100 * ta.royaltyper / 100) as RoyPerSale
from titleauthor ta
inner join titles ti on ta.title_id = ti.title_id
inner join sales on ti.title_id=sales.title_id;

create temporary table RoyPerSaleTable
SELECT ta.title_id, ta.au_id, (ti.price * sales.qty * ti.royalty / 100 * ta.royaltyper / 100) as RoyPerSale
from titleauthor ta
inner join titles ti on ta.title_id = ti.title_id
inner join sales on ti.title_id=sales.title_id;

#### Step 2: Aggregate the total royalties for each title for each author
Select title_id, au_id, sum(RoyPerSale) as RoyalSum
from RoyPerSaleTable
group by title_id, au_id
;

create temporary table RoyPerSaleTableV2
Select title_id, au_id, sum(RoyPerSale) as RoyalSum
from RoyPerSaleTable
group by title_id, au_id
;

### Step 3: Calculate the total profits of each author
select r.au_id, (r.RoyalSum + (ta.royaltyper/100)*(ti.advance)) as TotalProfits
from RoyPerSaleTableV2 r
inner join titles ti on r.title_id = ti.title_id
inner join titleauthor ta on r.au_id=ta.au_id
order by TotalProfits desc
limit 3;

## Challenge 2 - Alternative Solution
### DERIVED TABLES

select r.au_id, (r.RoyalSum + (ta.royaltyper/100)*(ti.advance)) as TotalProfits
from (
Select title_id, au_id, sum(RoyPerSale) as RoyalSum
from (
SELECT ta.title_id, ta.au_id, (ti.price * sales.qty * ti.royalty / 100 * ta.royaltyper / 100) as RoyPerSale
from titleauthor ta
inner join titles ti on ta.title_id = ti.title_id
inner join sales on ti.title_id=sales.title_id)
 as RoyPerSaleTable
group by title_id, au_id
) as r
inner join titles ti on r.title_id = ti.title_id
inner join titleauthor ta on r.au_id=ta.au_id
order by TotalProfits desc
limit 3;

## Challenge 3 : creating a permanent table named most_profiting_authors
create table most_profiting_authors
select r.au_id, (r.RoyalSum + (ta.royaltyper/100)*(ti.advance)) as TotalProfits
from RoyPerSaleTableV2 r
inner join titles ti on r.title_id = ti.title_id
inner join titleauthor ta on r.au_id=ta.au_id
order by TotalProfits desc
limit 3;