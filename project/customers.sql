create database project;
use project;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30),
    signup_date DATE,
    signup_year INT
);
-- alter table customers rename column name to customer_name;
select* from customers;
update customers set signup_year = case customer_id when 1 then  2019 end where customer_id = 1;
UPDATE customers SET signup_year = YEAR(signup_date) WHERE customer_id in(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);


