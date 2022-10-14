-- cláusulas de ordenação
use company;

Select Fname, Lname, Dno from employee;
Select Fname, Lname, Dno from employee order by (Dno);
Select Fname, Lname, Dno from employee order by fname, Lname;

SELECT Ssn, Salary FROM employee
	ORDER BY Salary DESC;

-- sem alias na identificação dos atributos
SELECT Dname, Lname,Fname, Pname FROM departament, employee, works_on, project
	where Dnumber = Dno and Ssn = Essn and Pno = Pnumber
	ORDER BY Dname, Lname,Fname;

-- colocando o alias
SELECT d.Dname, e.Lname, e.Fname, p.Pname FROM departament d, employee e, works_on w, project p
	where d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber
	ORDER BY Dname, Lname,Fname;

-- desc e asc atribuídos a cada atributo separadamente
SELECT d.Dname, e.Lname, e.Fname, p.Pname FROM departament d, employee e, works_on w, project p
	where d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber
	ORDER BY Dname desc, Lname asc,Fname asc;    

--
--
-- Ordenação com expressões
--
--

-- ordenando com base na posição dos atributos
SELECT * FROM employee
ORDER BY 2, 5;

-- ordenando de acordo com os três ultimos n do ssn
SELECT e.Ssn, e.Fname, e.Lname, e.Super_ssn
FROM employee e
ORDER BY RIGHT(e.Super_ssn, 3);