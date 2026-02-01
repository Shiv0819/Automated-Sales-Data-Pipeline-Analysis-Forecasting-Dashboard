SELECT COUNT(*) AS null_customers FROM customers WHERE customer_name IS NULL;
SELECT COUNT(*) AS null_sales FROM sales WHERE sale_date IS NULL;
SELECT COUNT(*) AS null_payments FROM payments WHERE payment_date IS NULL;
-- to use in power BI
SELECT 
    c.customer_name,
    c.age,
    c.gender,
    c.city,
    c.signup_date,
    p.product_name,
    p.category,
    p.price,
    s.sale_year,
    s.quantity,
    pay.payment_mode,
    pay.payment_status,
    (p.price * s.quantity) AS total_sale
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
LEFT JOIN payments pay ON s.sale_id = pay.sale_id
ORDER BY c.customer_name, s.sale_year
LIMIT 30;

-- using aggregated function 
 
SELECT 
    c.customer_name,
    c.age,
    c.gender,
    c.city,
    COUNT(s.sale_id) AS total_orders,                          -- number of sales
    SUM(s.quantity) AS total_quantity,                         -- total items bought
    SUM(p.price * s.quantity) AS total_sales_amount,           -- total money spent
    SUM(pay.payment_status) AS total_payments_received          -- payments received
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
LEFT JOIN products p ON s.product_id = p.product_id
LEFT JOIN payments pay ON s.sale_id = pay.sale_id
GROUP BY c.customer_id, c.customer_name, c.age, c.gender, c.city
ORDER BY total_sales_amount DESC
LIMIT 1000;


-- years by sale with name of customer 
SELECT 
    c.customer_name,
    s.sale_year,
    SUM(p.price * s.quantity) AS yearly_sales
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name, s.sale_year
ORDER BY s.sale_year, yearly_sales DESC;

-- years wise sales 
SELECT 
    YEAR(s.sale_date) AS sale_year,
    SUM(s.quantity * p.price) AS total_sales_amount,
    SUM(s.quantity) AS total_items_sold,
    COUNT(s.sale_id) AS total_orders
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY YEAR(s.sale_date)
ORDER BY sale_year;

SELECT 
    c.customer_name,
    YEAR(s.sale_date) AS sale_year,
    SUM(s.quantity * p.price) AS total_sales_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name, YEAR(s.sale_date)
ORDER BY sale_year, total_sales_amount DESC;

