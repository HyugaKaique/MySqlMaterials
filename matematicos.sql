-- operadores matemáticos: UNION, UNION ALL, INTERSECTION, EXCEPT 
create database matematicos;
use matematicos;

create table R(
	A char(2)
);

create table S(
	A char(2)
);

insert into R(A) values ('a1'), ('a2'), ('a2'), ('a3');
insert into S(A) values ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

-- except = not in
select * from  S where A not in (select A from R);

-- intersect
select distinct R.A from R where R.A in (select S.A from S);

-- union 
(select  R.A from R) union (select  S.A from S); -- não precisa do distinct pq o union so poem uma vez o valor repetido