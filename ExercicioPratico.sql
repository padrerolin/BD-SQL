create database ElmanoNevesJR;
use elmanonevesjr;

create table vendedor (
	id int,
	nome varchar(50),
	salario decimal(7.2),
	telefone char(10),
	primary key (id)
	);
    create table cliente (
    codigo int,
    nome varchar(100),
    endereco varchar(100),
    cpf char(11),
    telefone char(11),
    tipo varchar(40),
    primary key(codigo),
    unique (cpf)
    );
    create table pedido(
    numPedido int,
    codigoCliente int,
    codigoVendedor int,
    tipo varchar(40),
    dataEmbarque date,
    dataEntrega date,
    valorTotal DECIMAL(10,2),
    desconto DECIMAL(5,2),
    primary key(numPedido),
    constraint FK_clientePedido foreign key (codigoCliente) references cliente (codigo),
    constraint FK_vendedorPedido foreign key (codigoVendedor) references vendedor (id)
    
    );
    create table produto(
    codigo int,
    nome varchar(100),
    preco decimal(10,2),
    codigoFabricante char(4),
    primary key (codigo)
    
    );
    
    -- Questão 1:
    alter table produto drop column codigoFabricante;
    -- Questão 2:
    alter table pedido rename to tb_pedido;
    alter table cliente rename to tb_cliente;
    alter table produto rename to tb_produto;
    alter table vendedor rename to tb_vendedor;
    -- Questão 3:
    alter table tb_vendedor modify telefone varchar(15) not null;
    alter table tb_cliente modify telefone varchar(15) not null;
    -- Questão 4:
    alter table tb_pedido add column codproduto int;
    -- Questão 5:
    alter table tb_produto modify preco decimal (7,2);
    -- Questão 6:
    alter table tb_pedido add constraint fk_pedido_produto foreign key (codproduto) references tb_produto (codigo);
	
    -- Questão 7:
    insert into tb_cliente (codigo,nome,endereco,cpf,telefone,tipo) values (1,"Carlos Eduardo","Rua Maximiano de Figueiredo","22288899912","(83)9999-8877","padrão"),
    (2,"Juliana Costa","Avenida Marechal Deodoro","87698709811","(11)8769-2454","Padrão");
    
    -- Questão 8:
    select nome,codigo from tb_produto where preco < 150 or preco > 500;
    
    -- Questão 9:
    update tb_cliente set nome = "Carlos Eduardo Almeida" where cpf ="22288899912";
    
	-- Questão 10:
    drop database elmanonevesjr;
    
    
    
    
    
    