create database if not exists collage;
use collage;
create table student(
 rollno int primary key,
 name varchar(50),
 marks int not null,
 grade varchar(1),
 city varchar(20)
 );
 
 create table dept(
 id int primary key,
 name varchar(50)
 );
 
 INSERT INTO dept
 VALUES
 (101, "NITESH"),
 (102, "JAYSAH"),
 (103, "AMIT SAHA");
 
 
 UPDATE dept
 SET name = "IT"
 WHERE name = "NITESH";
 UPDATE dept
 SET name = "CS"
 WHERE name = "JAYSAH";
 UPDATE dept
 SET name = "EC"
 WHERE name = "AMIT SAHA";
 
 select *FROM dept;
 
 create table teacher(
 id int primary key,
 name varchar(50),
 dept_id INT,
 foreign key (dept_id) references dept(id)
 ON UPDATE CASCADE 
 ON DELETE CASCADE
 );
 
 INSERT INTO teacher
 VALUES
 (101, "ADAM", 101),
 (102, "Mikes", 102);

SELECT *FROM teacher;

insert into student (rollno, name, marks, grade, city)
values
(101, "nitesh", 80, "A", "Allahabad"),
(102, "Bhumkia", 78, "A", "Delhi"),
(103, "Rahul", 34, "C", "Allahabd"),
(104, "dhruve", 67, "B", "Germny"),
(105, "Emenual", 87, "A", "France"),
(106, "Modi", 98, "A", "India");

-- to print all table column
select *from student;

-- To frint selected Column
select rollno, name from student;

-- To select unique value which is without repitation.
select distinct city from student;

-- Where Clause -> Use with some condition and rule
-- condition = print when marks is greter then 80
select *from student where marks >80;

-- condition student from mumbai
select *from student where city = "Delhi";

-- Adding multiple condition togerther 
select *from student where marks >= 80 AND city = "Allahabad";

-- Club condition is we can use operators with "WHERE"  clause
-- Airthmetic(+,-,*,/,%)
-- +10 when we add then marks should be greater then 100 
select *from student where marks+10 > 100;

-- Comparision operator( <, >, <=, >=, ==, !=)
select *from student where marks = 80;
select *from student where marks > 80;

-- Logical Operators( AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY)
-- AND (to check the both condition to be true)
select *from student where marks = 80 AND city = "Allahabad";

-- OR (to check only one condition  should be true from both)
select *from student where marks = 80 OR city = "Delhi" ;

-- BETWEEN (to select data from range)
select *from student where marks BETWEEN 80 AND 90;

-- IN (MATCH ANY VALUE IN THE LIST)
SELECT * FROM student WHERE city IN ("Delhi", "France");
-- When IN match is not avliable then result will be blank
SELECT * FROM student WHERE city IN ("GOA", "Japan");

-- NOT(TO NEGIATE THE GIVEN CONDITION check opposite whth given condition)
SELECT * FROM student
WHERE 
city NOT IN ("Delhi", "France");

-- LIMIT Clause
-- set an upper limit on numbers of(tuples) rows to be returned
SELECT * FROM student
LIMIT 3;

-- remove * when use limit in more column
SELECT name , marks, city FROM student
LIMIT 3;

-- WE can use WHERE Clause on LIMIT condition
SELECT *FROM student
WHERE marks > 65
LIMIT 3;

-- ORDER BY CLAUSE ( Assending order or Decending Order)
-- To sort in accending(ASC) or Descending (DESC) order
SELECT *FROM student
ORDER BY city ASC;
SELECT *FROM student
ORDER BY city DESC;

-- we can set limit with this clause
SELECT *FROM student
ORDER BY marks DESC
LIMIT 3; 
-- ( Above top 3 sytudent)

-- select from some column
-- when Coumn is defined (name , rolllno) then there is no need to use * with from

-- Aggregate Functions
-- Aggerate function perform a calculation on a set and return a single values
-- COUNT()
-- MAX()
-- MIN()
-- SUM()
-- AVG()

SELECT max(marks)
FROM student; -- amximum 98

SELECT MIN
FROM student;

SELECT MIN(marks)
FROM student; -- minimum 34

SELECT SUM(marks)
FROM student; -- total 444

SELECT AVG(marks)
FROM student; -- avaergage 74.00

SELECT COUNT(name)
FROM student; -- counting on of rows or column

-- Group by Clause
-- Groups rows that have the same value into summary rows
-- it collect data from records and group by one or more column
-- Generally we use group by with aggrigate function

-- count no of student in each city
SELECT city, COUNT(name)
FROM student
GROUP BY city;

-- count average of student in each city
SELECT marks, city, AVG(marks)
FROM student
GROUP BY marks, city 
ORDER BY marks DESC;

-- HAVING Calause -
-- Simlier to where clasue condition on row
-- it's apply condition on after group whereas "Where" clause on specfic column

SELECT COUNT(name), city
FROM student
GROUP BY city
HAVING max(marks) > 80;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING max(marks) >= 90
ORDER BY city desc;

-- TO UPDATE VALUES IN TABLE
-- UPDATE QUERY

UPDATE student 
SET grade = "0"
WHERE grade = "A";

UPDATE student 
SET marks = marks + 1;

SELECT *FROM student;
-- error 1175 safe mode
-- Safe mode prevent from any changeses in databse- it could be reson of unnecssery or mistakenely deletion or change in db
-- 0 = OFF
-- 1 = ON
set sql_safe_updates=0;


-- Delete (rows)
-- we cant delete anything in safe mode is -> 1;

DELETE FROM student
WHERE marks < 35;

-- FORIGEN KEY
-- CASCADING FOR FORIGEN KEY

CREATE TABLE IF NOT EXISTS student (
id INT PRIMARY KEY,
courseID INT,
FOREIGN KEY(courseID) REFERENCES course(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- ALTER COMMAND - TO CHANFGE THE SCHEMA IT'S RELETED TO DCHEMA 

-- ADD COLUMN
ALTER TABLE dept
ADD COLUMN age int;
SELECT *FROM dept;

-- DELETE / DROP COLUMN

ALTER TABLE dept
DROP COLUMN age;

-- RENAME TABLE
ALTER TABLE dept
RENAME TO new_dept;

-- RENAME COLUMN
ALTER TABLE student
CHANGE name full_name(varchar(50)); 

-- TARNCATE TABLE -> delete all values or data from table
-- DROP TABLE -> delete the complete table 