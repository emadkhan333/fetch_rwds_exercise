WITH monthly_counts AS (
  SELECT
    date_trunc('month', r.purchase_date) AS month,
    i.barcode,
    COUNT(DISTINCT r.receipt_id) AS cnt
  FROM fact_receipt r
  JOIN fact_receipt_item i
    ON r.receipt_id = i.receipt_id
  WHERE r.purchase_date >= date_trunc('month', CURRENT_DATE - INTERVAL '2 months')
    AND r.purchase_date <  date_trunc('month', CURRENT_DATE)
  GROUP BY 1,2
), ranked AS (
  SELECT
    month,
    barcode,
    cnt,
    RANK() OVER (PARTITION BY month ORDER BY cnt DESC) AS rank
  FROM monthly_counts
)
SELECT
  COALESCE(curr.brand_name, prev.brand_name) AS brand_name,
  curr.cnt AS this_month_count,
  prev.cnt AS prev_month_count,
  curr.rank AS this_month_rank,
  prev.rank AS prev_month_rank
FROM
  (SELECT * FROM ranked
     WHERE month = date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
       AND rank <= 5) AS curr
FULL OUTER JOIN
  (SELECT * FROM ranked
     WHERE month = date_trunc('month', CURRENT_DATE - INTERVAL '2 months')
       AND rank <= 5) AS prev
  USING (barcode)
LEFT JOIN dim_brand b1 ON curr.barcode = b1.barcode
LEFT JOIN dim_brand b2 ON prev.barcode = b2.barcode
ORDER BY this_month_rank NULLS LAST;
