SELECT DATE_TRUNC('week', occurred_at) AS week,
       COUNT(CASE WHEN action = 'sent_weekly_digest' THEN user_id ELSE NULL END) AS weekly_emails,
       COUNT(CASE WHEN action = 'sent_reengagement_email' THEN user_id ELSE NULL END) AS reengagement_emails,
       COUNT(CASE WHEN action = 'email_open' THEN user_id ELSE NULL END) AS email_opens,
       COUNT(CASE WHEN action = 'email_clickthrough' THEN user_id ELSE NULL END) AS email_clickthroughs
  FROM tutorial.yammer_emails
 GROUP BY week
 ORDER BY week
