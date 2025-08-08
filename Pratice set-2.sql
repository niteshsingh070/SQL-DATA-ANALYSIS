CREATE DATABASE IF NOT EXISTS COMPANY;
USE COMPANY;

CREATE TABLE STUDENT 
(student_id INT PRIMARY KEY,
name VARCHAR(30));

INSERT INTO STUDENT
(student_id, name)
VALUES
(101, "NITESH SINGH"),
(102, "MUKESH SINGH"),
(103, "HITESH SINGH"),
(104, "JITESH SINGH"),
(105, "RAMESH SINGH");

SELECT *FROM STUDENT;


CREATE TABLE COURSE
(student_id INT PRIMARY KEY,
course VARCHAR(30));

INSERT INTO COURSE
(student_id, course)
VALUES
(101, "B.TECH"),
(102, "M.TECHH"),
(103, "BA"),
(104, "BSC"),
(105, "BCA");

CREATE TABLE RESULT
(student_id INT PRIMARY KEY ,
name VARCHAR(30),
course VARCHAR(30));

INSERT INTO RESULT
(student_id, name, course)
VALUES
(101,"NITESH SINGH", "B.TECH"),
(102, "MUKESH SINGH", "M.TECHH"),
(103,"HITESH SINGH", "BA");

SELECT *FROM RESULT, STUDENT, COURSE;
 -- innner join
SELECT *
FROM STUDENT
INNER JOIN COURSE
ON student.student_id = course.student_id;

SELECT *
FROM STUDENT as s
INNER JOIN COURSE as c
ON s.student_id = c.student_id;

-- left join

SELECT *
FROM STUDENT AS s
LEFT JOIN COURSE AS c
ON s.student_id = c.student_id;

-- right join
SELECT *
FROM STUDENT AS s
right JOIN COURSE AS c
ON s.student_id = c.student_id;

-- left join UNION right join => FULL JOIN
SELECT *
FROM STUDENT AS s
LEFT JOIN COURSE AS c
ON s.student_id = c.student_id
UNION
SELECT *
FROM STUDENT AS s
RIGHT JOIN COURSE AS c
ON s.student_id = c.student_id;


