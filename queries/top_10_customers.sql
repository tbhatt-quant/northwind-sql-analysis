-- 05_top_10_customers.sql
-- Business question: Who are our top 10 customers by total spend?
-- Helps identify high-value customers for loyalty programs or targeted marketing.
SELECT 
	c.company_name,
	c.country,
	ROUND(
	SUM(od.quantity*od.unit_price*(1-od.discount))::numeric,2) AS total_spent,
	COUNT(DISTINCT o.order_id) AS total_orders,
	ROUND(
		SUM(od.quantity*od.unit_price*(1-od.discount))::numeric/
		COUNT(DISTINCT o.order_id),2
	) AS avg_order_value,
	ROUND(
    	SUM(od.quantity * od.unit_price * (1 - od.discount))::numeric / 
    	SUM(SUM(od.quantity * od.unit_price * (1 - od.discount))) OVER ()::numeric * 100,
    	2
	) AS pct_of_total_revenue
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.company_name, c.country, c.customer_id
ORDER BY total_spent DESC
LIMIT 10;
