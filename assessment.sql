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