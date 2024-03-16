create database assessment;
use assessment;
-- create table WORKER(WORKER_ID INT PRIMARY KEY,FIRST_NAME VARCHAR(20),LAST_NAME VARCHAR(20),SALARY INT,JOINING_DATE timestamp,DEPARTMENT TEXT);
-- DROP TABLE WORKER;
create table WORKER(WORKER_ID INT,FIRST_NAME VARCHAR(20),LAST_NAME VARCHAR(20),SALARY INT,JOINING_DATE timestamp,DEPARTMENT TEXT);
INSERT INTO WORKER(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUE(1,'MONIKA','ARORA',100000,'2014-2-20 9:00','HR');
INSERT INTO WORKER(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) 
VALUES(2,'NIHARIKA','VERMA',80000,'2014-6-11 9:00','ADMIN'),
(3,'VISHAL','SINGHAL',300000,'2014-2-20 9:00','HR'),
(4,'AMITABH','SINGH',500000,'2014-2-20 9:00','ADMIN'),
(5,'VIVEK','BHATI',500000,'2014-6-11 9:00','ADMIN'),
(6,'VIPUL','DIWAN',200000,'2014-6-11 9:00','ACCOUNT'),
(7,'SATISH','KUMAR',75000,'2014-1-20 9:00','ACCOUNT'),
(8,'GEETIKA','CHAUHAN',90000,'2014-4-11 9:00','ADMIN');
SELECT * FROM WORKER;
-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
-- Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME;
SELECT * FROM WORKER ORDER BY DEPARTMENT DESC;
-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
-- from the Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME='VIPUL' OR FIRST_NAME='SATISH';
-- 3.Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
-- contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H';
-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 100000 to 300000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 300000;
-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
select WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT,COUNT(*) from worker GROUP BY WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT HAVING  count(*)>1;
-- 6. Write an SQL query to show the top 6 records of a table.
SELECT * FROM WORKER LIMIT 6;
-- 7. Write an SQL query to fetch the departments that have less than five people in them.
SELECT DEPARTMENT,COUNT(*) AS C FROM WORKER GROUP BY DEPARTMENT having C<5;
-- 8. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT,COUNT(*) AS C FROM WORKER GROUP BY DEPARTMENT; 
-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
SELECT CONCAT(W.FIRST_NAME,' ',W.LAST_NAME) AS FULL_NAME, W.DEPARTMENT, W.SALARY
FROM WORKER W
WHERE W.salary IN(
    SELECT MAX(SALARY)
    FROM WORKER
    WHERE DEPARTMENT = W.DEPARTMENT
);

-- Question 2: Open school database, then select student table and use following SQL statements.
-- TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT
create database school;
use school;

create table student(StdID int,StdName varchar(20),Sex varchar(20),Percentage int,Class int,Sec varchar(5),Stream varchar(50),DOB date);
insert into student(StdID,StdName,Sex,Percentage,Class,Sec,Stream,DOB) 
values(1001,'Surekha Joshi','Female',82,12,'A','Science','1998/08/03');
insert into student(StdID,StdName,Sex,Percentage,Class,Sec,Stream,DOB) 
values
(1002,'Maahi Agrawal','Female',56,11,'C','Commerce','2008/11/23'),
(1003,'Sanam Verma','Male',59,11,'C','Commerce','2006/06/29'),
(1004,'Ronit Kumar','Male',63,11,'C','Commerce','1997/11/05'),
(1005,'Dipesh Pulkit','Male',78,11,'B','Science','2003/09/14'),
(1006,'Jahanvi Puri','Female',60,11,'B','Commerce','2008/11/07'),
(1007,'Sanam Kumar','Male',23,12,'F','Commerce','1998/08/03'),
(1008,'Sahil saras','Male',56,11,'C','Commerce','2008/11/07'),
(1009,'Akshra Agrawal','Female',72,12,'B','Commerce','1996/10/01'),
(1010,'Stuti Mishra','Female',39,11,'F','Science','2008/11/23'),
(1011,'Harsh Agrawal','Male',42,11,'C','Science','1998/08/03'),
(1012,'Nikunj Agrawal','Male',49,12,'C','Commerce','1998/08/28'),
(1013,'Akriti Saxena','Female',89,12,'A','Science','2008/11/23'),
(1014,'Tani Rastogi','Female',82,12,'A','Science','2008/11/23');
select * from student;
SELECT StdName, DOB FROM student;
SELECT * FROM student WHERE percentage >= 80;
SELECT StdName, Stream, Percentage from student WHERE Percentage > 80;
SELECT * from student WHERE stream = 'Science' AND Percentage > 75;
