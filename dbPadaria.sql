show databases;

create database dbPadaria;

use dbPadaria;

create table Fornecedores(
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50) not null,
cnpjFornecedor varchar(20),
telefoneFornecedor varchar(20),
emailFornecedor varchar(50) not null unique,
cep varchar(9),
enderecoFornecedor varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

insert into Fornecedores (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade, estado)values
("Luiz jose", "62.164.997/0001-72", "(96)985635256", "luuzjose@gmail.com", "55038-510", "Rua Barreiros", "460", "Boa Vista", "Caruaru", "PE");

select * from Fornecedores;

create table Produtos(
idProduto int primary key auto_increment,
nomeProduto varchar(50),
decriacaoProduto text,
precoProduto decimal(10,2),
estoqueProduto int,
categoriaProduto enum("Pães", "salgado", "Bolo", "Confeitaria"),
idFornecedor int not null,
foreign key (idFornecedor) references Fornecedores(idFornecedor)
);

insert into Produtos (nomeProduto, decriacaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor)values
("Pão De Queijo", "São 24 unidades de Pão de Queijo feito com polvilho azedo, polvilho doce, leite, óleo, ovo caipira, o legítimo queijo mineiro meia cura,
um toque de queijo parmesão e sal marinho. É um pão macio por dentro com boa crocância por fora, proporcionada também pelo queijo parmesão que é polvilhado em cada um deles.", 5.50, 
100,"Pães", 1);

insert into Produtos (nomeProduto, decriacaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor)values
("Coxinha", "Massa cremosa a base de batata, superfície dourada e crocante, com o empanamento aderente à massa, recheio de peito 
de frango desfiado, com fragmentos de salsinha e cebolinha.", 5.00, 
2,"salgado", 1);


update Produtos set validadeProdutos = "2023-11-14" where idProduto;
update Produtos set pesoProduto = "0.47" where idProduto = 1;
update Produtos set ingredientesProduto = "2tabletes de caldo de galinha Sal a gosto 6colheres (sopa) de Margarina Qualy Cremosa 750gde farinha de trigo 2ovos 2xícaras (chá) de farinha de rosca" where idProduto;

select sum(quantidade * 15.30) as Total from itensPedidos inner join Produtos on itensPedidos.idProduto = 
Produtos.idProduto where idPedido = 1;



update Produtos set validadeProdutos = "2023-11-15" where idProduto;
update Produtos set pesoProduto = "0.50" where idProduto = 1;
update Produtos set ingredientesProduto = "4 copos (americanos) de polvilho doce (500 g) 1 colher (sopa) tempero ou sal a gosto 2 copos (americano) de leite (300 ml) óleo 1 copo (americano) de óleo (150 ml) ovo
2 ovos grandes ou 3 pequenos
4 copos (americano) de queijo minas meia cura ralado
óleo para untar" where idProduto;

alter table Produtos ADD column validadeProdutos datetime;
alter table Produtos ADD column pesoProduto  decimal(10,2);
alter table Produtos ADD column ingredientesProduto text;

select * from Produtos;
select *from produtos where categoriaProduto = "Pães";
select *from produtos where precoProduto < 5.00 order by precoProduto asc;


create table Clientes(
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente varchar(15) not null,
telefoneCliente varchar(20),
emailCliente varchar(50) unique,
cep varchar(9),
enderecoCliente varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

insert into Clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado)values
("Lucas Santos", "647.548.550-00", "(96)97537225", "lucas@santosgmail.com", "29152-433", "Alameda Maria Damiana", "Tucum", "Cariacica", "ES");

select * from Clientes;


       create table Pedidos(
          idPedido int primary key auto_increment,
          dataPedido timestamp default current_timestamp,
          statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
          idCliente int not null,
          foreign key (idCliente) references Clientes(idCliente)
          ); 
          
insert into Pedidos(statusPedido, idCliente) values ("Pendente", 1);
insert into Pedidos(statusPedido, idCliente) values ("Finalizado", 2);

select *from Pedidos;
select *from Pedidos inner join  Clientes on Pedidos.idCliente = Clientes.idCliente;

create table itensPedidos(
iditensPedidos int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references Pedidos(idPedido),
idProduto int not null,
foreign key (idProduto) references Produtos(idProduto),
quantidade int not null
);

describe itensPedidos;

insert into itensPedidos (idPedido, idProduto, quantidade)values (1, 1, 3);
insert into itensPedidos (idPedido, idProduto, quantidade)values (1, 2, 5);



select * from Pedidos inner join Clientes on Pedidos.idCliente = Clientes.idCliente;
select * from itensPedidos inner join Pedidos on itensPedidos.idPedido = Pedidos.idPedido;
select * from itensPedidos inner join Pedidos on itensPedidos.idPedido = Pedidos.idPedido;
select * from itensPedidos inner join Produtos on itensPedidos.idPedido = Produtos.idProduto;

/*OBJETIVO: consultar qual cliente abriu um pedido e o que ele comprou de itens nesse pedido, ou seja, quais produto 
e quanto de cada um
QUEM COMPROU? QUANDO COMPROU? O QUE COMPROU? QUANTO COMPROU?  */
 
 