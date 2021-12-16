create database sistema_bancario;
use sistema_bancario;
-- Criação das tabelas
create table banco (
Codigo int auto_increment,
Nome varchar(80),
primary key (Codigo)
);
create table agencia(
Cod_banco int,
Numero_agencia int not null,
Endereco varchar(80),
primary key (Numero_agencia),
foreign key (Cod_banco) references banco (Codigo)	 
);
create table cliente(
cpf char(14) not null,
Nome varchar(80) not null,
Sexo char(1),
Endereco varchar(80),
check (Sexo in('F','M')),
primary key (cpf)
);
create table conta(
Numero_conta varchar(7) not null,
Saldo float,
Tipo_conta int,
Num_agencia int not null,
primary key (Numero_conta),
foreign key (Num_agencia) references agencia (Numero_agencia)
);
create table historico(
Cpf_cliente char(14) not null,
Num_conta varchar(7) not null,
Data_inicio date,
foreign key (Cpf_cliente) references cliente (cpf) on update cascade,
foreign key (Num_conta) references conta (Numero_conta) on update cascade
);
create table telefone_cliente(
Cpf_cli char(14) not null,
Telefone varchar(13) not null,
foreign key (Cpf_cli) references cliente (cpf)
);
-- Inserindo os dados na tabela
insert into banco (Codigo,Nome) values (1,'Banco do Brasil'), (4,'CEF');

insert into agencia (Numero_agencia, Endereco, Cod_banco) values (322,'Av.Walfredo Macedo Brandao, 1139',4),(1253,'R.Bancário Sérgio Guerra,17',4);

insert into cliente (cpf,Nome,Sexo,Endereco) values ('111.222.333-44','Bruna Andrade','F','Rua José Firmino Ferreira,1050'),('666.777.888-99','Radegondes Silva','M','Av.Epitacio Pessoa,1008'),('555.444.777-33','Miguel Xavier','M','Rua Bancário Sérgio Guerra, 640');
-- Questão 7 : Modificando o registro antes de inserir os dados
update agencia set Numero_agencia = 6342 where endereco = 'Av.Walfredo Macedo Brandao, 1139';  
-- Questão 8: Modificando o registro antes de inserir os dados
alter table conta modify Numero_conta char(7) not null;

insert into conta (Numero_conta,Saldo,Tipo_conta,Num_agencia) values('11765-2',2274505,2,6342),('21010-7',310096,1,1253);

insert into historico (Cpf_Cliente,Num_conta,Data_inicio) values ('111.222.333-44','11765-2','2015-12-22'),('666.777.888-99','11765-2','2016-10-05'),('555.444.777-33','21010-7','2012-08-29');

insert into telefone_cliente (Cpf_cli,Telefone) values ('111.222.333-44','833222-1234'),('666.777.888-99','8399443-9999'),('666.777.888-99','8332332267');
-- Questão 4 :
alter table cliente add column pais char(3) default 'BRA';

-- Questão 5 :
alter table cliente add column email varchar(30);
-- Questão 6 comentanda:
-- delete from conta where Numero_conta= '86340-2'

-- Questao 9:
update cliente set email = 'radegondes.silva@gmail.com' where nome = 'Radegondes Silva';

-- Questão 10:
update conta set saldo = saldo * 1.1 where Numero_conta = '21010-7';

-- Questão 11:

update cliente set nome = 'Bruna Fernandes' where nome = 'Bruna Andrade';

-- Questão 12:
update  conta set Tipo_conta = 3 where saldo > 10000;

show create table conta;

select saldo from conta;































 


















