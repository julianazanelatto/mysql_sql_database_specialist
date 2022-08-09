use company;

-- cláusulas de agrupamento

SELECT count(*)
FROM employee;

SELECT count(*)
FROM employee, departament
WHERE Dno = Dnumber AND Dname = 'Research';

SELECT Dno, count(*), AVG (Salary)
FROM employee
GROUP BY Dno;

SELECT Pnumber, Pname, COUNT(*)
FROM project, works_on
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname;

SELECT count(distinct Salary)
FROM employee;

SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM employee;

SELECT SUM(Salary) AS Total_Sal, MAX(Salary) AS Highest_Sal,
MIN(Salary) AS Lowest_Sal, AVG(Salary) AS Average_Sal
FROM employee;


SELECT SUM (Salary), MAX (Salary), MIN (Salary), AVG (Salary)
FROM (employee JOIN departament ON Dno = Dnumber)
WHERE Dname = ‘Research;


SELECT Lname, Fname
FROM employee
WHERE ( SELECT count(*)
		FROM dependent
		WHERE Ssn = Essn) >= 2;

--
--
-- Group by Statement
--
--

SELECT Pnumber, Pname, count(*)
FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE Pnumber = Pno AND Ssn = Essn AND Dno = 5
GROUP BY Pnumber, Pname;


SELECT Ssn, Salary,count(*) how_many FROM employee
	group by Ssn limit 3;

--
--
-- group by e having
--
--

SELECT Pnumber, Pname, count(*)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname
HAVING count(*) > 2;

SELECT Dno, count(*)
FROM employee
WHERE Salary>40000
GROUP BY Dno
HAVING count(*) > 5;


SELECT Dno, count(*) FROM employee
WHERE Salary>40000 AND Dno IN
	( SELECT Dno
	FROM employee
	GROUP BY Dno
	HAVING count(*) > 5)
GROUP BY Dno;