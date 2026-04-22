WITH product_ranking AS (
    SELECT  p.category, 
            p.name, 
            SUM(oi.quantity * oi.price) AS revenue, 
            DENSE_RANK() OVER (
                PARTITION BY p.category
                ORDER BY SUM(oi.quantity * oi.price) DESC
            ) AS ranked
FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category, p.name
)
SELECT * 
FROM product_ranking
WHERE ranked<= 2;

WITH monthly_revenue AS (
    SELECT  strftime('%Y-%m', o.order_date) AS month, 
            SUM(oi.quantity * oi.price) AS revenue
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month
)
SELECT  month, 
        revenue, 
        LAG(revenue) OVER (ORDER BY month) AS prev_revenue, 
        revenue - LAG(revenue) OVER (ORDER BY month) AS mom_change, 
        ROUND(
            (revenue - LAG(revenue) OVER (ORDER BY month)) * 100
            / LAG(revenue) OVER (ORDER BY month) 
        ) AS mom_pct_change, 
        SUM(revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM monthly_revenue;
