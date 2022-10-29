-- funções e clausulas de agrupamento
use  company;

select count(*) from employee;

select count(*) from employee, departament where Dno = Dnumber and Dname = 'Research';

select Dno, count(*), round(avg(Salary),2) as Salary_avg from employee group by Dno;

select Dno, count(*) as Number_of_Employees, round(avg(Salary),2) as Salary_avg from employee group by Dno;

select Pnumber, Pname, count(*) from project, works_on where Pnumber = Pno group by Pnumber, Pname;

select count(Salary) as total_sal, max(Salary) as Max_sal, min(Salary) as min_sal, avg(Salary) as avg_sal from employee; 
-- join sera abordada no curso 5
select SUM(Salary), max(Salary), min(Salary), avg(Salary) 
from (employee join departament on Dno = Dnumber) where Dname = 'Research';

select Fname from employee where (select count(*) from dependent where Ssn = Essn) >= 2;

select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as avg_Salary
from project, works_on, employee where Pnumber = Pno and Ssn = Essn group by Pnumber, Pname;

select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as avg_Salary
from project, works_on, employee where Pnumber = Pno and Ssn = Essn group by Pnumber order by avg(Salary) desc;

-- group by e having
select Pnumber, Pname, count(*) from project, works_on 
where Pnumber = Pno group by Pnumber, Pname having count(*) > 2;

select Dno, count(*) from employee where Salary > 30000 group by Dno having count(*) >= 2;

select Dno as Departament, count(*) as NumberOfEmployee from employee 
where Salary > 20000 
and Dno in (select Dno from employee group by Dno having count(*) >= 2)
group by Dno;