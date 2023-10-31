show databases;

create database dbPadaria;

use dbPadaria;

create table Fornecedores(
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50),
cnpjFornecedor varchar(20),
telefoneFornecedor varchar(20),
emailFornecedor varchar(50),
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
idFornecedor int not null
);

insert into Produtos (nomeProduto, decriacaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor)values
("Pão De Queijo", "São 24 unidades de Pão de Queijo feito com polvilho azedo, polvilho doce, leite, óleo, ovo caipira, o legítimo queijo mineiro meia cura,
um toque de queijo parmesão e sal marinho. É um pão macio por dentro com boa crocância por fora, proporcionada também pelo queijo parmesão que é polvilhado em cada um deles.", 5.50, 
100,"Pães", 1);

insert into Produtos (nomeProduto, decriacaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor)values
("Coxinha", "Massa cremosa a base de batata, superfície dourada e crocante, com o empanamento aderente à massa, recheio de peito 
de frango desfiado, com fragmentos de salsinha e cebolinha.", 5.00, 
2,"salgado", 1);

select * from Produtos;

create table Clientes(
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente varchar(15),
telefoneCliente varchar(20),
emailCliente varchar(50),
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
          foreign key (idCliente) references clientes(idCliente)
          ); 
          
insert into Pedidos(statusPedido, idCliente) values ("Pendente", 1);
insert into Pedidos(statusPedido, idCliente) values ("Finalizado", 2);

select *from Pedidos;

create table itensPedidos(

);