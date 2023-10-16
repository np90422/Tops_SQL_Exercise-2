use hr_db;


/* **************************************  Database Name: HR  **********************************
********************************************************************************************* */

-- 1. Display all information in the tables EMP and DEPT. 

select * from employee,departments;

 -- 2. Display only the hire date and employee name for each employee.

select concat( first_name," ",last_name)as Employee, hire_date from employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 

select employee_id, concat( first_name," ", last_name) as"Employees" from employees;

-- 4. Display the hire date, name and department number for all clerks. 

select hire_date, concat( first_name," ",last_name), department_id from employees where job_id = "PU_CLERK";

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 

select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000. 

select concat( first_name," ",last_name),salary from employees
where salary>2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date" 

select concat(first_name," ",last_name) as "Name", hire_date as "Start Date" from employees;

-- 8. Display the names and hire dates of all employees in the order they were hired. 

select concat(first_name," ",last_name) as "Name", hire_date from employees
order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order. 

select concat(first_name," ",last_name) as "Name", salary from employees
order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order

select concat(first_name," ",last_name) as "Name", department_id, commission_pct, salary from employees
where commission_pct is not null 
order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager 

select last_name, job_id from employees
where manager_id is null;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select last_name, job_id, salary from employees
where (job_id = "SA_REP" or job_id = "ST_CLERK") and salary not in (2500,3500,5000);


/* ********************************************  Database Name: HR  *****************************************
*********************************************************************************************************** */


select * from employees;

-- 1) Display the maximum, minimum and average salary and commission earned. 

select min(salary),max(salary),avg(salary),commission_pct from employees
where commission_pct is not null;

-- 2) Display the department number, total salary payout and total commission payout for each department. 

select job_id,sum(salary),sum(commission_pct),department_id from employees
group by job_id;

-- 3) Display the department number and number of employees in each department.

select department_id,count(job_id),job_id from employees
group by job_id;

-- 4) Display the department number and total salary of employees in each department.

select department_id,sum(salary),job_id from employees
group by job_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name 

select concat(first_name," ",last_name),commission_pct from employees
where commission_pct is null;

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

select concat(first_name," ",last_name),department_id,commission_pct as 'No commission' from employees
where commission_pct is null;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

 select concat(first_name,' ',last_name) as employee_name,salary, ifnull(salary*commission_pct/2,'No commission') as commission from employees;

-- 8) Display the employee's name, department id who have the first name same as another employee in the same department

select a.first_name,a.last_name,a.department_id from employees a
inner join employees b
on a.department_id = b.department_id;
 
 -- 9) Display the sum of salaries of the employees working under each Manager. 

select manager_id , sum(salary)
from employees
where employee_id not in  (select manager_id from employees)
group by manager_id;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 

select manager_id,count(employee_id) as employee_count from employees
group by manager_id 
order by employee_count desc;

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 

select first_name,last_name,department_id,salary,manager_id from employees
where last_name like '_a%'
group by last_name;

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.

select department_id, sum(salary) from employees
group by department_id;

-- 13) Select the maximum salary of each department along with the department id

select department_id, max(salary) from employees
group by department_id;

--  14) Display the commission, if not null display 10% of salary, if null display a default value 1 */

select '10% of salary' salary,commission_pct from employees
where commission_pct is not null
union
select '1' salary,commission_pct from employees
where commission_pct is null;

/* *************************  Database Name: HR  ****************************
************************************************************************** */

-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 

select concat((LEFT(last_name,2)),LOWER(SUBSTRING(last_name,3,5))) as 'Name' from employees;

-- 2) Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined. 

select concat(first_name,'-',last_name) as employee, monthname(hire_date) as joining_month from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 

select last_name,salary, 
case 
when (salary/2)>10000 then salary+(salary*0.10) + 1500
else salary+(salary*0.115) + 1500
end  as  new_salary
from employees;

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 

select concat(substr(employee_id,1,2),'00',substr(employee_id,3,1),'E') as employee_id,department_id,salary from employees;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 

select concat((LEFT(last_name,2)),LOWER(SUBSTRING(last_name,3,5))) as 'Name'from employees 
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%';

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 

 select last_name,concat('$',salary) as salary from employees;
 select last_name, LPAD(salary,15,'$') AS "SALARY" from employees;

-- 7. Display the employee's name if it is a palindrome

select reverse(first_name) as 'Name' from employees;

-- 8. Display First names of all employees with initcaps. 

select initcap(first_name) from employees;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.

select substring_index(street_address," ", 3) as "Address"from locations;
select street_address from locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name. 

select first_name,lower (concat (left(first_name,1),'',last_name,'@systechusa.com')) as EmailAddress from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 

select a.last_name,b.job_id,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like 'Trenna';

-- 12. Display the names and department name of all employees working in the same city as Trenna. 

select a.last_name,c.department_name,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like 'Trenna';

-- 13. Display the name of the employee whose salary is the lowest. 

select concat(first_name,' ',last_name) as 'Name',salary from employees
order by salary asc limit 1;

 -- 14. Display the names of all employees except the lowest paid 

select first_name,salary from employees 
where salary!=(select min(salary) from employees); 

/* *****************************  Database Name: HR  **************************
**************************************************************************** */

-- 1. Write a query to display the last name, department number, department name for all employees.

select a.first_name,a.last_name,a.department_id,b.department_name from employees a
join departments b on a.department_id = b.department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 

select distinct job_id, location_id from employees, departments
WHERE employees.department_id = departments.department_id
and employees.department_id = 4;

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select a.last_name,a.commission_pct,b.department_name,b.location_id,c.city from employees a
join departments b
on a.department_id = b.department_id  
join locations c
on b.location_id = c.location_id
where commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name 

select a.last_name,c.department_name from employees a
join departments c
on a.department_id = c.department_id
where last_name like '%a';

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 

select a.last_name,b.job_title,c.department_id,c.department_name,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like ' ATLANTA';

-- 6. Display the employee last name and employee number along with their manager's last name and manager number.

select a.employee_id 'Employee Id', a.last_name 'Employee Name', b.employee_id 'Manager Id', b.last_name 'Manager Name' from employees a
join employees b 
on a.manager_id = b.employee_id;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 

select a.employee_id 'Employee Id', a.last_name 'Employee Name', b.employee_id 'Manager Id', b.last_name 'Manager Name',a.manager_id from employees a
join employees b 
on a.manager_id = b.employee_id or a.manager_id is null;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 

select a.last_name,b.department_id from employees a
join departments b
on a.department_id = b.department_id
where b.department_id = a.department_id;

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select a.first_name,b.job_title,c.department_name,a.salary,
case 
when salary >= 50000 then 'A' 
when salary >= 30000 then 'B' 
when salary < 30000 then 'C' 
end as grade 
from jobs b, employees a 
join departments as c 
on a.department_id = c.department_id;

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date

select a.employee_id 'Employee Id', a.last_name 'Employee Name',a.hire_date, b.employee_id 'Manager Id', b.last_name 'Manager Name',b.hire_date from employees a
join employees b 
on a.manager_id = b.employee_id;


/* *********************************  Database Name: HR  ***********************************
****************************************************************************************** */


select * from departments;

-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 

select a.last_name,a.hire_date,b.department_name from employees a
join departments b
on a.department_id = b. department_id
where department_name like 'Sales';

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 

select employee_id,phone_number, last_name, salary from employees
where salary > (select avg(salary) from employees)
order by salary asc;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u

select employee_id, last_name from employees
where department_id in (select department_id from employees where last_name like '%u%');

-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 

 select a.last_name,b.job_id,c.department_id,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like ' ATLANTA';

-- 5. Display the last name and salary of every employee who reports to FILLMORE

select employees.last_name,salary from employees 
join managers 
on managers.manager_id=employees.manager_id 
where managers.first_name='FILLMORE';

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department

select a.last_name,a.salary,b.department_name from employees a
join departments b
on a.department_id = b. department_id
where department_name like 'Operations';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name. 

select employee_id,phone_number, last_name, salary from employees
where salary > (select avg(salary) from employees) &  department_id in (select department_id from employees where last_name like '%u%')
order by salary asc;

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept. 

select first_name,job_id from employees
where job_id in 
(select distinct job_id from employees
inner join departments
on employees.department_id = departments.department_id 
where department_name = 'Sales');

-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise. 

select '05% raise' raise, employee_id, salary,department_id from employees
where department_id in (10,30)
union
select '10% raise', employee_id, salary,department_id from employees
where department_id = 20
union
select '15% raise', employee_id, salary,department_id from employees
where department_id in (40, 50)
union
select 'no raise', employee_id, salary,department_id from employees
where department_id = 60;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 

select * from employees
order by salary desc limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column 

select '0' commission, employee_id, salary,commission_pct as 'new commission'from employees
where commission_pct is null
union
select '0>1'commission, employee_id, salary,commission_pct as 'new commission'from employees
where commission_pct is not null;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.

select first_name,last_name,salary,manager_id from employees
where manager_id is not null
order by salary desc limit 3;



