
WITH recent_users AS (
  SELECT user_id
  FROM dim_user
  WHERE created_date >= CURRENT_DATE - INTERVAL '6 months'
)
SELECT
  b.name                       AS brand_name,
  COUNT(DISTINCT r.receipt_id) AS transactions_count
FROM fact_receipt r
JOIN fact_receipt_item i
  ON r.receipt_id = i.receipt_id
JOIN dim_brand b
  ON i.barcode = b.barcode
JOIN recent_users u
  ON r.user_id = u.user_id
GROUP BY b.name
ORDER BY transactions_count DESC
LIMIT 1;
