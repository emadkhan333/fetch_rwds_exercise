WITH last_month AS (
  SELECT date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AS month_start
)
SELECT
  b.name                       AS brand_name,
  COUNT(DISTINCT r.receipt_id) AS receipts_count
FROM fact_receipt r
JOIN fact_receipt_item i
  ON r.receipt_id = i.receipt_id
JOIN dim_brand b
  ON i.barcode = b.barcode
WHERE r.purchase_date >= (SELECT month_start FROM last_month)
  AND r.purchase_date <  (SELECT month_start FROM last_month) + INTERVAL '1 month'
GROUP BY b.name
ORDER BY receipts_count DESC
LIMIT 5;
