
create database aula_bd1;
use aula_bd1;
create Table Pais(
sigla varchar(3) not null,
nome varchar(15) not null,

constraint pk_Pais Primary key (sigla)
);
Create Table Cidade (

codigo int not null,

nome varchar(30) not null,

Uf varchar(2) not null,

Pais varchar(3) not null,



CONSTRAINT pk_Cidade PRIMARY KEY(codigo),

CONSTRAINT fk_Cidade_Pais FOREIGN KEY (Pais) REFERENCES Pais(sigla)

);



Create Table Cliente (

codigo int not null,

nome varchar(40) not null,

tipo char(2) not null,

contato varchar(30),

cargo varchar(30),

endereco varchar(50) not null,

cidade int not null,

cep varchar(10),

fone varchar(16),

fax varchar(16),

obs text,



CONSTRAINT pk_Cliente PRIMARY KEY (codigo),

CONSTRAINT ck_Cliente_Tipo CHECK (tipo IN ('PF','PJ')),

CONSTRAINT fk_Cliente_Cidade FOREIGN KEY (cidade)REFERENCES Cidade(codigo)

);



Create Table Tipo (

codigo int not null,

nome varchar(15) not null,

descricao text,



CONSTRAINT pk_Tipo PRIMARY KEY (codigo)

);



-- Drop Table Produto



Create Table Produto (

codigo int not null,

nome varchar(40) not null,

descricao varchar(45) not null,

apresent varchar(30),

venda numeric(6,2) not null,

custo numeric(6,2) not null,

quantest int not null,

estmin int,

tipo int not null,

situacao char(1),



CONSTRAINT pk_Produto PRIMARY KEY (codigo),

CONSTRAINT un_Nome_Produto UNIQUE (nome),

CONSTRAINT fk_Produto_Tipo FOREIGN KEY (tipo) REFERENCES Tipo(codigo),

CONSTRAINT ck_Produto_Situacao CHECK (situacao IN ('N','S','D'))

);



Create Table Funcao (

codigo int not null,

nome varchar(30) not null,

gratific numeric (6,2) not null,



CONSTRAINT pk_Funcao PRIMARY KEY (codigo),

CONSTRAINT un_Nome_Funcao UNIQUE (nome)

);



Create Table Setor (

sigla char(3) not null,

nome varchar(30)not null,

ramal int,

chefe int,



CONSTRAINT pk_Setor PRIMARY KEY (sigla),

CONSTRAINT un_Nome_Setor UNIQUE (nome)

);





Create Table Funcionario (

codigo int not null,

nome varchar(40) not null,

sexo char(1) not null,

estcivil char(1) not null,

rg varchar(15) not null,

cpf varchar(12) not null,

datanasc datetime not null,

naturalidade int not null,

dataadm datetime not null,

endereco varchar(40) not null,

complemento varchar(20),

bairro varchar(20),

cidade int not null,

cep varchar(10),

fone varchar(10),

celular varchar(10),

funcao int not null,

setor char(3) not null,

salario numeric (6,2),

email varchar(40),

Obs text,



CONSTRAINT pk_Funcionario PRIMARY KEY (codigo),

CONSTRAINT ck_Funcionario_Sexo CHECK ( sexo IN ('M','F')),

CONSTRAINT ck_Funcionario_EstCivil CHECK ( estcivil IN ('S','C', 'D', 'V', 'O')),

CONSTRAINT un_Funcionario_Rg UNIQUE (rg),

CONSTRAINT un_Funcionario_Cpf UNIQUE (cpf),

CONSTRAINT fk_Funcionario_Natural_Cidade FOREIGN KEY (naturalidade) REFERENCES Cidade (codigo),

CONSTRAINT fk_Funcionario_Cidade FOREIGN KEY (cidade) REFERENCES Cidade (codigo),

CONSTRAINT fk_Funcionario_Funcao FOREIGN KEY (funcao) REFERENCES Funcao (codigo),

CONSTRAINT fk_Funcionario_Setor FOREIGN KEY (setor) REFERENCES Setor (sigla)

);



Create Table Pedido (

codigo int not null,

cliente int not null,

vendedor int not null,

dataPedido datetime not null,

dataFatura datetime,

via char(1),

frete numeric(6,2),



CONSTRAINT pk_Pedido PRIMARY KEY (codigo),

CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (cliente) REFERENCES Cliente (codigo),

CONSTRAINT fk_Pedido_Funcionario FOREIGN KEY (vendedor) REFERENCES Funcionario (codigo),

CONSTRAINT ck_via_pedido CHECK (via IN ('A','T','M'))

);



-- Drop table Itens



Create Table Itens (

pedido int not null,

produto int not null,

preco numeric (6,2),

quant int not null,

desconto decimal(4,1) not null,



CONSTRAINT pk_Itens PRIMARY KEY (pedido,produto),

CONSTRAINT fk_Itens_Pedido FOREIGN KEY (pedido) REFERENCES Pedido (codigo),

CONSTRAINT fk_Itens_Produto FOREIGN KEY (produto) REFERENCES Produto (codigo)

) 
 SELECT * FROM Pais;

Insert Into Pais Values ('BRA','Brasil');

Insert Into Pais Values ('ARG','Argentina');

Insert Into Pais Values ('ALE','Alemanha');

Insert Into Pais Values ('CHI''Chile') ;



select * from Cidade;



Insert Into Cidade Values (1, 'Joao Pessoa', 'PB', 'BRA');

Insert Into Cidade Values (2, 'Campina Grande', 'PB', 'BRA');

Insert Into Cidade Values (3, 'Recife', 'PE', 'BRA');

Insert Into Cidade Values (4, 'Buenos Aires', 'BA', 'ARG');

Insert Into Cidade Values (5, 'Santiago', 'ST', 'CHI');

Insert Into Cidade Values (6, 'Hamburgo', 'HB', 'ALE');

Insert Into Cidade Values (7, 'Rio de Janeiro', 'RJ', 'BRA');



-- SELECT * FROM Cliente

Insert Into Cliente (codigo, nome, tipo, contato, cargo, endereco, cidade, cep, fone) Values (1, 'Maria Helena Ferreira', 'PF', 'Helena', 'Medica', 'R. das Flores, 33, Manaira', '1', '58.045-002', '3225-6987');

Insert Into Cliente (codigo, nome, tipo, contato, cargo, endereco, cidade, cep, fone) Values (2, 'João Paulo Correia', 'PF', 'Paulo', 'Advogado', 'R. das Acacias, 920, Bessa', '1', '58.037-255', '3245-8999');

Insert Into Cliente (codigo, nome, tipo, contato, cargo, endereco, cidade, cep, fone) Values (3, 'Larissa Maia', 'PF', 'Larissa', 'Estudante', 'R. das Flores, 95, Manaira', '1', '58.045-002', '3227-9622');

Insert Into Cliente (codigo, nome, tipo, contato, cargo, endereco, cidade, cep, fone) Values (4, 'Marcos Andrade', 'PF', 'Marcos', 'Analista de Sistemas', 'Av. Juruá, 95', '2', '58.000-00', '3338-2100');

Insert Into Cliente (codigo, nome, tipo, endereco, cidade, cep, fone) Values (5, 'LT Comércio', 'PJ', 'Av. Ingá, 97', '3', '56.000-00', '3256-9981');

Insert Into Cliente (codigo, nome, tipo, endereco, cidade, cep, fone) Values (6, 'JR Representações', 'PJ', 'Av. Maracatu, 665', '7', '21.654-00', '5841-9871');



-- SELECT * FROM Tipo

Insert Into Tipo (codigo, nome) Values (1, 'Lacticinios');

Insert Into Tipo (codigo, nome) Values (2, 'Tecidos');

Insert Into Tipo (codigo, nome) Values (3, 'Alimentacao');

Insert Into Tipo (codigo, nome) Values (4, 'Cama');

Insert Into Tipo (codigo, nome) Values (5, 'Decoracao');

Insert Into Tipo (codigo, nome) Values (6, 'Eletro');



-- SELECT * FROM Produto

Insert Into Produto Values (1, 'Toalhas Artex', 'Conjunto de Toalhas', 'Toalha Kings', 210, 125, 50, 25, 4, 'N');

Insert Into Produto Values (2, 'Iogurte Nestle', 'Conjunto com 6 potes de Iogurte', 'Danoninho', 3.20, 1.35, 200, 150, 1, 'N');

Insert Into Produto Values (3, 'Abajur Alist', 'Abajur de vidro e cristal', 'Abajur', 364, 290, 12, 6, 5, 'S');

Insert Into Produto Values (4, 'TV Plasma', 'TV de Plasma 42 polegadas', 'TV Plasma', 3.654, 2.650, 12, 9, 6, 'N');

Insert Into Produto Values (5, 'Liquidificador', 'Liquidificador Arno 6', 'Liquidificador Demais', 92, 58, 150, 100, 6, 'S');

Insert Into Produto Values (6, 'Computador Positivo', 'Computador Pentium IV', 'Positivo PIV', 1.980, 1.600, 24, 13, 6, 'D');

Insert Into Produto Values (7, 'Pizza Sadia', 'Pizza tamanho medio Sadia', 'Pizza Sadia', 6.90, 4.10, 541, 200, 3, 'N');



-- SELECT * FROM Funcao	

Insert Into Funcao Values (1, 'Vendedor', 200 );

Insert Into Funcao Values (2, 'Auxiliar de Caixa', 126);

Insert Into Funao Values (3, 'Gerente', 500);

Insert Into Funcao Values (4, 'Seguranca', 300);



-- SELECT * FROM Setor

Insert Into Setor (Sigla, nome) Values ('COV', 'Compra e Venda');

Insert Into Setor (Sigla, nome) Values ('MKT', 'Marketing');

Insert Into Setor (Sigla, nome) Values ('SEG', 'Seguranca');

Insert Into Setor (Sigla, nome) Values ('ADM', 'Administracao');



-- SELECT * FROM Funcionario

Insert Into Funcionario (codigo, nome, sexo, estcivil, rg, cpf, datanasc, naturalidade, dataadm, endereco, bairro, cidade, funcao, setor, salario ) Values (1, 'Joao da Silva', 'M', 'S', '2541399', '04598722354', '1978-02-05', 1,'2017-06-09', 'R. Uire, 98', 'Tambaú', 1, 1, 'COV', 250);

Insert Into Funcionario (codigo, nome, sexo, estcivil, rg, cpf, datanasc, naturalidade, dataadm, endereco, bairro, cidade, funcao, setor, salario ) Values (2, 'Maria de Souza', 'F', 'C', '0145687', '24598711200', '1970-01-01', 3, '2005-09-08', 'R. Umbuzeiro, 12', 'Manaíra', 1, 2, 'MKT', 300);

Insert Into Funcionario (codigo, nome, sexo, estcivil, rg, cpf, datanasc, naturalidade, dataadm, endereco, bairro, cidade, funcao, setor, salario ) Values (3, 'Luiza Costa', 'F', 'C', '2185411', '36574100296', '1980-04-04', 7, '1999-05-01', 'A. Esperança, 91', 'Bessa', 1, 3, 'ADM', 950);

Insert Into Funcionario (codigo, nome, sexo, estcivil, rg, cpf, datanasc, naturalidade, dataadm, endereco, bairro, cidade, funcao, setor, salario, email ) Values (4, 'Francisco da Silva', 'M', 'D', '0584132', '01487933587', '1989-06-03', 6, '2002-08-05', 'Av. Fagundes, 05', 'Mangabeira', 1, 4, 'SEG', 390, 'franc@uol.com.br');

Insert Into Funcionario (codigo, nome, sexo, estcivil, rg, cpf, datanasc, naturalidade, dataadm, endereco, bairro, cidade, funcao, setor, salario, email ) Values (5, 'Carla Tavares', 'F', 'C', '2987411', '36544800298', '1969-01-08', 5, '1992-03-01', 'R. Uire, 154','Tambaú', 1, 2, 'COV', 290, 'carla@gmail.com');



SELECT * FROM Pedido;

Insert Into Pedido Values (1, 2, 1, '2017-05-09', '2015-06-01', 'T',1200);

Insert Into Pedido Values (2, 5, 1, '2007-01-12', '2015-02-12', 'A',100);

Insert Into Pedido Values (3, 6, 2, '2016-10-02', '2016-11-11', 'A',254);

Insert Into Pedido Values (4, 3, 2, '2017-01-01', '2016-01-01', 'A',569);

Insert Into Pedido Values (5, 1, 2, '2016-12-05', '2016-12-05', 'M',0);

Insert Into Pedido Values (6, 4, 3, '2016-03-09', '2016-03-09', 'M',0);

Insert Into Pedido Values (7, 1, 2, '2016-08-08', '2016-09-09', 'T',169);

Insert Into Pedido Values (8, 6, 4, '2017-03-02', '2017-03-09', 'M',0);

Insert Into Pedido Values (9, 1, 3, '2016-07-07', '2017-07-08', 'A',950);

Insert Into Pedido Values (10, 1, 2, '2017-06-02', '2017-06-02', 'M',0);

Insert Into Pedido Values (11, 6, 3, '2017-12-02', '2017-12-03', 'T',0);

Insert Into Pedido Values (12, 1, 2, '2017-10-10', '2017-11-01', 'M',658);

Insert Into Pedido Values (13, 4, 1, '2017-11-11', '2017-11-11', 'M',0);

Insert Into Pedido Values (14, 4, 2, '2018-01-12', '2018-01-01', 'T',126);

Insert Into Pedido Values (15, 6, 2, '2018-01-10', '2018-02-01', 'A',1500);

Insert Into Pedido Values (16, 1, 4, '2018-08-05', '2018-08-05', 'T',0);

Insert Into Pedido Values (17, 6, 4, '2018-07-10', '2018-07-10', 'T',0);

Insert Into Pedido Values (18, 2, 3, '2018-07-01', '2018-07-01', 'T',0);

Insert Into Pedido Values (19, 6, 2, '2018-06-12', '2018-06-12', 'T',0);

Insert Into Pedido Values (20, 5, 1, '2018-08-01', '2018-08-02', 'T',0);

Insert Into Pedido Values (21, 3, 3, '2018-11-05', '2018-11-05', 'M',147);

Insert Into Pedido Values (22, 3, 2, '2018-12-10', '2018-12-10', 'A',1900);

Insert Into Pedido Values (23, 1, 2, '2011-01-03', '2011-01-03', 'T',0);

Insert Into Pedido Values (24, 6, 2, '2011-01-01', '2011-10-01', 'T',0);

Insert Into Pedido Values (25, 4, 1, '2011-02-02', '2011-10-10', 'A',120);



-- SELECT * FROM Itens

Insert Into Itens Values (1, 2, 32, 10, 0.2);

Insert Into Itens Values (1, 3, 364, 1, 0.15);

Insert Into Itens Values (2, 1, 420, 2, 0.1);

Insert Into Itens Values (3, 5, 92, 1, 0.1);

Insert Into Itens Values (4, 7, 20.7, 3, 12.6);

Insert Into Itens Values (5, 1, 240, 1, 0.1);

Insert Into Itens Values (6, 1, 660, 3, 0.1);

Insert Into Itens Values (6, 4, 3.654, 1, 0.2);

Insert Into Itens Values (7, 4, 7.308, 2, 0.2);

Insert Into Itens Values (8, 7, 6.90, 1, 1.3);

Insert Into Itens Values (8, 2, 320, 1, 1.3);

Insert Into Itens Values (9, 1, 630, 3, 1.4);

Insert Into Itens Values (10, 1, 210, 1, 0.2);

Insert Into Itens Values (11,5, 92, 1, 0.0);

Insert Into Itens Values (12, 1, 210, 1, 0.2);

Insert Into Itens Values (13, 7, 13.80, 2, 0.0);

Insert Into Itens Values (14, 7, 6.90, 1, 0.0);

Insert Into Itens Values (15, 4, 3.654, 1, 0.2);

Insert Into Itens Values (16, 7, 3.9, 1, 0.2);

Insert Into Itens Values (17, 1, 14.95, 6, 0.0);

Insert Into Itens Values (18, 2, 2845, 2, 0.0);

Insert Into Itens Values (19, 7, 58.951, 3, 0);

Insert Into Itens Values (20, 4, 956, 5, 1.0);

Insert Into Itens Values (21, 4, 956, 5, 1.0);

Insert Into Itens Values (22, 7, 6.90, 1, 0);

Insert Into Itens Values (23, 1, 630, 3, 1.4);

Insert Into Itens Values (24, 7, 20.7, 3, 12.6);

Insert Into Itens Values (25, 2, 32, 10, 0.2);

Insert Into Itens Values (26, 2, 845, 2, 0.1);
















