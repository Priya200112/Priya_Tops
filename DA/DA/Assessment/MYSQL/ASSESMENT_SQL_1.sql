CREATE DATABASE WORKERS;

USE WORKERS;

CREATE TABLE WORKER (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
(1, 'Raj', 'Kumar', 75000, '2020-03-15 10:30:00', 'HR'),
(2, 'Pooja', 'Sharma', 60000, '2019-07-10 09:00:00', 'HR'),
(3, 'Amit', 'Patel', 55000, '2021-01-20 09:15:00', 'Sales'),
(4, 'Neha', 'Singh', 80000, '2018-09-12 09:45:00', 'Sales'),
(5, 'Karan', 'Kohli', 50000, '2022-06-22 10:00:00', 'Sales'),
(6, 'Riya', 'Joshi', 62000, '2017-11-05 08:30:00', 'Sales'),
(7, 'Vipul', 'Desai', 65000, '2023-04-10 09:00:00', 'Admin'),
(8, 'Karan', 'Kohli', 72000, '2020-12-18 10:30:00', 'Sales'),
(9, 'Siddharth', 'Gupta', 67000, '2021-08-01 09:30:00', 'HR'),
(10, 'Anjali', 'Mehta', 60000, '2019-05-15 08:45:00', 'Sales'),
(11, 'Karan', 'Kohli', 55000, '2022-02-28 09:00:00', 'Sales'),
(12, 'Neha', 'Singh', 48000, '2023-09-05 10:00:00', 'HR'),
(13, 'Satish', 'Aggarwal', 53000, '2018-04-10 08:30:00', 'Admin'),
(14, 'Deepika', 'Patel', 69000, '2017-12-17 09:15:00', 'Accounts'),
(15, 'Saurabh', 'Shukla', 55000, '2021-06-22 10:45:00', 'Accounts')
;


/*1. Write an SQL query to print all Worker details from the Worker table 
order by FIRST_NAME Ascending and DEPARTMENT Descending.*/

SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

/*2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish"     
from the Worker table. */

SELECT * FROM WORKER WHERE FIRST_NAME = 'Vipul' OR FIRST_NAME = 'Satish';

/*3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets. */

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%H';

/*4. Write an SQL query to print details of the Workers whose SALARY lies between 1. */

SELECT * FROM WORKER WHERE SALARY BETWEEN 27000 AND 50000;

/*5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/

SELECT *FROM Worker WHERE (FIRST_NAME, LAST_NAME) IN (
    SELECT FIRST_NAME, LAST_NAME FROM Worker
    GROUP BY FIRST_NAME, LAST_NAME HAVING COUNT(*) > 1
);

/*6. Write an SQL query to show the top 6 records of a table.*/

SELECT * FROM WORKER LIMIT 6;

/*7. Write an SQL query to fetch the departments that have less than five people in them.*/

SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

/*8. Write an SQL query to show all departments along with the number of people in there.*/

SELECT DEPARTMENT, COUNT(*) AS PEOPLE FROM Worker GROUP BY DEPARTMENT;

/*9. Write an SQL query to print the name of employees having the highest salary in each 
department.*/

SELECT W1.FIRST_NAME, W1.LAST_NAME, W1.DEPARTMENT, W1.SALARY FROM Worker AS W1 
WHERE W1.SALARY = (SELECT MAX(SALARY) FROM Worker W2
    WHERE W2.DEPARTMENT = W1.DEPARTMENT
);

-- SECOND OPTION:
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY FROM Worker
WHERE SALARY IN ( SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT
);

--
--
--
--
--
-- QUESTION 2:

CREATE DATABASE SCHOOL;

USE SCHOOL;

CREATE TABLE Student (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(50),
    Sex ENUM('Male', 'Female'),
    Percentage INT,
    Class INT,
    Sec CHAR(1),
    Stream VARCHAR(20),
    DOB DATE
);

INSERT INTO Student VALUES
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agarwal', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'Jahanvi Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 11, 'C', 'Commerce', '2008-03-08'),
(1008, 'Sahil Saras', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'Akshra Agarwal', 'Female', 72, 12, 'B', 'Science', '1996-10-01'),
(1010, 'Stuti Mishra', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'Harsh Agarwal', 'Male', 42, 11, 'C', 'Commerce', '1998-03-08'),
(1012, 'Nikunj Agarwal', 'Male', 49, 12, 'A', 'Commerce', '2006-06-28'),
(1013, 'Akriti Saxena', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'A', 'Science', '2008-11-23');

-- 1 To display all the records form STUDENT table. SELECT * FROM student ; 
 SELECT * FROM STUDENT;
 
-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ;  

 SELECT StdName, DOB FROM student ;  
 
/*3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; */ 

SELECT * FROM student WHERE percentage >= 80;

/*4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT StdName, Stream, Percentage WHERE percentage > 80; */ 

SELECT StdName, Stream, Percentage FROM STUDENT WHERE percentage > 80;  

/*5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75;*/

SELECT * FROM student WHERE stream = 'science' AND percentage > 75;

