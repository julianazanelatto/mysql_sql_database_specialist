-- Union, Except, and Intersect
create database teste;

use teste;
create table R(
A varchar(2)
);
create table S(
A varchar(2)
);

insert into R(A) values ('a1'),('a2'),('a2'),('a3');
insert into S(A) values ('a1'),('a1'),('a2'),('a2'),('a2'),('a3'),('a4'),('a5');
select * from S WHERE A NOT IN (select A from R);

select distinct R.A from R where R.A IN (select S.A from S);

(select distinct R.A from R) union (Select distinct S.A from S);

use database company_constraints;

-- retornar o conjunto de projetos em que Smith trabalha e é gerente
(select distinct Pnumber 
	from project, departament, employee
    where Dnum = Dnumber and Mgr_ssn = Ssn and Lname='Smith')
UNION
(select distinct Pnumber 
	from project, works_on, employee
    where Pnumber=Pno and Essn = Ssn and Lname='Smith');
