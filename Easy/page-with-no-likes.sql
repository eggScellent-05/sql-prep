--use disintct only if page_id in pages are not unique
select distinct p.page_id 
from pages p left join page_likes pl
on p.page_id = pl.page_id
where pl.page_id is NULL
order by p.page_id;

-- or 

-- SELECT DISTINCT p.page_id
-- FROM pages p
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM page_likes pl
--     WHERE pl.page_id = p.page_id
-- )
-- ORDER BY p.page_id;