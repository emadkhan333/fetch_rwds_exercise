
SELECT
  r.rewards_receipt_status   AS status,
  SUM(r.purchased_item_count) AS total_items
FROM fact_receipt r
WHERE r.rewards_receipt_status IN ('Accepted','Rejected')
GROUP BY r.rewards_receipt_status
ORDER BY total_items DESC;
