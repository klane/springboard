SELECT DATE_TRUNC('week', occurred_at) AS week,
       COUNT(DISTINCT user_id) AS weekly_active_users
  FROM tutorial.yammer_events
 WHERE event_type = 'engagement'
   AND event_name = 'login'
 GROUP BY week
 ORDER BY week
