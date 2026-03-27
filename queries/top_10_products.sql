--Business question: Which 10 products provide the most revenue.
--Helps identify flagship/high-value items.
SELECT 
	p.product_name 													  AS product,
	c.category_name 												  AS category,
	ROUND(SUM(od.quantity*od.unit_price*(1-od.discount))::numeric,2) AS total_revenue,
	SUM(od.quantity) AS total_units_sold,
	COUNT(DISTINCT od.order_id)   AS num_orders
FROM order_details od
INNER JOIN products p ON od.product_id = p.product_id
INNER JOIN categories c ON p.category_id = c.category_id
GROUP BY p.product_name, c.category_name
ORDER BY total_revenue DESC
LIMIT 10