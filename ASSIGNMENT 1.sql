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