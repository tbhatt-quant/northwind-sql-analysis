--Finding Total Revenue after discount
SELECT 
	ROUND(SUM(unit_price*quantity*(1-discount)):: numeric, 2) AS Total_Revenue
FROM order_details;