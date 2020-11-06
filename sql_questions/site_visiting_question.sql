select
	sum(if(promotion_code is null then 0 else number_of_visitors))* 100.0 / sum(number_of_visitors)
from
	site_visitors as sv
left join promotion_dates as pd on
	sv.date >= pd.start_date
	and sv.date <= pd.end_date