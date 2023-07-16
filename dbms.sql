-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME as Worker_Name from Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(FIRST_NAME) from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct Department from Worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substr(first_name, 1, 3) from Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
select instr(first_name, 'b') from Worker where FIRST_NAME = "Amitabh";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) from Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(Department) from Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, length(Department) from Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(FIRST_NAME, 'a', 'A') from Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker order by FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by FIRST_NAME ASC, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from Worker where FIRST_NAME IN ('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from Worker where FIRST_NAME NOT IN ('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from Worker where DEPARTMENT='Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where first_name LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker where SALARY between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from Worker where JOINING_DATE='2014 02%';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select department, count(*) from Worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME, ' ', LAST_NAME) as FullName from Worker where SALARY between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(WORKER_ID) as No_of_Workers from Worker group by department order by No_of_Workers DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from Worker as w inner join Title as t on w.WORKER_ID = t.WORKER_REF_ID where t.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select WORKER_TITLE, count(*) as count from Title group by WORKER_TITLE having count>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from Worker where MOD(Worker_ID, 2) !=0;

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from Worker where MOD(Worker_ID, 2) =0;

-- Q-28. Write an SQL query to clone a new table from another table.
create table Worker_clone like Worker;
insert into Worker_clone select * from Worker;
select * from Worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select Worker.* from Worker inner join Worker_clone using(Worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
select Worker.* from Worker left join Worker_clone using(Worker_id) WHERE Worker_clone.Worker_id is NULL;

-- Q-31. Write an SQL query to show the current date and time.
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from Worker order by SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from Worker order by SALARY DESC LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
-- HARD AF!
select * from Worker w1		
WHERE 4 = (
SELECT COUNT(DISTINCT (w2.salary))
from Worker w2
where w2.salary >= w1.salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from Worker w1, Worker w2 where w1.salary = w2.salary and w1.WORKER_ID != w2.WORKER_ID;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from Worker
UNION ALL
select * from Worker ORDER BY Worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select WORKER_ID, FIRST_NAME from Worker where WORKER_ID not in (select WORKER_REF_ID from Bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from Worker where WORKER_ID <= ( select count(WORKER_ID)/2 from Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select DEPARTMENT, count(DEPARTMENT) as depCount from Worker group by DEPARTMENT having depCount < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) from Worker group by department;




