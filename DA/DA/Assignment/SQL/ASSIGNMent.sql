create database Marketco;
USE Marketco;
CREATE TABLE Company(
	CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);
-- 1) Statement to create the Contact table 
CREATE TABLE Contact (
    ContactID INT  PRIMARY KEY,
	CompanyID INT,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain Boolean,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(12)
);

-- 2) Statement to create the Employee table 
CREATE TABLE Employee (
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45) UNIQUE,
    Phone VARCHAR(12)
);

/*3) Statement to create the ContactEmployee table  
HINT: Use DATE as the datatype for ContactDate. It allows you to store the 
date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).*/
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    ContactDate DATE,
    Description VARCHAR(100)
);

INSERT INTO Company
VALUES (110, 'Urban Outfitters, Inc.', '5000 South Broad St.', 'Philadelphia', 'PA', '19112');

INSERT INTO Company
VALUES (111, 'Toll Brothers', '250 Gibraltar Rd.', 'Horsham', 'PA', '19044');

INSERT INTO Contact 
VALUES (501, 110, 'Jack', 'Lee', '4777 Cameron Rd.', 'Buffalo', 'NY', '14209', 1, 
'jlee@urbanout.com', '215-454-5500');

INSERT INTO Contact
VALUES (502, 111, 'Bonnie', 'Johnson', '3600 Elk City Rd.', 'Ridley Park', 'PA', '19078',
 1, 'bj@tollbrothers.com', '215-938-8000');

INSERT INTO Employee 
VALUES (1001, 'Dianne', 'Connor', 85000, '2011-08-12', 'Sales Manager', 
'dconnor@marketco.com', '215-555-5679');

INSERT INTO Employee 
VALUES (1002, 'Lesley', 'Bland', 70000, '2012-07-01', 'Sales Representative',
 'lbland@marketco.com', '215-555-5678');
 
INSERT INTO ContactEmployee 
VALUES (1, 502, 1002, '2018-02-05', 'Emailed new marketing plan for approval');

INSERT INTO ContactEmployee 
VALUES (2, 501, 1001, '2018-02-08', 'Phone call to discuss pricing for advertising');

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800  
UPDATE Employee
SET Phone = '215-555-8800'
WHERE EmployeeID = 1002;

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyID = 110 AND CompanyName = 'Urban Outfitters, Inc.';



/*6)  In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement). 
HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.*/
DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 2;

/*7) Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well.*/

SELECT  e.FirstName, e.LastName
FROM Employee as e
JOIN ContactEmployee as ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact as c ON ce.ContactID = c.ContactID
JOIN Company as co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 

/*The % and _ operators are wildcard characters that help define the pattern:
1) "%"(percent sign) :- Allows you to match any string of any length. where length of character is zero, one, or multiple characters in a string.
	Ex:LIKE 'A%' :- Means start with A. (ex; Appu, ABC)
	   %B- Means anything thats end with B.(ex; BOB ,ROB)
2) "_"(Underscore) :- Allows you to match on a single character.
			-If you use single underscore(_) means single character find
            -IF you use more than one underscore means find more than more character(ex; use two underscore it means find two characters.)
	Ex:LIKE 'P_' :- means find exact one character after P.(ex; PR,PC)
		LIKE 'P___':- means find 3 character after P.(ex; Peer,Pick)
*/

-- 9) Explain normalization in the context of databases.

/*Normalization in databases is the process of organizing data to reduce redundancy and improve efficiency.
 It involves breaking down large tables into smaller, related ones, ensuring each table focuses on a single entity.
 This helps prevent data duplication, ensures consistency, and simplifies updates. */
 
 -- 10) What does a join in MySQL mean?  
 
/*Join in MySql is a SQL operation used to combine records from two or more tables based on a related column between them.
It allows you to retrieve data that is spread across multiple tables and bring it together into a single result set. 
Joins are used when there is a logical relationship between the tables.
- THERE ARE FIVE TYPES OF JOIN:
1)INNER JOIN
2)LEFT OUTER JOIN(Left JOIN)
3)RIGHT OUTER JOIN(Right JOIN)
4)FULL OUTER JOIN(Full JOIN)
5)CROSS JOIN(Cartesian JOIN)
*/

-- 11)What do you understand about DDL, DCL, and DML in MySQL?

/*1)DDL (Data Definition Language): Defines the structure of the database.
 Commands like CREATE, ALTER, and DROP are used to create and modify tables and databases.

2)DCL (Data Control Language): Controls access to data and manages user permissions 
Commands like GRANT and REVOKE are used to give or take away access rights for users.

3)DML (Data Manipulation Language): Handles data inside the database. 
Commands like SELECT, INSERT, UPDATE, and DELETE are used to retrieve, add, change, or remove data.
*/

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 

/*The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column between them.
The primary role of the JOIN is to enable you to retrieve and present data that resides in multiple tables,based on relationships between those tables.

1)INNER JOIN:- Returns only the rows that have matching values in both tables. 
If there is no match, those rows are excluded from the result.

2)LEFT JOIN :- Returns all records from the left table (the first table), and the matched records from the right table.
If no match is found, it will return NULL for columns from the right table.

3)RIGHT JOIN:- Returns all records from the right table (the second table), and the matched records from the left table. 
If no match is found, it will return NULL for columns from the left table.

4. FULL JOIN:- Returns all records when there is a match in either the left or the right table. 
It combines the results of both LEFT JOIN and RIGHT JOIN. 
If there is no match, it returns NULL for the missing side.

5)CROSS JOIN:- Returns the Cartesian product of two tables.
It combines each row from the first table with each row from the second table. 
This results in every possible combination of rows from both tables.
*/

	



