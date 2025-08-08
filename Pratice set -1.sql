CREATE DATABASE IF NOT EXISTS BANK;
USE BANK;

CREATE TABLE payment(
id INT PRIMARY KEY,
customer VARCHAR(50),
Mode VARCHAR(50),
city VARCHAR(30) 
);

INSERT INTO payment
(id, customer, Mode, city)
VALUES
(101, "nitesh", "netbanking", "poland"),
(102, "ethan", "creditcard", "mimai"),
(103, "maya", "upi", "senfransico"),
(104, "olivia", "netbanking", "denver"),
(105, "lima", "debitcard", "orleans"),
(106, "sophia", "upi", "phonix"),
(107, "coleb", "upi", "boston"),
(108, "ava", "debitcard", "nashvilla"),
(109, "luca", "netbanking", "india"),
(110, "jack", "creditcard", "boston")
;

SELECT *FROM payment;

-- Q) For the given table, find the total paymnent according to each payment method.
SELECT mode, COUNT(mode)
FROM payment
GROUP BY mode;

-- Q 2) IN THE PAYMENT TABLE
-- a)change the name of column "name" to "full_name"
-- b)delete all the students who scored marks less than 80
-- c)Delete all the column grade
 
 select *from payment;
 
ALTER TABLE payment
CHANGE city smart_city varchar(50);

DELETE FROM payment
WHERE mode = "netbanking";

ALTER TABLE payment
DROP COLUMN mode;



