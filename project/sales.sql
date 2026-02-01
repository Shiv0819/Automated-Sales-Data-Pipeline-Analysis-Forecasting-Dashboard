use project;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    sale_year INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
select * from sales;
-- update sales set sale_date = case sale_id when 3 then '2021-02-24' when 4 then '2022-09-25' when 6 then '2020-08-27' when 15 then '2023-08-23' end where sale_id in (3,4,6,15); 
-- update sales set sale_year = year(sale_date) where sale_id in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);