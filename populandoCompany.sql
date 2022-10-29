-- inserção de dados no db company
use company;
show tables;
select * from employee;
insert into employee values ('John', 'B',  123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5); 

insert into employee values ('Franklin', 'T',  333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 123456789, 5),
							('Alicia', 'J',  999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
                            ('Jennifer', 'S',  987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, null, 4),
                            ('Ramesh', 'K',  666884444, '1962-09-15', '975-Fire-Oak-Mumble-TX', 'M', 38000, 987654321, 5),
                            ('Joyce', 'A',  453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
                            ('Ahmad', 'V',  987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 123456789, 4),
                            ('James', 'E',  888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, 333445555, 1);
						
insert into dependent values(333445555, 'Alice', 'F', '1986-04-05','Daughter'),
							(333445555, 'Theodore', 'M','1983-10-25','Son'),
                            (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                            (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                            (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                            (123456789, 'Alice', 'F', "1988-12-30", 'Daughter'),
                            (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
                            
insert into departament values('Research', 5, 333445555, '1988-05-22', '1986-05-22'),
							  ('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
                              ('Headquarters', 1, 888665555, '1981-06-19', '1980-06-19');
                              
insert into dept_location values(1,'Houston'),
								(4,'Stafford'),
								(4,'Bellaire'),
								(5,'Sugarland'),
								(5,'Houston');	
                                
insert into project values('ProductX', 1, 'Bellaire', 5),
						  ('ProductY', 2, 'Sugarland', 5),
						  ('ProductZ', 3, 'Houston', 5),
						  ('Computerization', 10, 'Stafford', 4),
                          ('Reorganization', 20, 'Houston', 1),
						  ('Newbenefits', 30, 'Stafford', 4);
                          
insert into works_on values(123456789, 1, 31.5),
						   (123456789, 2, 7.5),
                           (666884444, 3, 40.0),
                           (453453453, 1, 20.0),
                           (453453453, 2, 20.0),
                           (333445555, 2, 10.0),
                           (333445555, 3, 10.0),
                           (333445555, 10, 10.0),
                           (333445555, 20, 10.0),
                           (999887777, 30, 30.0),
                           (999887777, 10, 10.0),
                           (987987987, 10, 35.0),
                           (987987987, 30, 5.0),
                           (987654321, 30, 20.0),
                           (987654321, 20, 15.0),
                           (888665555, 20, 0.0);

select * from employee;

-- gerente e seu dempartamento
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- recuperando dependentes dos empregados
select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;
--
select Bdate, Address from employee where Fname = 'John' and Minit = 'B'; 

-- recuperando departamento específico 
select * from departament where Dname = 'Research';

select Fname, Address from employee, departament where Dname = 'Research' and Dnumber = Dno;

select Pname, Essn, Fname, Hours from project, works_on, employee where Pnumber = Pno and Essn = Ssn;

-- retirando ambiguidade 
select Dname, l.Dlocation as Departament_name from departament as d, dept_location as l where d.Dnumber = l.Dnumber; 