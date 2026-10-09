CREATE DATABASE Griffintech;
USE Griffintech;
CREATE TABLE departments (department_id INT PRIMARY KEY,
department_name VARCHAR(50),
Location VARCHAR(50));
INSERT INTO departments(department_id, department_name,location)
VALUES
(1, 'Human Resource', 'Nairobi'),
(2, 'Finance', 'Nirobi'),
(3, 'Sales', 'Mombasa'),
(4, 'IT', 'Nairobi'),
(5, 'Procurement', 'Kisumu');
select * from departments;

CREATE TABLE employees (emp_id INT PRIMARY KEY, first_name VARCHAR(50),
last_name VARCHAR(50), EMAIL VARCHAR(50), job_tittle VARCHAR(50), saLary DECIMAL(10, 2),
department_id INT, FOREIGN KEY (department_id) REFERENCES departments(department_id));

INsERT INTO EMPLOYEES(emp_id, first_name, last_name, email, job_tittle, salary, department_id)
VALUES
(1, 'John', 'Kamau', 'john@griffintech.com', 'HR officer', 65000, 1),
(2, 'Jane', 'Wanjiku', 'jane@griffintech.com', 'Accountant', 70000, 2),
(3, 'Peter', 'Otieno', 'peter@griffintech.com', 'sales executive', 55000, 3),
(4, 'Mary', 'Achieng', 'mary@griffintech.com', 'software developer', 95000, 4),
(5, 'David', 'Mwangi', 'david@griffintech.com', 'procurement officer', 60000, 5),
(6, 'Brian', 'Omondi', 'brian@griffintech.com', 'sales manager', 85000, 3),
(7, 'Sarah', 'Njeri', 'sarah@griffintech,com', 'IT support', 60000, 4);
select * from clients;

CREATE TABLE clients(client_id INT PRIMARY KEY,
client_name varchar(100), email varchar(100), phone varchar(20), city varchar(50));
INSERT INTO clients(client_id, client_name, email, phone, city)
values
(1, 'Nirobi Hospital', 'info@nairobi-hospital.com', '071000001', 'Nairobi'),
(2, 'Mara safaries', 'info@marasafaries.com', '071000002', 'Narok'),
(3, 'Kenya Fresh LTD', 'info@kenyafresh.com', '071000003', 'Nakuru'),
(4, 'Mombasa Traders', 'info@mombasatraders.com', '0711000004', 'Mombasa'),
(5, 'Riftvalleybank', 'info@iftbank.com', '0711000005', 'Nakuru'),
(6, 'Maasai mara University', 'info@mmu.ac.ke', '0711000006', 'Narok'),
(7, 'Nakuru electronics', 'info@nakuruelectronics.com', '0711000007', 'Nakuru');

CREATE TABLE products(product_id INT PRIMARY KEY, product_name varchar(100),
category varchar(50), price DECIMAL(10,2), stock_quantity int);
INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES
(1, 'HP Laptop', 'computers', 75000, 15),
(2, 'Dell laptop', 'computers', 85000, 10),
(3, 'samsung galaxy A05', 'Phones', 15000, 25),
(4, 'Iphone 16', 'phones', 95000, 85),
(5,' wireless mouse', 'accessories', 2500, 40),
(6, 'keyboard', 'accessories', 3500, 30),
(7, 'HP printer', 'printers', 28000, 12),
(8, 'External hard drive', 'storage', 12000, 20);
select * from products;

CREATE TABLE orders(order_id INT PRIMARY KEY,
client_id int, product_id int, order_date date, quantity int,
total_amount decimal(10,2), FOREIGN KEY(client_id) REFERENCES CLIENTS(CLIENT_ID),
FOREIGN KEY(product_id) references products(product_id));
INSERT INTO ORDERS(order_id, client_id, product_id, order_date, quantity, total_amount)
VALUES
(1, 1, 1, '2026-09-01', 2, 150000),
(2, 2, 3, '2026-09-02', 5, 75000),
(3, 3, 7, '2026-09-03', 3, 84000),
(4, 4, 2, '2026-09-04', 1, 85000),
(5, 5, 4, '2026-09-05', 2, 19000),
(6, 6, 5, '2026-09-06', 10, 25000),
(7, 7, 6, '2026-09-07', 5, 17500),
(8, 1, 8, '2026-09-08', 3, 36000),
(9, 2, 1, '2026-09-09', 1, 75000),
(10, 3, 3, '2026-09-10', 4, 6000);
SELECT * FROM ORDERS;

SELECT clients.client_name, products.product_name, orders.quantity, orders.total_amount
from orders JOIN clients on orders.client_id =clients.client_id
JOIN products ON orders.product_id = products.product_id
where clients.client_name = 'kenya fresh LTD';

SELECT clients.client_name, SUM(orders.total_amount) as total_spent FROM orders join clients on
orders.client_id =clients.client_id group by clients.client_name order by total_spent DESC;

SeLECT products.product_name, sum(orders.total_amount) as total_revenue from orders
join products on orders.product_id =products.product_id
group by products.product_id order by total_revenue desc;

SELECT products.product_name, count(orders.order_id) as number_of_orders from orders
join products on orders.product_id = products.product_id
group by products.product_name order by number_of_orders;

UPDATE employees set job_tittle = 'senior sales executive' where emp_id = 3;
select * from employees where emp_id = 3;
select city from clients union select location from departments;
ALTER TABLE EMPLOYEES ADD CONSTRAINT unique_employee_email unique(email);
select * from employees;