SELECT DATE_TRUNC('week', occurred_at) AS "week",
       COUNT(DISTINCT CASE WHEN user_age > 70 THEN user_id ELSE NULL END) AS "10+ weeks",
       COUNT(DISTINCT CASE WHEN user_age < 70 AND user_age >= 63 THEN user_id ELSE NULL END) AS "9 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 63 AND user_age >= 56 THEN user_id ELSE NULL END) AS "8 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 56 AND user_age >= 49 THEN user_id ELSE NULL END) AS "7 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 49 AND user_age >= 42 THEN user_id ELSE NULL END) AS "6 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 42 AND user_age >= 35 THEN user_id ELSE NULL END) AS "5 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 35 AND user_age >= 28 THEN user_id ELSE NULL END) AS "4 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 28 AND user_age >= 21 THEN user_id ELSE NULL END) AS "3 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 21 AND user_age >= 14 THEN user_id ELSE NULL END) AS "2 weeks",
       COUNT(DISTINCT CASE WHEN user_age < 14 AND user_age >= 7  THEN user_id ELSE NULL END) AS "1 week",
       COUNT(DISTINCT CASE WHEN user_age < 7 THEN user_id ELSE NULL END) AS "Less than a week"
 FROM (
       SELECT events.occurred_at,
              users.user_id,
              EXTRACT('day' FROM '2014-09-01'::TIMESTAMP - users.activated_at) AS user_age
         FROM tutorial.yammer_users users
         JOIN tutorial.yammer_events events
           ON events.user_id = users.user_id
          AND events.event_type = 'engagement'
          AND events.event_name = 'login'
          AND events.occurred_at >= '2014-05-01'
          AND events.occurred_at < '2014-09-01'
        WHERE users.activated_at IS NOT NULL
       ) user_events
 GROUP BY week
 ORDER BY week
 LIMIT 100
