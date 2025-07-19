
SELECT
  r.rewards_receipt_status   AS status,
  AVG(r.total_spent)         AS avg_spend
FROM fact_receipt r
WHERE r.rewards_receipt_status IN ('Accepted','Rejected')
GROUP BY r.rewards_receipt_status
ORDER BY avg_spend DESC;
