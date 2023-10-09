use hr_db;


/* **************************************  Database Name: HR  **********************************
********************************************************************************************* */


select * from departments;

select * from employees;

select concat( first_name," ",last_name)as Employee, hire_date from employees;

select employee_id, concat( first_name," ", last_name) as"Employees" from employees;

select hire_date, concat( first_name," ",last_name), department_id from employees where job_id = "PU_CLERK";

select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id from employees;

select concat( first_name," ",last_name),salary from employees
where salary>2000;

select concat(first_name," ",last_name) as "Name", hire_date as "Start Date" from employees;

select concat(first_name," ",last_name) as "Name", hire_date from employees
order by hire_date;

select concat(first_name," ",last_name) as "Name", salary from employees
order by salary desc;

select concat(first_name," ",last_name) as "Name", department_id, commission_pct, salary from employees
where commission_pct is not null 
order by salary desc;

select last_name, job_id from employees
where manager_id is null;

select last_name, job_id, salary from employees
where (job_id = "SA_REP" or job_id = "ST_CLERK") and salary not in (2500,3500,5000);



/* ********************************************  Database Name: HR  *****************************************
*********************************************************************************************************** */


select * from employees;

select min(salary),max(salary),avg(salary),commission_pct from employees
where commission_pct is not null;

select job_id,sum(salary),sum(commission_pct),department_id from employees
group by job_id;

select department_id,count(job_id),job_id from employees
group by job_id;

select department_id,sum(salary),job_id from employees
group by job_id;

select concat(first_name," ",last_name),commission_pct from employees
where commission_pct is null;

select concat(first_name," ",last_name),department_id,commission_pct as 'No commission' from employees
where commission_pct is null;

select a.first_name,a.last_name,a.department_id from employees a
inner join employees b
on a.department_id = b.department_id;
 
select manager_id , sum(salary)
from employees
where employee_id not in  (select manager_id from employees)
group by manager_id;


select manager_id,count(employee_id) as employee_count from employees
group by manager_id 
order by employee_count desc;

select first_name,last_name,department_id,salary,manager_id from employees
where last_name like '_a%'
group by last_name;

select department_id, sum(salary) from employees
group by department_id;

select department_id, max(salary) from employees
group by department_id;

/*(14) Display the commission, if not null display 10% of salary, if null display a default value 1 */

select '10% of salary' salary,commission_pct from employees
where commission_pct is not null
union
select '1' salary,commission_pct from employees
where commission_pct is null;

/* *************************  Database Name: HR  ****************************
************************************************************************** */

select concat((LEFT(last_name,2)),LOWER(SUBSTRING(last_name,3,5))) as 'Name'
from employees;

/*  (2) Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.  */

select last_name,salary, 
case 
when (salary/2)>10000 then salary+(salary*0.10) + 1500
else salary+(salary*0.115) + 1500
end  as  new_salary
from employees;

/* Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!  */ 

select concat((LEFT(last_name,2)),LOWER(SUBSTRING(last_name,3,5))) as 'Name'from employees 
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%';

/* . Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY  */

select reverse(first_name) as 'Name' from employees;

select initcap(first_name) from employees;

/* From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.  */

select first_name,lower (concat (left(first_name,1),'',last_name,'@systechusa.com')) as EmailAddress
from employees;

select a.last_name,b.job_id,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like 'Trenna';

select a.last_name,c.department_name,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like 'Trenna';

select concat(first_name,' ',last_name) as 'Name',salary from employees
order by salary asc limit 1;

/* Display the names of all employees except the lowest paid */

/* *****************************  Database Name: HR  **************************
**************************************************************************** */


select a.first_name,a.last_name,a.department_id,b.department_name from employees a
join departments b on a.department_id = b.department_id;

select distinct job_id, location_id from employees, departments
WHERE employees.department_id = departments.department_id
and employees.department_id = 4;

select a.last_name,a.commission_pct,b.department_name,b.location_id,c.city from employees a
join departments b
on a.department_id = b.department_id  
join locations c
on b.location_id = c.location_id
where commission_pct is not null;

select a.last_name,c.department_name from employees a
join departments c
on a.department_id = c.department_id
where last_name like '%a';

select a.last_name,b.job_title,c.department_id,c.department_name,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like ' ATLANTA';

select a.employee_id 'Employee Id', a.last_name 'Employee Name', b.employee_id 'Manager Id', b.last_name 'Manager Name' from employees a
join employees b 
on a.manager_id = b.employee_id;

select a.employee_id 'Employee Id', a.last_name 'Employee Name', b.employee_id 'Manager Id', b.last_name 'Manager Name',a.manager_id from employees a
join employees b 
on a.manager_id = b.employee_id or a.manager_id is null;

select a.last_name,b.department_id from employees a
join departments b
on a.department_id = b.department_id
where b.department_id = a.department_id;

select a.first_name,b.job_title,c.department_name,a.salary,
case 
when salary >= 50000 then 'A' 
when salary >= 30000 then 'B' 
when salary < 30000 then 'C' 
end as grade 
from jobs b, employees a 
join departments as c 
on a.department_id = c.department_id;

select a.employee_id 'Employee Id', a.last_name 'Employee Name',a.hire_date, b.employee_id 'Manager Id', b.last_name 'Manager Name',b.hire_date from employees a
join employees b 
on a.manager_id = b.employee_id;


/* *********************************  Database Name: HR  ***********************************
****************************************************************************************** */


select * from departments;

select a.last_name,a.hire_date,b.department_name from employees a
join departments b
on a.department_id = b. department_id
where department_name like 'Sales';

select employee_id,phone_number, last_name, salary from employees
where salary > (select avg(salary) from employees)
order by salary asc;

select employee_id, last_name from employees
where department_id in (select department_id from employees where last_name like '%u%');

 select a.last_name,b.job_id,c.department_id,d.city from employees a
join jobs b
on a.job_id = b.job_id
join departments c
on a.department_id = c.department_id
join locations d
on c.location_id = d.location_id
where city like ' ATLANTA';

/*(5) Display the last name and salary of every employee who reports to FILLMORE */

select a.last_name,a.salary,b.department_name from employees a
join departments b
on a.department_id = b. department_id
where department_name like 'Operations';

select employee_id,phone_number, last_name, salary from employees
where salary > (select avg(salary) from employees) &  department_id in (select department_id from employees where last_name like '%u%')
order by salary asc;

select first_name,job_id from employees
where job_id in 
(select distinct job_id from employees
inner join departments
on employees.department_id = departments.department_id 
where department_name = 'Sales');

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

select * from employees
order by salary desc limit 3;

select '0' commission, employee_id, salary,commission_pct as 'new commission'from employees
where commission_pct is null
union
select '0>1'commission, employee_id, salary,commission_pct as 'new commission'from employees
where commission_pct is not null;

select first_name,last_name,salary,manager_id from employees
where manager_id is not null
order by salary desc limit 3;



