select name,yyear,mmonth,dday ,avg(arr_delay+dep_delay+carrier_delay+weather_delay+security_delay+late_aircraft_delay) as d
FROM flight_data f INNER JOIN airports a ON (f.origin=a.code)
where
date(concat(yyear,"-",mmonth,"-",dday)) >= (select date_sub(date(concat(max(yyear),"-",max(mmonth),"-",max(dday))), interval 7 day) from flight_data) 
group by name,yyear,mmonth,dday
having avg(arr_delay+dep_delay+carrier_delay+weather_delay+security_delay+late_aircraft_delay) > 0