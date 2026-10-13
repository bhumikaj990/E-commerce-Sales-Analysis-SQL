CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

SHOW tables;

INSERT INTO Customers (customer_id, customer_name, city, email)
VALUES
(1, 'Amit Sharma', 'Pune', 'amit@gmail.com'),
(2, 'Priya Patil', 'Mumbai', 'priya@gmail.com'),
(3, 'Rahul Jadhav', 'Nashik', 'rahul@gmail.com'),
(4, 'Sneha Deshmukh', 'Pune', 'sneha@gmail.com'),
(5, 'Akash More', 'Nagpur', 'akash@gmail.com'),
(6, 'Neha Kulkarni', 'Mumbai', 'neha@gmail.com'),
(7, 'Rohan Shinde', 'Pune', 'rohan@gmail.com'),
(8, 'Pooja Pawar', 'Kolhapur', 'pooja@gmail.com'),
(9, 'Sahil Joshi', 'Nashik', 'sahil@gmail.com'),
(10, 'Kavya Shah', 'Mumbai', 'kavya@gmail.com'),
(11, 'Omkar Patil', 'Pune', 'omkar@gmail.com'),
(12, 'Riya More', 'Satara', 'riya@gmail.com');

INSERT INTO Products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Accessories', 500),
(103, 'Keyboard', 'Accessories', 1200),
(104, 'Mobile', 'Electronics', 25000),
(105, 'Headphones', 'Electronics', 2000),
(106, 'Office Chair', 'Furniture', 7500),
(107, 'Study Table', 'Furniture', 6000),
(108, 'Monitor', 'Electronics', 12000),
(109, 'USB Cable', 'Accessories', 300),
(110, 'Printer', 'Electronics', 15000);

INSERT INTO Orders (order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-01-05', 'Delivered'),
(1002, 2, '2026-01-10', 'Delivered'),
(1003, 3, '2026-01-15', 'Cancelled'),
(1004, 1, '2026-02-02', 'Delivered'),
(1005, 4, '2026-02-10', 'Delivered'),
(1006, 5, '2026-02-15', 'Shipped'),
(1007, 6, '2026-03-01', 'Delivered'),
(1008, 7, '2026-03-05', 'Delivered'),
(1009, 2, '2026-03-12', 'Delivered'),
(1010, 8, '2026-03-20', 'Cancelled'),
(1011, 9, '2026-04-01', 'Delivered'),
(1012, 10, '2026-04-08', 'Shipped'),
(1013, 3, '2026-04-15', 'Delivered'),
(1014, 11, '2026-05-02', 'Delivered'),
(1015, 4, '2026-05-10', 'Delivered'),
(1016, 5, '2026-05-18', 'Cancelled'),
(1017, 6, '2026-06-01', 'Delivered'),
(1018, 7, '2026-06-12', 'Delivered'),
(1019, 9, '2026-06-20', 'Shipped'),
(1020, 10, '2026-06-25', 'Delivered'),
(1021, 1, '2026-07-03', 'Delivered'),
(1022, 2, '2026-07-10', 'Delivered'),
(1023, 8, '2026-07-15', 'Shipped'),
(1024, 11, '2026-08-01', 'Delivered'),
(1025, 12, '2026-08-05', 'Delivered');

INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 55000),
(2, 1001, 102, 2, 500),
(3, 1002, 104, 1, 25000),
(4, 1003, 103, 2, 1200),
(5, 1004, 108, 1, 12000),
(6, 1004, 102, 1, 500),
(7, 1005, 106, 2, 7500),
(8, 1006, 107, 1, 6000),
(9, 1007, 105, 2, 2000),
(10, 1008, 101, 1, 55000),
(11, 1009, 110, 1, 15000),
(12, 1010, 109, 3, 300),
(13, 1011, 104, 2, 25000),
(14, 1012, 108, 2, 12000),
(15, 1013, 102, 3, 500),
(16, 1014, 106, 1, 7500),
(17, 1015, 103, 2, 1200),
(18, 1016, 101, 1, 55000),
(19, 1017, 105, 3, 2000),
(20, 1018, 107, 2, 6000),
(21, 1019, 110, 1, 15000),
(22, 1020, 104, 1, 25000),
(23, 1021, 101, 1, 55000),
(24, 1022, 102, 4, 500),
(25, 1023, 108, 1, 12000),
(26, 1024, 106, 1, 7500),
(27, 1025, 109, 5, 300),
(28, 1005, 103, 1, 1200),
(29, 1007, 102, 2, 500),
(30, 1014, 105, 1, 2000);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;

-- Module 1: Sales Performance Analysis

-- 1) What is the total revenue generated from delivered orders?

select o.order_status,sum(oi.unit_price*oi.quantity) as total_revenue from orders as o
 join Order_Items as oi on o.order_id=oi.order_id
 where order_status="delivered";

-- 2) What is the total number of orders by order status?
select order_status,count(*)as total_count from orders group by order_status 
order by total_count desc;

-- 3)What is the average order value of delivered orders?
select avg(total_revenue) as average_value from (
select o.order_id,sum(oi.unit_price*oi.quantity) as total_revenue from Order_Items oi 
join orders o on o.order_id=oi.order_id 
where o.order_status='delivered' group by o.order_id) as average;

-- 4) What is the monthly revenue trend?
select date_format(o.order_date ,'%y-%m') as month ,sum(oi.quantity * oi.unit_price) as total_revenue from orders  o join Order_Items oi
on o.order_id=oi.order_id where o.order_status="delivered" group by month order by month;

-- 5) Which month generated the highest revenue?
select date_format(o.order_date,'%y-%m') as month ,sum(oi.quantity*oi.unit_price) as total_revenue from orders o join Order_Items oi
where o.order_status="delivered" group by month order by total_revenue desc limit 1;

-- Module 2: Product Performance Analysis

-- 1)Which products generated the highest revenue?
select p.product_name ,sum(oi.unit_price * oi.quantity) as total_revenue from products p join Order_Items oi 
 on p.product_id=oi.product_id join orders o where o.order_status="delivered" group by p.product_name order by total_revenue desc;
 
-- 2) Which products have the highest sales quantity?
select p.product_name,sum(oi.quantity) as total_quantity_sold from products p join order_Items oi
 on p.product_id=oi.product_id
join orders o on oi.order_id=o.order_id where  o.order_status="delivered" group by p.product_id,p.product_name order by total_quantity_sold desc;

-- 3) Which product category contributes the most to total revenue?
select p.category,sum(oi.quantity*oi.unit_price) as total_revenue from products p join Order_Items oi on p.product_id=oi.product_id
join orders o on o.order_id=oi.order_id where o.order_status="delivered"
group by p.category order by total_revenue desc;

-- Module 3: Customer Analysis

-- 1) Who are the top 5 customers based on total spending?

select c.customer_name,sum(oi.quantity*oi.unit_price) as total_revenue from customers c join Orders o
 on c.customer_id=o.customer_id
 join Order_Items oi on o.order_id=oi.order_id where o.order_status="delivered" group by c.customer_name
 order by total_revenue desc limit 5;
 
-- 2)Which customers have placed more than one order?

select c.customer_name,count(o.order_id)as total_orders from customers c join Orders o on c.customer_id=o.customer_id
where o.order_status="delivered"
 group by c.customer_name having total_orders>1;

-- 3) What is the average spending per category?

select p.category,round(avg(oi.quantity*oi.unit_price))as average_spending from products p join Order_Items oi
on p.product_id=oi.product_id join Orders o on o.order_id=oi.order_id
where o.order_status='delivered' group by p.category;

-- 4)Which customers contribute the most to total revenue?
select c.customer_name,sum(oi.quantity*oi.unit_price) as total_revenue from customers c join orders o on c.customer_id=o.customer_id
join Order_Items oi on oi.order_id=o.order_id where o.order_status='delivered' group by c.customer_name 
order by total_revenue desc;

-- Module 4: Advanced Analysis

-- 1) Rank customers according to their total spending.
with customer_spending as (select c.customer_name,sum(oi.quantity*oi.unit_price) as total_spending
from customers c join orders o on c.customer_id=o.customer_id join Order_Items oi on o.order_id=oi.order_id
 where o.order_status='delivered' group by c.customer_name ) 
 (select customer_name,total_spending, rank() over(order by total_spending desc) as spending_rank from customer_spending order by 
 total_spending desc);

-- 2) Identify customers whose spending is above the average customer spending.

select c.customer_name,sum(oi.quantity*oi.unit_price) as total_spending from 
customers c join orders o 
on c.customer_id=o.customer_id join Order_Items oi on o.order_id=oi.order_id where o.order_status="delivered"
 group by c.customer_name 
having total_spending > (select avg(average_spending) from 
(select o.customer_id,sum(oi.quantity*oi.unit_price) as average_spending from 
orders o join Order_Items oi on o.order_id=oi.order_id  where o.order_status="delivered"
group by o.customer_id)as avg_spending);

-- 3) What is the total revenue generated by each product in each category?
select p.category,p.product_name,sum(oi.quantity*oi.unit_price) as total_revenue from products p join
Order_Items oi on p.product_id=oi.product_id join orders o on o.order_id=oi.order_id where o.order_status="delivered"
group by p.category,p.product_name order by p.category , total_revenue desc;


