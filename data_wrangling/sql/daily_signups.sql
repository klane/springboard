SELECT DATE_TRUNC('day', created_at) AS day,
       COUNT(*) AS all_users,
       COUNT(CASE WHEN state = 'active' THEN user_id ELSE NULL END) AS activated_users
  FROM tutorial.yammer_users
 WHERE created_at >= '2014-06-01'
   AND created_at < '2014-09-01'
 GROUP BY day
 ORDER BY day
