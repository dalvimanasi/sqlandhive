SELECT name,yyear, mmonth,sum(arr_delay+dep_delay+carrier_delay+weather_delay+security_delay+late_aircraft_delay) as delay, 
count(*) as delayedflightstillnow
FROM flight_data f
   INNER JOIN airports a
   ON (f.origin=a.code)
GROUP BY
   name
Order by delayedflightstillnow desc 