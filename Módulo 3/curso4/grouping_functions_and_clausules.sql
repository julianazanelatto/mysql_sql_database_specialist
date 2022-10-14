-- funções e cláusulas de agrupamento

select * from employee;
select count(*) from employee;

select count(*) from employee, departament
	where Dno=Dnumber and Dname = 'Research';

select Dno, count(*), round(avg(Salary),2) from employee
	group by Dno;

select Dno, count(*) as Number_of_employees, round(avg(Salary),2) as Salary_avg from employee
	group by Dno;
    
select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname;

select count(distinct Salary) from employee;
select sum(Salary) as total_sal, max(Salary) as Max_sal, min(Salary) as Mini_sal, avg(Salary) as Avg_sal from employee;


-- join será abordado no curso 5
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM (employee JOIN departament ON Dno = Dnumber)
WHERE Dname = 'Research';


SELECT Lname, Fname
FROM employee
WHERE ( SELECT count(*)
		FROM dependent
		WHERE Ssn = Essn) >= 2;
  
--
-- group by
--
	
show tables;
select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as AVG_Salary
	from project, works_on, employee
	where Pnumber = Pno and Ssn = Essn
    group by Pnumber, Pname;

select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as AVG_Salary
	from project, works_on, employee
	where Pnumber = Pno and Ssn = Essn
    group by Pnumber
    order by avg(Salary) desc;
    

--
--
-- group by e having
--
--

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname
having count(*) > 2;

select Dno, count(*)
	from employee 
	where Salary > 30000
    group by Dno
    having count(*)>=2;

select Dno as Department, count(*) as NumberOfEmployess from employee
	where Salary>20000 
		and Dno in (select Dno from employee
					group by Dno
					having count(*)>=2)
	group by Dno;