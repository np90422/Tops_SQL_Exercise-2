select * from employee;

select emp_id,datediff(resignation_date,hire_data)/365 as years,
			  datediff(resignation_date,hire_data)%365/30 as months,
              datediff(resignation_date,hire_data)%365%30 as days
from employee;

select * from employee;

insert into employee (emp_id,hire_data,resignation_date)
			values(8,'2003-09-22','2004-08-04');
            
select emp_id,hire_data,coalesce(resignation_date,'1900-12-01') as resignation_date from employee;


select emp_id,datediff(resignation_date,hire_data)/365 as 'years experience' ,
			  datediff(resignation_date,hire_data)%365/30 as 'months experience'
from employee;

/*  Use Getdate() as input date for the below three questions. 
4) Display the count of days in the previous quarter 
5) Fetch the previous Quarter's second week's first day's date 
6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)  */


/*  7) Find out the date that corresponds to the last Saturday of January, 2015 using with 
clause.  */


