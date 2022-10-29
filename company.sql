create schema if not exists company;
use company;
-- restrição atribuida a um domínio 
-- create domain D_num as int check(D_num > 0  and D_num < 21);

create table Company.employee(
	Fname varchar(30) not null,
    Minit char,
    Ssn char(9) not null,
    Bdate date,
    Address varchar(30),
    sex char,
    Salary decimal(10,2),
    SuperSsn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee primary key(Ssn)
);

-- sempre que atualizar, atualiza as tabelas filhas também
alter table employee 
	add constraint fk_employee
    foreign key(SuperSsn) references employee(Ssn)
    on delete set null
    on update cascade;

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key(Dnumber),
    constraint unique_name_dept unique(Dname),
    foreign key(Mgr_ssn) references employee(Ssn)
);

alter table departament drop constraint departament_ibfk_1; 

alter table departament add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn) on update cascade;


create table dept_location(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_location primary key(Dnumber, Dlocation),
    constraint fk_dept_location foreign key(Dnumber) references departament(Dnumber)
);
alter table dept_location drop constraint fk_dept_location;

alter table dept_location add constraint fk_dept_location foreign key(Dnumber) references departament(Dnumber)
	on delete cascade
	on update cascade;


create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key(Pnumber),
    constraint unique_project unique(Pname),
    constraint fk_project foreign key(Dnum) references departament(Dnumber)
);

create table works_on (
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key(Essn,Pno),
    constraint fk_employee_works_on foreign key(Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key(Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key(Essn, Dependent_name),
    constraint fk_dependent foreign key(Essn) references employee(Ssn)
);

show tables;
desc works_on; -- mostra a descricao da tabela 

select * from information_schema.table_constraints
	where constraint_schema = 'company';
    
-- expressões e alias
-- reconlhendo o valor do INSS
select Fname, Salary, Salary*0.011 from employee;
select Fname, Salary, Salary*0.011 as INSS from employee;
select Fname, Salary, round(Salary*0.011, 2) as INSS from employee;

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select * from employee e, works_on as w, project as p 
where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname ='ProductX');

select concat(Fname, ' ') as Complete_name, Salary, round(1.1*Salary,2) as increased_salary
from employee e, works_on as w, project as p
where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname ='ProductX');

select concat(Fname, ' ') as Complete_name, Salary, round(1.1*Salary,2) as increased_salary
from employee e, works_on as w, project as p
where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname ='ProductX');

-- definindo alias para legibilidade da consulta
select concat(e.Fname, ' ') as Employee_Name, e.Address from employee e, departament d
where d.Dname = 'Research' and d.Dnumber = e.Dno;

-- expressões e concatenação de string 
-- recuperando informações dos departamentos presentes em Stafford
select Dname as Departament_name, Mgr_ssn as Manager, Address from departament d, dept_location l, employee e
where d.Dnumber = l.Dnumber and Dlocation = 'Stafford';

-- recuperando todos os gerentes que trabalham em Stafford
select Dname as Departament_name, concat(Fname, ' ') as Manager from departament d, dept_location l, employee e
where d.Dnumber = l.Dnumber and Dlocation = 'Stafford' and Mgr_ssn = e.Ssn;

-- recuperando todos os gerentes, departamentos e seus nomes
select Dname as Departament_name, concat(Fname, ' ') as Manager, Dlocation from departament d, dept_location l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

select Pnumber, Dnum, Fname, Address, Bdate from departament d, project p, employee e
where d.Dnumber = p.Dnum and p.Plocation = 'Stafford' and Mgr_ssn = e.Ssn;

-- like and between
select concat(Fname, ' ') Completed_name, Dname, Address as Departament_name from employee, departament
where (Address like '%Houston%');

select Fname, Salary from employee where (Salary between 20000 and 40000); 

-- operadores lógicos and e or
select Bdate, Address from employee where Fname = 'john' and Minit = 'B';
select * from departament where Dname = 'Research' or Dname = 'Administration';
