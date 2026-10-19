SELECT 
round(100.0*COUNT(*) FILTER (WHERE caller.country_id<>receiver.country_id )/count(*),1) as international_calls_pct
-- round(100.0*count(case WHEN caller.country_id<>receiver.country_id then 1 END)/count(*),1) as international_calls_pct
FROM phone_calls pc 
join phone_info caller on pc.caller_id = caller.caller_id
join phone_info receiver on pc.receiver_id = receiver.caller_id;


--joined and compared whether the country_id of the caller and the reciever is matching.