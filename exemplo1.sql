create database if not exists exemplo;
use exemplo;
create table Pessoa(
	idPessoa smallint unsigned,
    nomePessoa varchar(50), 
    genero enum('M','F'),
    aniversario date,
    rua varchar(30),
    cidade varchar(30),
    estado varchar(20),
    pais varchar(20),
    codigoPostal varchar(20),
    primary key(idPessoa)
);
desc Pessoa;

create table ComidaFavorita(
	idPessoa smallint unsigned,
    comida varchar(20),
    primary key(idPessoa, comida),
    foreign key(idPessoa) references Pessoa(idPessoa)
);
desc ComidaFavorita;
show databases;
insert into Pessoa values ('1', 'Kaique Lima', 'M', '2000-02-02', 'rua a', 'cidade b', 'SP', 'Brasil', '00001'),
						('2', 'Kaua Lima', 'M', '2000-11-08', 'rua a', 'cidade b', 'SP', 'Brasil', '00002');
                        
select * from Pessoa;
delete from Pessoa where idPessoa=2 or idPessoa=3;
insert into ComidaFavorita values ('1', 'Macarronada');
select * from ComidaFavorita;