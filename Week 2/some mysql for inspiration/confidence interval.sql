select source_id,mean_new+1.8*std_new as up_bound, (case when mean_new-1.8*std_new>0 then mean_new-1.8*std_new else 0 end) as low_bound
from
(select source_id, avg(num) as mean_new, std(num)as std_new #gets mean and std of number of new listings during the month per source_id
from
(select source_id,alert_date,count(type) as num #get the numbers of new listings by source_id and date in a period
from alerts_notifications
where type='new'
and date(alert_date) between date('2018-05-01') and date('2018-06-01')
group by source_id,alert_date) as new
group by source_id) as mean_std
where source_id=1310
group by source_id