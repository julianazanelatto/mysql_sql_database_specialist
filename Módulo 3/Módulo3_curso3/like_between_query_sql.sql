-- como utilizar like e between nas queries
use company;
select * from employee;

select Fname, Lname from employee where Address like '%Houston-TX%';

select Fname, Lname from employee where Bdate like '19________';
select Fname, Lname from employee where Bdate like '19__-__-__';
select Fname, Lname from employee where Bdate like '__7_-__-__';

select Fname, Lname, Bdate from employee where Bdate like '__6%';
select Fname, Lname, Bdate from employee where Bdate like '196%';

select Dno, Salary from employee;
select * from employee where (Salary between 30000 and 40000);
select * from employee where (Salary between 30000 and 40000) and Dno=5;

