use project ;
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    sale_id INT,
    payment_date DATE,
    payment_mode Varchar(30),
    payment_status VARCHAR(20),
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
SHOW TABLES;
DESCRIBE customers;
DESCRIBE products;
DESCRIBE sales;
DESCRIBE payments;
-- drop table payments;
select * from payments;
-- ALTER TABLE payments DROP COLUMN amount_paid;
SELECT *  FROM payments WHERE payment_date IS NULL;
-- update payments set payment_date = case payment_id when 3 then '2021-02-24' when 4 then '2022-09-25' when 6 then '2020-08-27' when 15 then '2023-08-23' end where payment_id in (3,4,6,15); 