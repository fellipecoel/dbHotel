/* Mostrar os bancos de dados existentes no servidor */
show databases;

/* Criar um novo banco */
create database dbHotel;

/*SELECIONAR O BANCO */
use dbHotel;

/* Excluir a tabela do banco */ 
drop table funcionarios;

/* Adicionar o campo email à tabela funcionarios*/
alter table funcionarios add column email varchar(50) not null;

/* Excluir um campo da tabela */
alter table funcionarios drop column email;



/* Modificar o campo email para quese torne obrigatório, ou seja, não nulo (not null) */

/* Reposicionar o campo email para que ele fique após o campo login */
alter table funcionarios modify column email varchar(50) not null after login;

alter table funcionarios modify column email varchar(500) not null after login;
/*Criar uma nova tabela*/
create table funcionarios (

 /*int se refere ao tipo do campo na tabela
 primary key determina que o campo idFunc seja uma chave primária resposável por idntificar
 cada funcionário ao_incremet determina que o MySQL dê um id novo a cada cadastro */
    idFunc int primary key auto_increment,
    /*varchar é a quantidade variável de caracteres no nome (nesse caso, até 100 caracteres)
    not null determina que o campo seja obrigatório */
    
    nomeFunc varchar (100) not null,
    
    /*unique determina que o campo seja único e o valor não possa repetir*/
    login varchar (20) not null unique,
    senha varchar (255) not null,
    cargo varchar (20)
    );
    
    /* Descreve os campos da tabela funcionarios */
    describe funcionarios;
    
    
    
    /* Mostrar as tabelas */
    show tables;
    
    /*CREATE*/
    /* inserir um novo funcionario na tabela, com nome, login, senha criptografada e cargo */
      insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");
      
    insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");
    
      insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victória Cardoso", "victóracardoso", md5("123@senac"), "RH");
      
        insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");
        
          insert into funcionarios(nomeFunc, login, senha, email) values ("Laura Lopes", "lauralopes", md5("123@senac"));
          
            insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));
          
        insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Gabriel Santos", "gabrielsantos", md5("123@senac"),"Gerência", "gabriel@santosgmail.com");      
     
        insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victor Silva ", "victorsilva", md5("123@senac"),"Gerência", "victor@silvagmail.com");
    /*READ*/
    /* Ler as informações da tabela funcionarios */
    select * from funcionarios;
    
    select * from funcionarios where cargo = 'Gerência';
     
    
    /* Buscar o login e a senha da tabela funcionarios em que login seja admin e senha seja admin*/
    select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");
    
    /* Buscar o ID e o nome do funcionario da tabela funcionarios ordenando o nome alfabeticamente (ascendente, de A a Z) */ 
    select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;
    
   
        
        /* Buscar todos os campos dos funcionarios que tenham o cargo de Gerência, ordenando alfabeticamente */
        select * from funcionarios where cargo = "Gerência" order by nomeFunc asc;
/*
Busque os campos ID com o apelido ID_Funcionario, nome com o apelido Nome-Funcionario e cargo com o apelido Cargo_Funcionario
da tabela funcionarios e ordene de forma descendente (do maior ID para o menor) */
 select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from  funcionarios order by IDFunc desc;
 
 
 
/*
ATIVIDADE: Busque os campos ID com o apelido ID_Funcionario, nome com o apelido Nome-Funcionario e cargo com o apelido Cargo_Funcionario
da tabela funcionarios e ordene de forma descendente (do maior ID para o menor) */
   
     
    /* UPDATE */
    /* Atualizar o campo login na tabela funcionarios especificando o id */
    update funcionarios set login = "fellipecoelho" where idFunc = 28;
    
    update funcionarios set cargo = "Gerência" where idFunc = 3;
    
    update funcionarios set email = "lauralopesgmail.com" where idFunc = 5;  
    
     update funcionarios set email = "brenosilva@gmail.com" where idFunc = 4;  
    
    update funcionarios set cargo = "RH" where idFunc = 5;  
    
    /* DELETE */
    delete from funcionarios where idFunc = 5;
    
    create table Quartos (
    idQuartos int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    topoCama varchar(20),
    varanda char(3)
    );
    
    describe Quartos;
    
    alter table Quartos add column numeroQuarto varchar(10) not null after andar;
    
    /* ADICIONAR COMANDOS ABAIXO */
   alter table Quartos add column cafeDaManha char(3) not null after preco; 
    alter table Quartos add column foto varchar(255) not null after descricao;
    insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não",
    "Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, confre digital,
    frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://imagens-revista.vivadecora.com.br/uploads/2019/05/quarto-de-hotel-decorado-em-cores-neutras-com-amplas-janelas.jpg", 750.90, "sim", "Queen Size", "sim");
    

    select * from Quartos;
    
    insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values 
    ("3º", "302", "Luxo", 2, "sim", "Casal", "O quarto de 23m² com piso frio, sacada com belíssima vista mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis,cofre digital, frigobar abastecido, banheiro com sacador de cabelo, amenities e mesa de trabalho.",
    "https://imagens-revista.vivadecora.com.br/uploads/2019/05/quarto-de-hotel-decorado-em-cores-neutras-com-amplas-janelas.jpg", 572.90, "sim", "King Size", "não");
    
     insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values 
    ("2º", "410", "Superior Premier", 3, "sim", "Casal", "O quarto de 23m² com piso frio, sacada com belíssima vista mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis,cofre digital, frigobar abastecido, banheiro com sacador de cabelo, amenities e mesa de trabalho.",
    "https://imagens-revista.vivadecora.com.br/uploads/2019/05/quarto-de-hotel-decorado-em-cores-neutras-com-amplas-janelas.jpg", 602.90, "sim", "Queen Size", "sim");
    

    
       select * from Quartos where situacao = "não" order by preco asc;
        select * from Quartos where cafeDaManha = "sim" and situacao = "não";
         select * from Quartos where varanda = "sim" and cafeDaManha = "sim" and situacao ="não";
          select * from Quartos where preco < 600.00 and situacao = "não";
          
          create table clientes (
          idCliente int primary key auto_increment,
          nomeCompleto varchar(100) not null,
          cpf char(14) not null unique,
		  rg char(12) not null unique,
          email varchar(50) unique,
          celular varchar(20) not null,
          numeroCartao varchar(20) not null unique,
          nomeTitular varchar(100) not null,
          validade date not null,
          cvv char(3) not null,
          checkin date not null,
          checkout date not null,
          idQuartos int not null,
          foreign key (idQuartos) references Quartos (idQuartos)
          );
        
        describe clientes;
        
        insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idQuartos) values
        ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803", "5526 4863 8286 2543", "José de Assis", "2025-03-31", "452",
        "2023-11-02 14:00:00", "2023-11-05 12:00:00", 1);
        
          
        insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idQuartos) values
        ("Luiz felipe", "839.937.519-09", "48.319.890-9", "luizfelipe@gmail.com", "(96) 99428-2803", "5530 4865 8275 2546", "Luiz felipe", "2027-03-25", "052",
        "2023-11-02 15:00:00", "2023-11-05 16:00:00", 2);
        
        select * from clientes;
        
        /* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada à tabela clientes pelo campo idQuarto */
        select * from Quartos inner join clientes
        on Quartos.idQuartos = clientes.idQuartos;
        
       /* Buscar o nome completo e o celular do cliente que alugou o quarto de número 505 */
        select clientes.nomeCompleto, clientes.celular from Quartos inner join clientes on Quartos.idQuartos = clientes.idQuartos where numeroQuarto = 505;
        
        /* Buscar o nome completo e date/horário do checkout do cliente que alugou o quarto de número 505 */
	  select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as Checkout from Quartos inner join clientes on Quartos.idQuartos where numeroQuarto = 505;

