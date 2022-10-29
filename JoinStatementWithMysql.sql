-- case statement 
use company;

update employee set Salary = 
	case
		when Dno = 5 then Salary + 2000
		when Dno = 4 then Salary + 1500
		when Dno = 1 then Salary + 3000
        else Salary + 0
	end;
    
-- join statement
select * from employee join works_on where Ssn = Essn;  


-- join 
select * from employee join works_on;

-- join on -> inner join on
select * from employee join works_on on Ssn = Essn;  -- on = where nesse caso
select * from employee join departament where Ssn = Mgr_ssn;
select Fname, Address from (employee join departament on Dno = Dnumber) where Dname = 'Research';
select Dname as Departament, Dept_create_date as StartDate, Dlocation as Location
	from departament inner join dept_location using(Dnumber) 
    order by StartDate;

-- cross join -produto cartesiano
select * from employee cross join dependent;

-- join com mais de 3 tables
select Fname as Nome, Dno as Dept_number, Pname as ProjectName, Pno as ProjectNumber, Plocation  as Location from employee 
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
    order by Pnumber;
    
 select Dnumber, Dname, Fname as Menager, Salary, round(Salary*0.05, 2) as Bonus from departament
	inner join dept_location using(Dnumber)
    inner join(dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
    group by Dnumber;
    
-- outer join(não é obrigatório usar left and right com outer join
select * from employee inner join dependent on Ssn = Essn;
select * from employee left join dependent on Ssn = Essn;
select * from employee left outer join dependent on Ssn = Essn; 
