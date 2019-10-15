select source_id, company, contacts, description
from source_estates 
where company like "%1963%"
;

select lcase(se.company)
    from source_estates se
    where status not in ("hold","sold") and rent_status not in ("hold","rented")
    group by se.company;
    
select group_concat(se.id),s.id,s.name,lcase(se.company)
    from source_estates se
    inner join sources s on se.source_id=s.id
    where se.status not in ("hold","sold") and se.rent_status not in ("hold","rented") and se.company is not null and se.company !=""
    group by s.id, s.name, lcase(se.company);
    
    
#table with new listings per date and source_id
create temporary table IF NOT EXISTS main (
se_id int(10) not null,
s_id int(10) not null,
s_name char(100),
se_company char(100),
se_location_id int(10),
KEY `key1` (`se_id`));

insert into main(se_id,s_id,s_name,se_company,se_location_id)
select se.id,s.id,s.name,lcase(se.company),se.location_id
from source_estates se
inner join sources s on se.source_id=s.id
where se.status not in ("hold","sold") and se.rent_status not in ("hold","rented") and se.company is not null and se.company !="";

select group_concat(se_id),s_id,s_name,lcase(se_company) as lc
from main
group by s_id, s_name, lc
order by lc;

select se_id,se_location_id
from main;


create temporary table IF NOT EXISTS main (
se_id int(10) not null,
s_id int(10) not null,
s_name char(100),
se_company char(100),
lc int(10),
KEY `key1` (`se_id`));

insert into main(se_id,s_id,s_name,se_company,lc)
select se.id,s.id,s.name,lcase(se.company) as lc,se.location_id
from source_estates se
inner join sources s on se.source_id=s.id
where se.status not in ("hold","sold") and se.rent_status not in ("hold","rented") and se.company is not null and se.company !="";

select group_concat(se_id),s_id,s_name, lc
from main
group by s_id, s_name, lc
order by lc;
