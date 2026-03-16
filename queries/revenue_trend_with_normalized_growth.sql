-- Business question: How has revenue and order volume trended over time?
-- Reveals strong growth in 1997 and partial-year data in 1998.

WITH active_days AS (
	SELECT
		EXTRACT(YEAR FROM order_date) AS sales_year,
		COUNT(DISTINCT(o.order_id)) AS total_orders,
		ROUND(SUM(quantity*unit_price*(1-discount))::numeric,2) AS total_revenue,
		(MAX(order_date)- MIN(order_date)+1) AS active_days
	FROM orders o
	INNER JOIN order_details od
	ON o.order_id = od.order_id
	GROUP BY EXTRACT(YEAR FROM order_date)
),

daily_avg AS (
	SELECT
		*,
		ROUND(total_revenue/active_days, 2) AS daily_average
	FROM active_days
)

SELECT 
	*,
	ROUND(
    (daily_average / LAG(daily_average, 1,daily_average) OVER (ORDER BY sales_year) - 1) * 100,
    2
) AS pct_increase_daily_avg
FROM daily_avg
ORDER BY sales_year
