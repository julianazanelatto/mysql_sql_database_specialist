-- nested (subqueries)
use company;

select distinct Pnumber from project;

-- todos em employee
select * from employee;

-- projetos em que Smith trabalha
select Pno, Hours from works_on, employee
        where Essn = Ssn and Lname='Smith';

-- projetos em que Smith gerencia
select Pnumber from project, departament, employee
        where Dnum =Dnumber and Mgr_ssn = Ssn and Lname='Smith';

--
-- Como retornar ambas informações em uma mesma query? 
--

-- retornar todos os projetos que Smith trabalha e gerencia
select distinct Pnumber from project where Pnumber in 
		(select Pnumber from project, departament, employee
        where Dnum =Dnumber and Mgr_ssn = Ssn and Lname='Smith')
        or 
        Pnumber in
        (select Pno from works_on, employee
        where Essn = Ssn and Lname='Smith');
        
        
-- comparação com apenas um atributo
select distinct Essn from works_on 
	where (Pno,Hours) in (select Pno, Hours from works_on
							where Essn = '123456789');
                            
--
-- utilizando keywords
--

-- recuperando os maiores salários se comparados ao departamento 5
select Lname, Fname, Salary from employee
	where Salary > all (select Salary from employee where Dno=5);

-- some e any?
select Lname, Fname, Salary from employee
	where Salary = any (select Salary from employee where Dno=5);
                     
select Lname, Fname, Salary from employee
	where Salary < all (select Salary from employee where Dno=5);
    
select * from employee where Dno=5;

--
-- Evitando ambiguidade 
--

select E.Fname, E.Lname from employee as e
	where e.Ssn in (
					select d.Essn from dependent d 
                    where e.Fname = d.Dependent_name
                    and e.Sex = d.Sex
                    );
                    
select concat(E.Fname, ' ', E.Lname) as Complete_name_employee from employee as e
	where e.Ssn in (
					select d.Essn from dependent d 
                    where e.Ssn = d.Essn
                    and e.Sex = d.Sex
                    );

--
--                    
-- Subqueries com cláusuls existis e unique 
--
--

-- que possuem dependentes
select e.Fname, e.Lname 
	from employee as e
	where exists (	select * from dependent as d 
                    where e.Ssn=d.Essn and e.Sex = d.Sex
				 ); 

-- recuperando nome de empregados que não possuem dependentes
select e.Fname, e.Lname 
	from employee as e
	where not exists (	select * from dependent as d 
						where e.Ssn=d.Essn
					  ); 
                      
-- e os gerentes? tem dependentes?
select e.Fname, e.Lname 
	from employee as e
	where exists (	select * from dependent as d 
                    where e.Ssn=d.Essn and e.Sex = d.Sex
				 )
                 and
                 exists (select * from departament
                 where Ssn = Mgr_ssn); 

-- acima de um n° de dependentes
select e.Fname, e.Lname 
	from employee as e
	where exists (	select * from dependent as d 
                    where e.Ssn=d.Essn
				 )>=2; 

--
-- comparando com conjuntos explicítos
--

-- recuperando o ssn de todos empregados que trabalham nos projetos 1,2 ou 3
select distinct Essn from works_on where Pno in (1,2,3);