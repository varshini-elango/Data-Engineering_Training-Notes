create database Company1

create table tblEmployee(
ID int Not Null Primary Key,
Name varchar(50),
Gender varchar(50),
Salary int,
DepartmentId int)

create table tblDepartment(
ID int Not Null Primary Key,
DepartmentName varchar(50),
Location varchar(50),
DepartmentHead varchar(50))

insert into tblEmployee(ID,Name,Gender,Salary,DepartmentId)
values(1, 'Tom', 'Male', 4000, 1),
(2, 'Pam', 'Female', 3000, 3),
(3, 'John', 'Male', 3500, 1),
(4, 'Sam', 'Male', 4500, 2),
(5, 'Todd', 'Male', 2800, 2),
(6, 'Ben', 'Male', 7000, 1),
(7, 'Sara', 'Female', 4800, 3),
(8, 'Valarie', 'Female', 5500, 1),
(9, 'James', 'Male', 6500, NULL),
(10, 'Russell', 'Male', 8800, NULL);

INSERT INTO tblDepartment (Id, DepartmentName, Location, DepartmentHead)
VALUES 
(1, 'IT', 'London', 'Rick'),
(2, 'Payroll', 'Delhi', 'Ron'),
(3, 'HR', 'New York', 'Christie'),
(4, 'Other Department', 'Sydney', 'Cindrella');

SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee
INNER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

SELECT Name, Gender, Salary, DepartmentName FROM tblEmployee
LEFT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

SELECT Name, Gender, Salary, DepartmentName FROM tblEmployee
Right OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

SELECT Name, Gender, Salary, DepartmentName FROM tblEmployee
FULL OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

--orders

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Laptop', 800.00),
(2, 'Smartphone', 500.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 50.00),
(5, 'Monitor', 150.00);

INSERT INTO Orders (order_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2024-08-01'),
(2, 2, 1, '2024-08-02'),
(3, 3, 3, '2024-08-03'),
(4, 1, 1, '2024-08-04'),
(5, 4, 4, '2024-08-05'),
(6, 5, 2, '2024-08-06'),
(7, 5, 1, '2024-08-07');

SELECT o.order_id, o.product_id, p.product_name, o.quantity, o.order_date, 
p.price, o.quantity * p.price AS total_price
FROM Orders o
INNER JOIN Products p
ON o.product_id = p.product_id;

SELECT o.order_id, o.product_id, p.product_name, o.quantity, o.order_date, 
p.price, o.quantity * p.price AS total_price
FROM Orders o
LEFT OUTER JOIN Products p
ON o.product_id = p.product_id;

SELECT o.order_id, o.product_id, p.product_name, o.quantity, o.order_date, 
p.price, o.quantity * p.price AS total_price
FROM Orders o
RIGHT OUTER JOIN Products p
ON o.product_id = p.product_id;

SELECT o.order_id, o.product_id, p.product_name, o.quantity, 
 o.order_date, p.price, o.quantity * p.price AS total_price
FROM Orders o
FULL OUTER JOIN Products p
ON o.product_id = p.product_id;

select p.product_name,o.order_date,SUM(o.quantity) AS total_quantity
from Orders o
JOIN Products p ON o.product_id =p.product_id
GROUP BY GROUPING SETS ((p.product_name),(o.order_date));

select o.order_id,o.product_id,
       (select p.product_name from Products p where p.product_id=o.product_id)
AS product_name
from Orders o;

select order_id,order_date,product_id 
from Orders
where product_id IN (select product_id from Products where price > 500);

--Example for exists 
select u.user_id,u.user_name
from Users u
where EXISTS (select 1 from Orders o where o.user_id = u.user_id);

select p.product_name,p.price
from Products p
where p.price > ANY (select price from Products where product_name LIKE 'Laptop%');

select p.product_name,p.price
from Products p
where p.price > ALL (select price from Products where product_name LIKE 'Smartphone%');
 
 --Example
SELECT  user_id, user_name
FROM Users 
WHERE user_id IN (SELECT user_id FROM orders 
WHERE product_id IN (SELECT product_id FROM products 
WHERE price > 1000 ));

select product_name from Products where price > 500
UNION 
select product_name from Products where product_name LIKE 'Smart%';

select product_name from Products where price > 500
INTERSECT
select product_name from Products where product_name LIKE 'Smart%';

select product_name from Products where price > 500
EXCEPT 
select product_name from Products where product_name LIKE 'Smart%';



--work

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    manager_id INT
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    salary_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Employees (employee_id, employee_name, department, manager_id) VALUES
(1, 'John Doe', 'HR', NULL),
(2, 'Jane Smith', 'Finance', 1),
(3, 'Robert Brown', 'Finance', 1),
(4, 'Emily Davis', 'Engineering', 2),
(5, 'Michael Johnson', 'Engineering', 2);

INSERT INTO Salaries (salary_id, employee_id, salary, salary_date) VALUES
(1, 1, 5000, '2024-01-01'),
(2, 2, 6000, '2024-01-15'),
(3, 3, 5500, '2024-02-01'),
(4, 4, 7000, '2024-02-15'),
(5, 5, 7500, '2024-03-01');

--Equi join
SELECT e.employee_id, e.employee_name, e.department, s.salary, s.salary_date
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id;

--Self join
SELECT e.employee_id, e.employee_name AS employee_name, m.employee_name AS manager_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;

--GROUP BY with HAVING
SELECT e.department, AVG(s.salary) AS average_salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
GROUP BY e.department
HAVING AVG(s.salary) >= 6000;

--GROUP BY with Grouping Sets
SELECT e.department,SUM(s.salary) AS total_salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
GROUP BY GROUPING SETS ((e.department),());

--Subqueries
SELECT e.employee_id, e.employee_name, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > (SELECT AVG(salary) FROM Salaries);

--EXISTS
SELECT e.employee_id, e.employee_name
FROM Employees e
WHERE EXISTS (SELECT 1
FROM Salaries s
WHERE s.employee_id = e.employee_id
AND YEAR(s.salary_date) = 2024);

--ANY
SELECT e.employee_id, e.employee_name, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > ANY (SELECT s2.salary
FROM Employees e2
JOIN Salaries s2 ON e2.employee_id = s2.employee_id
WHERE e2.department = 'Engineering');

--ALL
SELECT e.employee_id, e.employee_name, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > ALL (SELECT s2.salary
FROM Employees e2
JOIN Salaries s2 ON e2.employee_id = s2.employee_id
WHERE e2.department = 'Finance');

--Nested Subqueries
SELECT e.employee_id, e.employee_name, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > (SELECT AVG(s2.salary)
FROM Salaries s2
JOIN Employees e2 ON s2.employee_id = e2.employee_id
WHERE e2.department = 'HR');

--Correlated Subqueries
SELECT e.employee_id, e.employee_name, e.department, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > (SELECT AVG(s2.salary)
FROM Salaries s2
JOIN Employees e2 ON s2.employee_id = e2.employee_id
WHERE e2.department = e.department);

--UNION
SELECT employee_name
FROM Employees
WHERE department = 'HR'
UNION
SELECT employee_name
FROM Employees
WHERE department = 'Finance';

--INTERSECT
SELECT employee_id, employee_name
FROM Employees
WHERE department = 'Finance'
INTERSECT
SELECT employee_id, employee_name
FROM Employees
WHERE department = 'Engineering';

--EXCEPT
SELECT employee_id, employee_name
FROM Employees
WHERE department = 'Finance'
EXCEPT
SELECT employee_id, employee_name
FROM Employees
WHERE department = 'HR';

--MERGE
CREATE TABLE SalaryRevisions (
    salary_id INT PRIMARY KEY,
	employee_id INT,
    new_salary DECIMAL(10, 2),
	salary_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id));

INSERT INTO SalaryRevisions(salary_id, employee_id, new_salary, salary_date) 
VALUES
(1, 1, 5500, '2024-01-01'),
(2, 2, 6500, '2024-01-15'),
(3, 3, 6000, '2024-02-01'),
(4, 4, 8000, '2024-02-15'),
(5, 5, 8500, '2024-03-01');

MERGE INTO Salaries s
USING SalaryRevisions sr
ON s.employee_id = sr.employee_id
WHEN MATCHED THEN
    UPDATE SET s.salary = sr.new_salary
WHEN NOT MATCHED BY TARGET THEN
    INSERT (employee_id, salary)
    VALUES (sr.employee_id, sr.new_salary);

select * from Salaries

insert into SalaryRevisions(salary_id, employee_id, new_salary, salary_date) 
VALUES (6, 6, 7500, '2024-01-21');

INSERT INTO Salaries (salary_id, employee_id, salary, salary_date) 
VALUES (6, 6, 5000, '2024-01-01');

INSERT INTO Employees (employee_id, employee_name, department, manager_id) 
VALUES (6, 'Varshini', 'HR', NULL);

select * from Employees
select * from SalaryRevisions

select * from Salaries ORDER BY salary;




