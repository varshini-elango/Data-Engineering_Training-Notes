create database college2

use college2
create table Products(
ProductID int primary key,
ProductName varchar(100) NOT NULL,
Category varchar(50) NOT NULL,
Price DECIMAL(10,2) CHECK (Price >0),
StockQuantity int default 0);

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
    (101, 'Laptop', 'Electronics', 999.99, 1),
    (102, 'Smartphone','Electronics', 599.99, 1),
    (103, 'Headphones','Electronics', 149.99, 2),
    (104, 'Keyboard','Electronics', 89.99, 2);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL
);

INSERT INTO Customer (CustomerID, CustomerName)
VALUES
    (1, 'Alice Johnson'),
    (2, 'Bob Smith'),
    (3, 'Carol Williams');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT NOT NULL,
	Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, Amount)
VALUES
    (1001, 1, 101, '2024-08-01', 1, 999.99 ),
    (1002, 1, 103, '2024-08-15', 2, 149.99),
    (1003, 2, 102, '2024-08-10', 1, 599.99),
    (1004, 3, 104, '2024-08-20', 1, 89.99),
    (1005, 2, 103, '2024-08-22', 1, 149.99);

ALTER TABLE Products
ADD 
    CategoryID INT,
    SupplierID INT;

UPDATE Products
SET 
    CategoryID = 1,   
    SupplierID = 101  
WHERE 
    ProductID = 101;

UPDATE Products
SET 
    CategoryID = 1,   
    SupplierID = 102  
WHERE 
    ProductID = 102;

UPDATE Products
SET 
    CategoryID = 2,  
    SupplierID = 103  
WHERE 
    ProductID = 103;

UPDATE Products
SET 
    CategoryID = 2,   
    SupplierID = 104  
WHERE 
    ProductID = 104;

select *  from Products

--Constraints

select ProductName ,UPPER(ProductName) AS ProductNameUpperCase
from Products;
select ProductName ,LOWER(ProductName) AS ProductNameLowerCase
from Products;
select ProductName ,SUBSTRING(ProductName,1,5) AS ShortName
from Products;
select ProductName ,LEN(ProductName) AS NameLength
from Products;
select ProductName ,REPLACE(ProductName, 'Phone', 'Device') AS UpdateProductName
from Products;
select ProductName ,LTRIM(RTRIM(ProductName)) AS TrimmedProductName
from Products;
select ProductName ,CHARINDEX('e',ProductName) AS PositionOfE
from Products;
select ProductName ,Category,CONCAT(ProductName,'-',Category) AS ProductDetails
from Products;
select ProductName ,LEFT(ProductName,5) AS ShortName
from Products;
select ProductName ,RIGHT(ProductName,3) AS LastCharacters
from Products;
select ProductName ,REVERSE(ProductName) AS ReversedName
from Products;
select ProductName ,FORMAT(ProductName,'N2') AS FormatedPrice
from Products;
select ProductName ,REPLICATE(ProductName,3) AS RepeatedProductName
from Products;

--Date functions

select GETDATE() AS CurrentDate,
DATEADD(DAY ,10 ,GETDATE()) AS FutureDate;
select DATEADD(YEAR ,-1 ,GETDATE()) AS DateMinus1Year;
select DATEDIFF(DAY, '2024-01-01',GETDATE()) AS DaysDiffernce;
select FORMAT(GETDATE(),'mmmm dd, yyyy') AS FormattedDate;
SELECT FORMAT (GETDATE(), 'dd-MM-yyyy') AS FormattedDate;
SELECT YEAR (GETDATE()) AS CurrentYear;
SELECT MONTH ('2024-05-15') AS MonthExtracted;
SELECT DAY('2024-05-15') AS DayExtracted;

--find the no of months passed since your birthday
select DATEDIFF(MONTH, '2024-06-10',GETDATE()) AS DaysDiffernce;

--Mathematical functions

select ProductName, Price, ROUND(Price ,2) AS Roundedprice
from Products;
select ProductName, Price, CEILING(Price/8.0) AS Ceilingprice
from Products;
select ProductName, Price, FLOOR(Price) AS Floorprice
from Products;
select ProductName, Price, SQRT(Price) AS SquareRootprice
from Products;
select ProductName, Price, POWER(Price,2) AS priceSquared
from Products;
select ProductName, Price,Price % 5 AS ModuloPrice
from Products;
select ABS (MAX(Price) - MIN(Price))  AS  PriceDifference
from Products;
select ProductName, Price, ROUND(RAND() * 100 , 2) AS RandomDiscountPercantage
from Products;
select ProductName, Price, LOG(Price) AS Logirthmprice
from Products;

--Scenario: Apply a 15% discount, round the discounted price to 
--2 decimal places, and show both the ceiling and floor values of
--the final discounted price.

SELECT ProductName, Price, 
    ROUND(Price * 0.85, 2) AS DiscountedPrice, 
    FLOOR(ROUND(Price * 0.85, 2)) AS FloorDiscountedPrice, 
    CEILING(ROUND(Price * 0.85, 2)) AS CeilingDiscountedPrice
FROM Products;

--Aggregate functions
select AVG(Price) AS AveragePrice
from Products;
select COUNT(Price) AS TotalOrders
from Orders;
select MIN(Price) AS MinPrice,MAX(Price) AS MaxPrice
from Products;
select Category,COUNT(ProductID) AS ProductCount
from Products
GROUP BY Category;


--Stored Procedure
create procedure GetAllProducts
AS
BEGIN
select *from Products;
END;

exec GetAllProducts

create procedure GetAllProducts2
AS
BEGIN
select *from Orders;
END;

exec GetAllProducts2

create procedure GetProductsByID
@ProductID int
AS
BEGIN
select * from Products
where ProductID = @ProductID;
END;

exec GetProductsByID @ProductID = 101;

create procedure GetProductsByCategoryAndPrice
@Category varchar(50),
@MinPrice decimal(10,2)
AS
BEGIN
select * from Products
where Category=@Category
AND Price >= @MinPrice;
END;

exec GetProductsByCategoryAndPrice @Category = 'Electronics' , @MinPrice = 500.00;

create procedure GetTotalProductsInCategory
@Category varchar(50),
@TotalProducts int OUTPUT
AS
BEGIN
select @TotalProducts = COUNT(*)
from Products
where Category = @Category;
END;

declare @Total int;
exec GetTotalProductsInCategory @Category = 'Electronics',
@TotalProducts =@Total OUTPUT;
select @Total AS TotalProductsInCategory;


create procedure ProcessOrder

    @OrderID INT ,
    @CustomerID INT,
    @ProductID int,
    @OrderDate DATE,
    @Quantity int,
	@Amount INT


AS
BEGIN
BEGIN TRANSACTION;

BEGIN TRY

insert into Orders(OrderID, CustomerID, ProductID, OrderDate, Quantity, Amount)
values (@OrderID, @CustomerID, @ProductID, @OrderDate, @Quantity, @Amount);

update Products
set StockQuantity =StockQuantity -@Quantity
where ProductID = @ProductID;

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION;

THROW;
END CATCH;
END;

select * from Products
select * from Orders

EXEC ProcessOrder 
@OrderID=1006, 
@CustomerID=2, 
@ProductID=104,
@OrderDate='2024-08-23',
@Quantity=1,
@Amount=89;

create procedure AdjustStock
@ProductID int,
@Adjustment int
AS
BEGIN
IF @Adjustment > 0
BEGIN
update Products
set StockQuantity = StockQuantity + @Adjustment
where ProductID = @ProductID;
END
ELSE IF @Adjustment < 0
begin
update Products
set StockQuantity = StockQuantity + @Adjustment
where ProductID = @ProductID;
end
end;

exec AdjustStock @ProductID = 101 ,@Adjustment = 5;
exec AdjustStock @ProductID = 101 ,@Adjustment = -3;

--24/08/2024

create table Customers(
CustomerID int primary key not null,
Firstname varchar(50),
Lastname varchar(50),
Email varchar(100),
Phonenumber bigint);

insert into Customers(CustomerID ,Firstname ,Lastname ,Email ,Phonenumber )
Values (1,'amit','sharma','amit.sharma@example.com',9876543210),
(2,'priya','mehta','priya.mehta@example.com',8765432109),
(3,'rohit','kumar','rohit.kumar@example.com',7654321098),
(4,'neha','verma','neha.verma@example.com', 6543210987),
(5,'siddharth','singh','siddharth.singh@example.com',5432109876),
(6,'asha','rao','asha.rao@example.com',4321098765);

select * from Customers

update Customers
set Firstname = LTRIM(RTRIM(LOWER(Firstname))),
Lastname = LTRIM(RTRIM(LOWER(Lastname)));

select * from Customers
where Firstname LIKE '%A';

select * from Customers
where Phonenumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]';

select * from Customers
where Lastname LIKE '_____';

select CustomerID ,OrderID,Amount,
SUM(Amount) OVER (PARTITION BY CustomerID ORDER BY OrderDate)
AS RunningTotal
from Orders;

select CustomerId, TotalSales,
RANK() OVER (ORDER BY TotalSales Desc) AS SalesRank
from(select CustomerID, SUM(Amount) AS TotalSales
from Orders1
group by CustomerID) AS SalesDate;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO Employees (EmployeeName, ManagerID)
VALUES 
('Amit Sharma', NULL),  -- Top manager
('Priya Mehta', 1),     -- Reports to Amit
('Rohit Kumar', 1),     -- Reports to Amit
('Neha Verma', 2),      -- Reports to Priya
('Siddharth Singh', 2), -- Reports to Priya
('Asha Rao', 3);        -- Reports to Rohit

INSERT INTO Employees (EmployeeName, ManagerID)
VALUES 
('Vikram Gupta', 4),  -- Reports to Neha
('Rajesh Patel', 5);  -- Reports to Siddharth


WITH RecursiveEmployeeCTE AS (
SELECT EmployeeID, ManagerID, EmployeeName
FROM Employees
WHERE ManagerID IS NULL
UNION ALL
SELECT e.EmployeeID, e.ManagerID, e.EmployeeName
FROM Employees e 
INNER JOIN RecursiveEmployeeCTE r ON e.ManagerID = r.EmployeeID
)
SELECT * FROM RecursiveEmployeeCTE;


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Category VARCHAR(50),
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
 
INSERT INTO Sales (SaleID, ProductID, Category, Amount, SaleDate) 
VALUES 
(1, 101, 'Electronics', 1500.00, '2024-01-15'),
(2, 102, 'Furniture', 800.00, '2024-01-16'),
(3, 103, 'Electronics', 2000.00, '2024-01-17'),
(4, 104, 'Electronics', 1200.00, '2024-02-01'),
(5, 105, 'Furniture', 900.00, '2024-02-03');

select Category, SUM(Amount) AS TotalSales
from Sales
GROUP BY ROLLUP (Category);


CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);
 
INSERT INTO Orders2 (OrderID, CustomerID, OrderAmount, OrderDate)
VALUES 
(1, 1, 500.00, '2024-01-15'),
(2, 2, 700.00, '2024-01-16'),
(3, 1, 300.00, '2024-01-17'),
(4, 3, 1200.00, '2024-02-01'),
(5, 2, 900.00, '2024-02-03');

select DISTINCT o1.CustomerID
from Orders2 o1
where(select COUNT(*)
from Orders2 o2
where o2.CustomerID =o1.CustomerID) > 1;


CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
 
INSERT INTO ProductSales (SaleID, ProductID, Amount, SaleDate)
VALUES 
(1, 101, 1500.00, '2024-01-15'),
(2, 102, 800.00, '2024-01-16'),
(3, 103, 2000.00, '2024-01-17'),
(4, 104, 1200.00, '2024-02-01'),
(5, 105, 900.00, '2024-02-03');

create VIEW TotalSalesByProduct
WITH SCHEMABINDING
AS 
select ProductID, SUM(Amount) AS TotalSales
from dbo.ProductSales
GROUP BY ProductID;

select * from TotalSalesByProduct

--Task

--1. Filter and Aggregate on Join Results using SQL**
--Task: Join the `Orders` and `Customers` tables to find the total order amount per customer and filter out customers who have spent less than $1,000.
SELECT c.CustomerID,c.FirstName,c.LastName,SUM(o.Amount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(o.Amount) >= 1000;

--2. Cumulative Aggregations and Ranking in SQL Queries**
--Task: Create a cumulative sum of the `OrderAmount` for each customer to track the running total of how much each customer has spent.
SELECT c.CustomerID,c.FirstName,c.LastName,o.OrderID,o.Amount,
SUM(o.Amount) OVER (PARTITION BY c.CustomerID ORDER BY o.OrderID) AS RunningTotal
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;

--3. OVER and PARTITION BY Clause in SQL Queries**
--Task: Rank the customers based on the total amount they have spent, partitioned by city.
ALTER TABLE Customers
ADD City VARCHAR(100);

UPDATE Customers
SET City = 'Chennai'
WHERE CustomerID IN (1, 3);

UPDATE Customers
SET City = 'Bangalore'
WHERE CustomerID IN (2, 4);

UPDATE Customers
SET City = 'Coimbatore'
WHERE CustomerID = 5;

UPDATE Customers
SET City = 'Pondicherry'
WHERE CustomerID = 6;

UPDATE Customers
SET City = 'Mumbai'
WHERE CustomerID = 6;

SELECT c.CustomerID,c.FirstName,c.LastName,c.City,
SUM(o.Amount) AS TotalSpent,
RANK() OVER (PARTITION BY c.City ORDER BY SUM(o.Amount) DESC) AS SpendingRank
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City
ORDER BY c.City, SpendingRank;


--4. Total Aggregation using OVER and PARTITION BY in SQL Queries**
--Task: Calculate the total amount of all orders (overall total) and the percentage each customer's total spending contributes to the overall total.
WITH CustomerTotalSpending AS (
SELECT c.CustomerID,c.FirstName,c.LastName,c.City,
SUM(o.Amount) AS TotalSpent
FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City),
OverallTotal AS (SELECT 
SUM(TotalSpent) AS OverallTotalSpent
FROM CustomerTotalSpending
)
SELECT c.CustomerID,c.FirstName,c.LastName,c.City,c.TotalSpent,o.OverallTotalSpent,
(c.TotalSpent * 100.0 / o.OverallTotalSpent) AS SpendingPercentage
FROM CustomerTotalSpending c
CROSS JOIN OverallTotal o
ORDER BY SpendingPercentage DESC;

--5. Ranking in SQL**
--Task: Rank all customers based on the total amount they have spent, without partitioning.
SELECT c.CustomerID,c.FirstName,c.LastName,c.City,
SUM(o.Amount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(o.Amount) DESC) AS SpendingRank
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City
ORDER BY SpendingRank;

--additional tasks that build on the concepts of filtering, aggregating, ranking, and window functions in SQL:

--6. Task: Calculate the Average Order Amount per City**
--Task: Write a query that joins the `Orders` and `Customers` tables, calculates the average order amount for each city, and orders the results by the average amount in descending order.
SELECT c.City,AVG(o.Amount) AS AverageOrderAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY AverageOrderAmount DESC;

--7. Task: Find Top N Customers by Total Spending**
--Task: Write a query to find the top 3 customers who have spent the most, using `ORDER BY` and `LIMIT`.
SELECT TOP 3 c.CustomerID,c.FirstName,c.LastName,c.City,
SUM(o.Amount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City
ORDER BY TotalSpent DESC;

--8. Task: Calculate Yearly Order Totals**
--Task: Write a query that groups orders by year (using `OrderDate`), calculates the total amount of orders for each year, and orders the results by year.
SELECT YEAR(o.OrderDate) AS OrderYear,SUM(o.Amount) AS TotalAmount
FROM Orders o
GROUP BY YEAR(o.OrderDate)
ORDER BY OrderYear;

--9. Task: Calculate the Rank of Customers by Total Order Amount**
--Task: Write a query that ranks customers by their total spending, but only for customers located in "Mumbai". The rank should reset for each customer in "Mumbai".

SELECT c.CustomerID, c.FirstName, SUM(o.Amount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(o.Amount) DESC) AS CustomerRank
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'Mumbai'
GROUP BY c.CustomerID, c.FirstName;

--10. Task: Compare Each Customer's Total Order to the Average Order Amount**
--Task: Write a query that calculates each customer's total order amount and compares it to the average order amount for all customers.

SELECT c.CustomerID, c.FirstName, c.LastName,
SUM(o.Amount) AS TotalSpent,
SUM(o.Amount) - AVG(SUM(o.Amount)) OVER () AS Comparision
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;




















