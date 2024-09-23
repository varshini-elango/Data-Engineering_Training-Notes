--CRUD(Create,Read,Update,Delete)
create database college

use college
create table tblGender
(ID int Not Null Primary Key,
Gender nvarchar(50))

alter table tblperson
add constraint tblperson_GenderId_FK FOREIGN KEY
(GenderId) references tblGender(ID)

insert into tblperson (Id, Name,Email,GenderId)
values(1,'Tom','Tom@gmail.com',1),
(2,'Jessy','Jessy@gmail.com',2),
(3,'Kristy','Kristy@gmail.com',2),
(4,'John','John@gmail.com',1),
(5,'Rob','Rob@gmail.com',1)

INSERT into tblGender (Id ,Gender)
values (1, 'Male'),
(2, 'Female'),
(3 , 'Others')

select * from tblGender
select * from tblperson

update tblperson
set Email ='TomUpdated@gmail.com'
where Id=1;

update tblperson
set GenderId =1
where Name='Jessy';

delete from tblperson
where Id = 3;

delete from tblperson
where GenderId = 1;

create table Employees
(EmployeeID int Not Null Primary Key,
FirstName varchar(50),
LastName varchar(50),
Position varchar(50),
Department varchar(50),
HireDate DATE)

insert into Employees(EmployeeID,FirstName,LastName,
Position,Department,HireDate)
values(1,'Raj','Das','Tester','Testing','2022-01-15'),
(2, 'Jane', 'Smith', 'Project Manager', 'Marketing', '2021-06-30'),
(3, 'Alice', 'Johnson', 'Data Analyst', 'Finance', '2020-11-22'),
(4, 'Bob', 'Brown', 'HR Specialist', 'Human Resources', '2019-04-18');

select * from Employees

update Employees
set FirstName ='Jack'
where LastName='Johnson';

delete from Employees 
where EmployeeID=4;

alter table Employees
add Email varchar(100);

delete from Employees 
where EmployeeID=1;

insert into Employees(EmployeeID,FirstName,LastName,
Position,Department,HireDate)
values(1,'Amit','Sharma','Software Engineer','IT','2022-01-15'),
(2, 'Priya', 'Mehta', 'Project Manager', 'Operations', '2023-02-20'),
(3, 'Raj', 'Patel', 'Business Analyst', 'Finance', '2021-06-30'),
(4, 'Sunita', 'Verma', 'HR Specialist', 'Human Resources', '2019-08-12'),
(5,'Vikram','Rao','Software Engineer','IT','2021-03-18'),
(6,'Anjali','Nair','HR Manager','HR','2020-05-14'),
(7,'Rohan','Desai','Finance Manager','Finance','2022-11-25'),
(8,'Sneha','Kumar','Operations Coordinator','Operations','2023-07-02'),
(9,'Deepak','Singh','Data Scientist','IT','2022-08-05'),
(10,'Neha','Gupta','Business Analyst','Finance','2020-10-10');

alter table Employees drop column Email;

select FirstName, LastName,Department
from Employees;

select * 
from Employees
where Department = 'IT';

select * 
from Employees
where HireDate > '2022-01-01';

select *
from Employees
where Department IN ('IT' ,'HR');

select DISTINCT Department
from Employees;

select *
from Employees
where Department ='IT' AND HireDate > '2022-01-01';

select *
from Employees
where Department = 'IT' OR HireDate > '2022-01-01';

select *
from Employees
where HireDate BETWEEN '2022-01-01' AND '2022-12-31';

select *
from Employees
where LastName LIKE 'S%';

select FirstName + ' ' + LastName AS FullName,Department
from Employees;

select E.FirstName ,E.LastName,E.Department
from Employees AS E
where E.Department = 'IT';

select COUNT(*) AS EmployeeCount from Employees;

select Department ,COUNT(*) AS EmployeeCount
from Employees
GROUP BY Department;

create table Departments(
DepartmentID int primary key,
DepartmentName varchar(50));

insert into Departments(DepartmentID,DepartmentName)
values(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Operations');

select * from Departments

select e.EmployeeID,e.FirstName,e.LastName,e.Position,d.DepartmentName
from Employees e
JOIN Departments d ON e.Department =d.DepartmentName;

select FirstName,LastName
from Employees
where HireDate=(select MIN(HireDate) from Employees);

select FirstName,LastName
from Employees 
where Department IN (
    select Department
    from Employees
    GROUP BY Department
    HAVING COUNT(*) > 2
);


