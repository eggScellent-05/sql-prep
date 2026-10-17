
--don't make assumptions like null or duplicates

with songs_cte as (
  select user_id,song_id,count(*) as song_plays
  from songs_weekly
  where listen_time<'2022-08-05'
  group by user_id, song_id
  
  UNION ALL

  select user_id, song_id, song_plays
  from songs_history
)



select user_id,song_id,sum(song_plays) as total_plays from songs_cte
group by user_id,song_id
order by total_plays desc;