create database Rede_Social;

use Rede_Social;

create table Usuario (
id_Usuario VARCHAR(20), 
senha VARCHAR(15),
nome VARCHAR(50),
data_nasc DATETIME,
cpf_cnpj NUMERIC(14),
is_administrador BOOLEAN,
rg VARCHAR(13),
telefone INT,
foto_path TEXT,
id_Classificacao INT,
is_confirmado BOOLEAN,
PRIMARY KEY (id_Usuario)
);

create table Classificacao_Anuncio(
id_Classificacao INT,
nome VARCHAR(50),
classificacao INT,
descricao TEXT,
primary key(id_Classificacao));


create table Usuario_Classificou_Anuncio(
id_Usuario_Origem VARCHAR(20),
id_Anuncio_Destino INT,
id_Classificacao INT,
data_inicio DATETIME,
primary key(id_Usuario_Origem, id_Anuncio_Destino),
constraint fk_id_classificacao foreign key (id_Classificacao) references Classificacao_Anuncio (id_Classificacao)
);
alter table Usuario add column data_inicio DATETIME;
alter table Usuario_Classificou_Anuncio add constraint fk_Usuario_Origem foreign key (id_Usuario_Origem) references Usuario (id_Usuario);


CREATE TABLE Mensagem (
	id_Mensagem INT,
	id_Usuario_Rem VARCHAR(20),
	id_Usuario_Dest VARCHAR(20),
	data_mensagem DATETIME NOT NULL,
	texto_mensagem TEXT NOT NULL,
	titulo_mensagem VARCHAR(50),
	assunto_mensagem VARCHAR(50),
	PRIMARY KEY (id_Mensagem),
	FOREIGN KEY (id_Usuario_Rem) REFERENCES Usuario (id_Usuario),
	FOREIGN KEY (id_Usuario_Dest) REFERENCES Usuario (id_Usuario)
);
CREATE TABLE Favorito (
	id_Usuario_Origem VARCHAR(20),
	id_Usuario_Destino VARCHAR(20),
	data_inicio DATETIME,
	PRIMARY KEY (id_Usuario_Origem,id_Usuario_Destino),
    constraint fk_Usuario_Favorito_Origem foreign key (id_Usuario_Origem) references Usuario (id_Usuario),
    constraint fk_Usuario_Favorito_Destino foreign key (id_Usuario_Destino) references Usuario (id_Usuario)
);

create table Amigo (
id_Usuario_Origem VARCHAR(20),
id_Usuario_Destino VARCHAR(20),
is_confirmado BOOLEAN,
data_inicio DATETIME,
data_confirmado DATETIME,
primary key(id_Usuario_Origem,id_Usuario_Destino),
constraint fk_Usuario_Amigo_Origem foreign key (id_Usuario_Origem) references Usuario(id_Usuario),
constraint fk_Usuario_Amigo_Destino foreign key (id_Usuario_Destino) references Usuario(id_Usuario)
);

create table Classificacao_Usuario(
id_Classificacao INT,
nome VARCHAR(50),
classificacao INT,
descricao TEXT,
primary key(id_Classificacao),
constraint fk_Classificacao_Usuario foreign key (id_Classificacao) references Usuario (id_Classificacao)
);
create table Usuario_Classificou_Usuario(
id_Usuario_Origem VARCHAR(20),
id_Usuario_Destino VARCHAR(20),
id_Classificacao int,
data_inicio DATETIME,
primary key (id_Usuario_Origem,id_Usuario_Destino),
constraint fk_Usuario_Classificou_Origem foreign key (id_Usuario_Origem) references Usuario (id_Usuario),
constraint fk_Usuario_Classificou_Destino foreign key (id_Usuario_Destino) references Usuario (id_Usuario),
constraint fk_id_classificacao_Usuario foreign key (id_Classificacao) references Classificacao_Usuario (id_Classificacao)
);
create table Categoria_Anuncio(
id_Categoria INT,
nome VARCHAR(50),
descricao TEXT,
primary key(id_Categoria)
);

create table Anuncio (
id_Anuncio INT,
id_Categoria INT,
id_Usuario VARCHAR(20),
id_Classificacao INT,
nome VARCHAR(50),
data_inicio DATETIME,
descricao TEXT,
primary key (id_Anuncio),
CONSTRAINT fk_Categoria_Anuncio foreign key (id_Categoria) references Categoria_Anuncio(id_Categoria),
CONSTRAINT fk_Usuario_Usuario foreign key (id_Usuario) references Usuario (id_Usuario),
CONSTRAINT fk_Classificacao_Anuncio foreign key (id_Classificacao) references Classificacao_Anuncio (id_Classificacao)
);
create table Anuncio_Foto(
id_Anuncio_Foto int,
id_Anuncio INT,
foto_path TEXT,
primary key(id_Anuncio_Foto),
constraint fk_anuncio_id foreign key (id_Anuncio) references Anuncio (id_Anuncio)

);
-- INSERT COMEÇANDO AQUI
insert into Usuario 
(id_Usuario, senha, nome, data_nasc,cpf_cnpj,is_administrador,data_inicio,rg,telefone,foto_path,id_classificacao,is_confirmado) 
values ('1','fabio123','Fabio Belmont','1980/01/20',12345689787,1,'2015/04/20',12548796,994568736,'cara_do_belmont.jpg',100,1),
('2','cand123','Candice Lopes','1988/01/29',12345689788,1,'2018/02/22',12548786,994564569,'cara_da_candice.jpg',200,1),
('3','Lucas123','Lucas Alves','1994/03/18',12345689712,1,'2019/01/01',12544872,989756218,'cara_do_lucas.jpg',300,1),
('4','el123','Elmano Neves','1999/04/14',12345656941,1,'2020/01/20',12556214,994561548,'cara_do_elmano.jpg',400,1),
('5','marcos123','Marcos Lacerda','1975/08/20',12345645872,1,'2010/04/28',124458769,994574569,'cara_do_marcos.jpg',500,1),
('6','gui123','Guilherme Medeiros','1995/06/14',12345475216,1,'2012/02/21',12758967,994567453,'cara_do_guilherme.jpg',600,1),
('7','ana123','Ana Carla','1999/06/20',12345654712,1,'15/05/14',12554756,994564120,'cara_da_ana.jpg',700,1),
('8','ruan123','Ruan Zaydan','1998/02/20',12345204876,1,'2012/04/13',17548213,994412367,'cara_do_ruan.jpg',800,1),
('9','pedro123','Pedro Cicero','1980/02/21',12345612048,0,'2012/01/12',12541230,994120546,'cara_do_pedro.jp',900,0),
('10','marilia123','Marilia Mendonça','1980/02/22',12344517569,0,'2018/04/12',12412785,994625478,'cara_da_marilia.jpg',1000,0);

insert into classificacao_anuncio (id_Classificacao,nome,classificacao,descricao) values (10,'post',10,'postagem da rede social'),
(11,'banner',11,'banners impressos'),(12,'release'	'materia do jornal'),
(13,'VT',13,'Video para TV'),(14,'SPOT',14,'Radio'),(15,'outdoor',15,'Painel Lona'),
(16,'Panfleto',16,'Panfletagem'),(17,'Folder',17,'Impresso com dados'),(18,'Jingle',18,'Trilha Sonora'),
(19,'Links patrocinados',19,'AD'),(20,'E-mail marketing',20,'Compartilhamento por E-mail');

insert into usuario_classificou_anuncio (id_Usuario_Origem,id_Anuncio_Destino,id_Classificacao,data_inicio) 
values('1',001,10,'2020/10/11'),('2',002,11,'2020/01/02'),('3',003,12,'2020/01/15'),('4',004,13,'2020/01/22'),
('5',005,14,'2020/02/01'),('6',006,15,'2020/02/22'),('7',007,16,'2020/02/28'),('8',008,17,'2020/02/23'),
('9',009,18,'2020/03/01'),('10',010,19,'2020/03/25');

insert into mensagem (id_Mensagem,id_Usuario_Rem,id_Usuario_Dest,data_mensagem,texto_mensagem,titulo_mensagem,assunto_mensagem) 
values (0001,1,2,'2020/04/14','Bom dia, pague o que esta me devendo','Banco','Cobranças'),
(0002,2,3,'2021/03/22','Flamengo venceu','Noticia Boa','Flamengo'),
(0003,3,4,'2021/08/05','Parabens pela nota boa','Felicitações','Notas boas'),
(0004,4,5,'2021/09/22','Não esqueça de pagar a Unipê','Lembre','Unipê'),
(0005,5,6,'2021/09/23','Me passa o zap daquela menina','Desesperado','zapzap'),
(0006,6,7,'2021/09/30','Vamos assistir aula no discord hoje','Aula','querendo companhia'),
(0007,7,8,'2021/10/01','Bora no bar hoje tomar uma','Sextou','querendo sair'),
(0008,8,9,'2021/10/05','To precisando de dinheiro','Ei amigo','Dinheiro'),
(0009,9,10,'2021/11/25','Sabado tem o flamengo sendo campeão','Bora assistir','Libertadores'),
(0010,10,2,'2021/03/25','Fiquei sabendo que você ta devendo dinheiro pro Belmont, já pagasse ? ','Ta precisando de ajuda ?','Dinheiro');

insert into favorito (id_Usuario_Origem, id_Usuario_Destino, data_inicio) values (1,2,'2021/01/01'),(2,3,'2021/01/05'),(3,4,'2021/01/12'),
(5,8,'2021/01/22'),(6,9,'2021/01/29'),(8,10,'2021/02/01'),(10,4,'2021/02/14'),(9,6,'2021/02/28'),(1,9,'2021/03/10'),(1,8,'2021/03/22');

insert into amigo (id_Usuario_Origem, id_Usuario_Destino, is_confirmado, data_inicio, data_confirmado) values (1,2,1,'2021/01/02','2021/01/03'),
(2,1,1,'2021/01/03','2021/01/03'),(3,5,0,'2021/01/10','2021/01/12'),(5,3,1,'2021/01/12','2021/01/20'),
(6,3,1,'2021/02/01','2021/02/02'),(5,8,1,'2021/02/05','2021/02/06'),(9,10,1,'2021/03/04','2021/03/05'),
(7,9,0,'2021/03/15','2021/03/18'),(10,8,1,'2021/04/15','2021/04/16'),(8,9,1,'2021/04/14','2021/04/16');


insert into classificacao_usuario (id_Classificacao, nome, classificacao, descricao) values (100,'Fabio Belmont',10,'Avaliação de Usuario de 1 ate 10'),
(300,'Lucas Alves',7,'Avaliação de Usuario de 1 ate 10'),(200,'Candice Lopes',9,'Avaliação de Usuario de 1 ate 10'),
(400,'Elmano Neves',8,'Avaliação de Usuario de 1 ate 10'),(500,'Marcos Lacerda',9,'Avaliação de Usuario de 1 ate 10'),
(600,'Guilherme Medeiros',10,'Avaliação de Usuario de 1 ate 10'),(700,'Ana Carla',7,'Avaliação de Usuario de 1 ate 10'),
(800,'Ruan Zaydan',9,'Avaliação de Usuario de 1 ate 10'),(900,'Pedro Cicero',7,'Avaliação de Usuario de 1 ate 10'),
(1000,'Marilia Mendonça',10,'Avaliação de Usuario de 1 ate 10');



insert into usuario_classificou_usuario (id_Usuario_Origem, id_Usuario_Destino, id_Classificacao,data_inicio) values (1,3,300,'2021/04/01'),
(2,1,100,'2021/04/05'),(3,4,400,'2021/04/12'),(5,2,200,'2021/04/25'),(7,5,500,'2021/04/26'),(10,6,600,'2021/04/27'),
(5,7,700,'2021/04/29'),(9,8,800,'2021/05/03'),(1,10,1000,'2021/05/20'),(5,9,900,'2021/05/25');

insert into categoria_anuncio (id_Categoria,nome,descricao) values (10,'post','postagem da rede social'),
(11,'banner','banners impressos'),(12,'release','materia do jornal'),(13,'VT','Video para TV'),(14,'release','materia do jornal'),
(15,'outdoor','painel lona'),(16,'panfleto','panfletagem'),(17,'Folder','Impresso com dados'),
(18,'Jingle','Trilha Sonora'),(19,'Links Patrocinados','AD'),(20,'E-mail marketing','Compartilhamento por E-mail');

insert into anuncio (id_Anuncio,id_Categoria,id_Usuario,id_Classificacao,nome,data_inicio,descricao) values 
(1000,10,1,10,'Sofa quase novo a VENDA','2021/01/01','Uma publicação no mural da sua rede social anunciando a venda de um sofa'),
(1001,11,2,11,'Minha Loja','2021/11/20','Banners da inauguração da sua nova loja'),
(1002,12,3,12,'Os perigos das redes sociais','2021/04/22','Uma materia no jornal sobre os perigos das redes sociais para os jovens'),
(1003,13,4,13,'Absurdo no brasil','2021/04/12','Um video para a televisão sobre como o preço da gasolina esta alto'),
(1004,14,5,14,'Inicio da minha carreira','2021/05/03','Uma transmissão de radio mostrando para todos como sua voz é bonita'),
(1005,15,6,15,'Venham para o show entrada 20 reais','2021/05/04','Um outdoor mostrando o primeiro show da sua banda de forro'),
(1006,16,7,16,'Quem trouxer o panfleto ganha desconto','2021/05/19','Panfletagem compartilhando sua nova loja de celulares'),
(1008,18,8,18,'Eu mais jovem','2021/05/12','Uma trilha sonora da pasta de dente que ele fez o comercial'),
(1009,10,9,10,'Vamos para a vaquejada','2021/06/12','Uma postagem lembrando a todos sobre o show de João Gomes'),
(1010,18,10,18,'Feliz natal para todos','2021/05/14','Uma trilha sonora natalina com sua bela voz');

insert into anuncio_foto (id_Anuncio_Foto,id_Anuncio,foto_path) values (001,1000,'Foto do meu Sofa'),
(002,1001,'Foto da entrada da minha loja'),(003,1002,'Foto da entrada da materia'),
(004,1003,'Foto do preço da gasolina'),(005,1004,'todos nos na radio'),
(006,1005,'Foto da Localização do Show'),(007,1006,'Foto do Panfleto'),
(008,1008,'Foto minha no comercial'),(009,1009,'Foto do convite para vaquejada'),
(010,1010,'Foto da marilia mendonça linda');


-- select começando aqui
-- 1 :
select * from usuario where data_nasc = 2001;
-- 2:
select count(id_Anuncio) from anuncio group by (id_Usuario);

-- 3:
select usuario.nome, usuario.data_nasc, anuncio.nome, anuncio.descricao from usuario inner join anuncio on usuario.id_Usuario = anuncio.id_Usuario order by anuncio.data_inicio asc;

-- 4:
update mensagem set texto_mensagem = "Hello World" where data_mensagem = '2001/12/30';

-- 5:
select categoria_anuncio.nome as Categoria, anuncio.nome as "Nome do anuncio", classificacao_anuncio.descricao as "Nome da classificação" from categoria_anuncio inner join anuncio inner join classificacao_anuncio on anuncio.id_Categoria = categoria_anuncio.id_Categoria and anuncio.id_Classificacao = classificacao_anuncio.id_Classificacao
where classificacao_anuncio.classificacao between 10 and 50;

-- 6:
create view V_questao6 as select usuario.nome, mensagem.texto_mensagem, anuncio.nome as "Nome do anuncio" from usuario inner join mensagem inner join anuncio on usuario.id_Usuario = anuncio.id_Usuario and usuario.id_Usuario = mensagem.id_Usuario_Rem
where usuario.id_Usuario = 9;

-- 7:
delete from mensagem where year(data_mensagem) = '2020';
 
-- 8:
delimiter //
create procedure ps_questao8(in id varchar(20))
begin
select senha,cpf_cnpj,rg from usuario where id_Usuario = id;
end //

-- 9:
select * from usuario,anuncio,categoria_anuncio;

-- 10:
select count(mensagem.id_mensagem),usuario.nome from mensagem inner join usuario on id_Usuario = id_Usuario_Rem
 group by usuario.id_Usuario;


















   -- update usuario set id_classificacao = 800 where id_Usuario = '8';



























