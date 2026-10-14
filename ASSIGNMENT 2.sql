create database employee;
use employee;
create table departments (
department_id int,
department_name varchar(100)
);
create table location (
location_id int, 
location_name varchar(30)
);
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);
ALTER TABLE Employees
ADD email VARCHAR(100);
ALTER TABLE Employees
MODIFY designation VARCHAR(200);
ALTER TABLE Employees
DROP COLUMN age;
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;
TRUNCATE TABLE Employees;
DROP TABLE Employees;
DROP DATABASE employee;
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
DROP DATABASE IF EXISTS EMPLOYEE;
CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE DEPARTMENTS (
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE LOCATION (
LOCATION_ID INT PRIMARY KEY
AUTO_INCREMENT,
LOCATION VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
select*
from employees;
select count(*) as total_employees
from employees;
show tables;
select count(*) as total_departments
from departments;
select count(*) as total_loactions
from Location;
describe employees;
describe departments;
describe location;
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing'),
(6, 'Operations');
select*
from departments;
INSERT INTO location (location)
VALUES
('Coimbatore'),
('Bangalore'),
('Chennai'),
('Kochi'),
('Hyderabad'),
('Mumbai');
select*
from location;
INSERT INTO employees
(employee_id, employee_name, gender, age, hire_date,
 designation, department_id, location_id, salary)
VALUES
(1, 'Arun Kumar', 'M', 25, '2023-01-15', 'Data Analyst', 1, 1, 35000.00),
(2, 'Priya Sharma', 'F', 28, '2022-06-10', 'HR Executive', 2, 2, 32000.00),
(3, 'Rahul Das', 'M', 30, '2021-03-20', 'Sales Executive', 3, 3, 40000.00),
(4, 'Sneha Nair', 'F', 27, '2023-08-05', 'Financial Analyst', 4, 4, 38000.00),
(5, 'Vijay Raj', 'M', 32, '2020-11-12', 'Marketing Executive', 5, 5, 45000.00),
(6, 'Anjali Menon', 'F', 26, '2024-02-01', 'Operations Analyst', 6, 6, 33000.00),
(7, 'Kiran Thomas', 'M', 29, '2022-09-18', 'SQL Developer', 1, 2, 50000.00),
(8, 'Meera Joseph', 'F', 31, '2021-12-01', 'Senior HR Executive', 2, 4, 48000.00),
(9, 'Sanjay Rao', 'M', 24, '2024-05-15', 'Junior Analyst', 1, 3, 28000.00),
(10, 'Divya Krishnan', 'F', 35, '2019-07-22', 'Team Lead', 6, 1, 65000.00);
select*
from employees;
SELECT DISTINCT salary
FROM Employees;
SELECT age AS Employee_Age,
       salary AS Employee_Salary
FROM Employees;
SELECT *
FROM Employees
WHERE salary > 50000
  AND hire_date < '2016-01-01';
  SELECT *
FROM Employees
WHERE designation IS NULL;
UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;
SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;
SELECT *
FROM Employees
WHERE hire_date >= '2018-01-01'
  AND hire_date < '2019-01-01'
ORDER BY hire_date ASC
LIMIT 5;
SELECT SUM(salary) AS Total_Finance_Salary
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'Finance'
);
SELECT MIN(age) AS Minimum_Age
FROM Employees;
SELECT location_id, MAX(salary) AS Maximum_Salary
FROM Employees
GROUP BY location_Id;
SELECT designation,
       AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;
SELECT department_id,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) < 3;
SELECT location_id,
       AVG(age) AS Average_Age
FROM Employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;
SELECT e.employee_name,
       e.designation,
       d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.department_id = d.department_id;
    SELECT d.department_name,
       COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
SELECT l.location,
       e.employee_name AS Employee_Name
FROM Employees e
RIGHT JOIN Location l
    ON e.location_id = l.location_id;
    

