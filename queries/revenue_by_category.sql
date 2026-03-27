-- Business question: Which categories generate the most revenue?
-- Also shows average revenue per unit sold (after discounts)
SELECT 
	c.category_name 												  AS category, 
	ROUND(SUM(od.quantity*od.unit_price*(1-od.discount))::numeric,2) AS total_revenue,
	SUM(od.quantity) 												  AS total_units_sold,
	ROUND(
        SUM(od.quantity * od.unit_price * (1 - od.discount))::numeric /
        SUM(od.quantity),
        2
    ) 																  AS revenue_per_unit
FROM order_details od
INNER JOIN products p 	 ON p.product_id = od.product_id
INNER JOIN categories c  ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC