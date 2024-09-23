create database Company

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

alter table tblEmployee
add constraint tblEmployee_DepartmentId_FK FOREIGN KEY
(DepartmentId) references tblDepartment(Id)

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

select * from tblEmployee
select * from tblDepartment