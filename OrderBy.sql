-- clausulas de ordenação 
use company;

-- nome departamento, nome gerente
select distinct d.Dname, concat(e.Fname, ' ') as Manager, Address from departament as d, employee as e, works_on as w, project p
where (d.Dnumber = e.Dno and E.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber) 
order by d.Dname, e.Fname;  

-- todos empregados e seus projetos
select distinct d.Dname, concat(e.Fname, ' ') as Employee, p.Pname as Project_name, Address 
from departament as d, employee as e, works_on as w, project p
where (d.Dnumber = e.Dno and E.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber) 
order by d.Dname, e.Fname; 

select distinct d.Dname, concat(e.Fname, ' ') as Employee, p.Pname as Project_name, Address 
from departament as d, employee as e, works_on as w, project p
where (d.Dnumber = e.Dno and E.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber) 
order by d.Dname desc, e.Fname asc; 