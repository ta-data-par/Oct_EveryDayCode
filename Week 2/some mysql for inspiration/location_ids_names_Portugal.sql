select l.type, 
(case
when (l.type = 'area') then l.id
end) as last_area_id,
(case
when (l.type = 'area') then l.name_en
end) as last_area_name,
(case
when (l.type = 'area') then l.parent_id
when (l.type = 'region') then l.id
end) as last_region_id,
(case
when (l.type = 'area') then l2.name_en
when (l.type = 'region') then l.name_en
end) as last_region_name,
(case
when (l.type = 'area') then l2.parent_id
when (l.type = 'region') then l.parent_id
when (l.type = 'province') then l.id
end) as last_province_id,
(case
when (l.type = 'area') then l3.name_en
when (l.type = 'region') then l2.name_en
when (l.type = 'province') then l.name_en
end) as last_province_id
from locations l inner join locations l2 on l2.id = l.parent_id
inner join locations l3 on l3.id = l2.parent_id
where (case
when (l.type = 'area') then l3.parent_id
when (l.type = 'region') then l2.parent_id
when (l.type = 'province') then l.parent_id
end)=499;
