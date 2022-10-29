create database if not exists manipulation;
use manipulation;

create table bankAccounts (
	Id_account int auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint indentification_account_constraint unique(Ag_num, Ac_num)
);

alter table bankAccounts add LimiteCredito float not null default 500.00;
insert into bankAccounts (Ag_num,Ac_num, Saldo) values(156, 264358, 0);

create table bankClient(
	Id_client int auto_increment,
    ClientAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(50) not null,
    Endereco varchar(100) not null,
    Renda_mensal float,
    primary key(Id_client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts(Id_account) 
    on update cascade
);

insert into bankClient(ClientAccount, CPF, RG, Nome, Endereco, Renda_mensal) 
Values(1,12345678913,123465789,'Fulano', 'rua a', 6500.60);
alter table bankClient add UFF char(2) not null default 'RJ';
update bankClient set UFF = 'MG' where Nome = 'Fulano';

create table bankTransactions(
	Id_transaction int auto_increment primary key,
    Ocorrencia datetime,
    Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    Destination_account int,
    constraint fk_source_transaction foreign key(Source_account) references bankAccount(Id_account),
    constraint fk_destination_transaction foreign key(Source_account) references bankAccount(Id_account)
); 

