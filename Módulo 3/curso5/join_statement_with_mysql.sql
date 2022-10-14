use company;

-- JOIN Statement
desc employee;
desc works_on;

select * from employee, works_on where Ssn = Essn;

-- JOIN
select * from employee JOIN works_on;

-- JOIN ON -> INNER JOIN ON

show tables;
desc departament; -- Dnumber

select * from employee JOIN works_on on Ssn = Essn;
select * from employee JOIN departament on Ssn = Mgr_ssn;

select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
    where Dname = 'Research';

select * from dept_locations;  -- address e Dnumber
select * from departament;     -- Dname, Dept_create_date

select Dname as Department, Dept_create_date as StartDate, Dlocation as Location
	from departament INNER JOIN dept_locations using(Dnumber)
    order by StartDate; 

-- CROSS JOIN - produto cartesiano
select * from employee cross join dependent;

--
--
-- JOIN com mais de 3 tabelas
--
--
desc employee;
-- project, works_on e employee
select concat(Fname,' ', Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName, 
		Pno as ProjectNumber, Plocation as Location from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
	order by Pnumber;

-- departament, dept_location, employee

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament
		inner join dept_locations using(Dnumber)
        inner join employee on Ssn = Mgr_ssn
        group by Dnumber;


select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament
		inner join dept_locations using(Dnumber)
        inner join employee on Ssn = Mgr_ssn
        group by Dnumber
        having count(*)>1;
        
select Dnumber, Dname, concat(Fname,' ',Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament
		inner join dept_locations using(Dnumber)
        inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
        group by Dnumber;

--
--
-- OUTER JOIN
--
--

select * from employee;
select * from dependent;

select * from employee inner join dependent on Ssn = Essn;
select * from employee left join dependent on Ssn = Essn;

select * from employee left outer join dependent on Ssn = Essn;

select e.Lname as Employee, s.Lname as Manager 
	from (employee as e left outer join employee as s on e.Ssn = s.Super_ssn);


-- case statement

show databases;
use company_constraints;


show tables;

select Fname, Salary, Dno from employee;

-- desabilitar o safe mode
update employee set Salary =
		case 
			when Dno=5 then Salary+ 2000
            when Dno=4 then Salary+ 1500
            when Dno=1 then Salary+ 3000
            else Salary + 0
        end;












