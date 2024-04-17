CREATE USER djuser WITH PASSWORD 'pM0dF3r21.';
CREATE DATABASE searchengine WITH OWNER djuser ENCODING 'utf-8';
GRANT ALL PRIVILEGES ON DATABASE searchengine to djuser;

SELECT * FROM settings_keyword;
SELECT * FROM front_searchresult WHERE keywd_id IS NOT NULL;
SELECT * FROM front_searchresult WHERE keywd_id IS NULL;
SELECT * FROM front_searchresult;
SELECT domain, count(url) x FROM front_searchresult GROUP BY domain ORDER BY x DESC;

SELECT * FROM settings_keyword;
SELECT count(*), sentiment FROM front_searchresult GROUP BY sentiment;
SELECT * FROM front_searchresult WHERE created_at > NOW() - '1 HOUR'::INTERVAL;;
SELECT * FROM front_searchresult WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 WEEK);
SELECT * FROM front_searchresult WHERE created_at > NOW() - '1 WEEK'::INTERVAL;
SELECT * FROM front_searchresult WHERE created_at > NOW() - '2 WEEK'::INTERVAL;
SELECT * FROM front_searchresult WHERE created_at > NOW() - '3 WEEK'::INTERVAL;
SELECT * FROM front_searchresult WHERE created_at > NOW() - '4 WEEK'::INTERVAL;
SELECT * FROM front_searchresult WHERE created_at > NOW() - '5 WEEK'::INTERVAL;

SearchResult.objects.values('sentiment').annotate(total=Count('id')).order_by();
UPDATE front_searchresult SET created_at = '2015-03-18 13:50:45' WHERE keyword = 'xpheria';
UPDATE front_searchresult SET created_at = '2015-03-12 13:50:45' WHERE keyword = 'monkey';
UPDATE front_searchresult SET created_at = '2015-03-5 13:50:45' WHERE keyword = 'elephant';


SELECT * FROM  front_searchresult WHERE keywd_id = 10;
UPDATE front_searchresult SET created_at = '2015-03-18 13:50:45' WHERE keywd_id = 10;
[{'total': 6, 'sentiment': 1}, {'total': 3, 'sentiment': 2}, {'total': 3, 'sentiment': 3}, {'total': 2, 'sentiment': 0}]
;
SELECT count(*), result_type FROM front_searchresult GROUP BY result_type;

-- top negative content
SELECT count(id), result_type FROM front_searchresult GROUP BY result_type;
SELECT COUNT(id) quantity, url FROM front_searchresult GROUP BY url ORDER BY quantity DESC;
SELECT COUNT(id) quantity, url FROM front_searchresult WHERE sentiment = '1' GROUP BY url ORDER BY quantity DESC;

SELECT COUNT(id) AS quantity, url, sentiment 
FROM front_searchresult WHERE sentiment = '2' 
GROUP BY url, sentiment ORDER BY quantity DESC;

SELECT * FROM front_searchresult WHERE created_at > NOW() - '1 WEEK'::INTERVAL;

SELECT * FROM front_searchresult 
WHERE created_at BETWEEN (NOW() - '2 WEEK'::INTERVAL) AND (NOW() - '1 WEEK'::INTERVAL);
           
SELECT * FROM settings_keywordcategory;


