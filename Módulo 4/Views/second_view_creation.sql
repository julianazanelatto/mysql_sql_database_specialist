show databases;
show tables from company_constraints;
use company_constraints;

create view employees_salary_27000_view as 
	select concat(Fname,Minit,Lname) as Name, Salary, Dno as Dept_number from employee
	where Salary > 26999;

select * from employees_salary_27000_view;

select * from employee;

create view employees_salary_view as 
	select concat(Fname,Minit,Lname) as Name, Salary, Dno as Dept_number from employee
	where Sex ='M';
    
select * from dependent;

drop view employees_salary_view;
create or replace view employees_dependent_view as 
	select concat(Fname,Minit,Lname) as Name, e.Dno as Departament, d.Dependent_name as Dependent
    from employee e
    inner join dependent d on e.Ssn = d.Essn;

select * from employees_dependent_view;