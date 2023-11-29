/* Banco de dados para gerenciament */


create database dbHotel;

show databases;


use dbHotel;

create table funcionarios (
    idFunc int primary key auto_increment,
    nomeFunc varchar (100) not null,
    login varchar (20) not null unique,
    senha varchar (255) not null,
    cargo varchar (20)
    );
    
    describe funcionarios;
    
      insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");
      insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI"); 
      insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victória Cardoso", "victóracardoso", md5("123@senac"), "RH");
	  insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");
	  insert into funcionarios(nomeFunc, login, senha, email) values ("Laura Lopes", "lauralopes", md5("123@senac"));
	  insert into funcionarios(nomeFunc, login, senha,email) values ("Fellipe Coelho", "fellipe", md5("123@senac"));
	  insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Gabriel Santos", "gabrielsantos", md5("123@senac"),"Gerência", "gabriel@santosgmail.com");      
      insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victor Silva ", "victorsilva", md5("123@senac"),"Gerência", "victor@silvagmail.com");
      
      select * from funcionarios;
      select * from funcionarios where cargo = 'Gerência';
      select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");
      select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;
      select * from funcionarios where cargo = "Gerência" order by nomeFunc asc;  
      select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from  funcionarios order by IDFunc desc;
 
	 create table Quartos (
	 idQuartos int primary key auto_increment,
     andar varchar(10) not null,
     tipoQuarto varchar(50) not null,
     ocupacaoMax int not null,
     disponibilidade char(3) not null,
     nome varchar(50) not null,
     descricao text,
     cafeDaManha char (3) not null,
     precoCafe decimal (10,2),
     preco decimal(10,2) not null,
     topoCama varchar(20),
     varanda char(3)
     );
    
     describe Quartos;
     
	 insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values 
    ("3º", "302", "Luxo", 2, "sim", "Casal", "O quarto de 23m² com piso frio, sacada com belíssima vista mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis,cofre digital, frigobar abastecido, banheiro com sacador de cabelo, amenities e mesa de trabalho.",
    "https://imagens-revista.vivadecora.com.br/uploads/2019/05/quarto-de-hotel-decorado-em-cores-neutras-com-amplas-janelas.jpg", 572.90, "sim", "King Size", "não");
     insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values 
    ("2º", "410", "Superior Premier", 3, "sim", "Casal", "O quarto de 23m² com piso frio, sacada com belíssima vista mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis,cofre digital, frigobar abastecido, banheiro com sacador de cabelo, amenities e mesa de trabalho.",
    "https://imagens-revista.vivadecora.com.br/uploads/2019/05/quarto-de-hotel-decorado-em-cores-neutras-com-amplas-janelas.jpg", 602.90, "sim", "Queen Size", "sim");
    
    select * from Quartos;
	select * from Quartos where disponibilidade = "não" order by preco asc;
	select * from Quartos where cafeDaManha = "sim" and disponibilidade = "não";
	select * from Quartos where varanda = "sim" and cafeDaManha = "sim" and disponibilidade ="não";
	select * from Quartos where preco < 600.00 and disponibilidade = "não";
          
          create table clientes (
          idCliente int primary key auto_increment,
          nomeCompleto varchar(100) not null,
          cpf char(14) not null unique,
		  rg char(12) not null unique,
          email varchar(50) unique,
          celular varchar(20) not null
          );
          
          
            describe clientes;
            
            
		   insert into clientes (nomeCompleto, cpf, rg, email, celular) values
        ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803");
        
          
        insert into clientes (nomeCompleto, cpf, rg, email, celular) values
        ("Luiz felipe", "839.937.519-09", "48.319.890-9", "luizfelipe@gmail.com", "(96) 99428-2803");
        
        select * from clientes;
	
       create table pedido(
          idPedido int primary key auto_increment,
          dataPedido timestamp default current_timestamp,
          statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
          idCliente int not null,
          foreign key (idCliente) references clientes(idCliente)
          ); 
          
          
          insert into pedido(statusPedido, idCliente) values ("Pendente", 1);
          insert into pedido(statusPedido, idCliente) values ("Finalizado", 2);
          
          select * from pedido;
          select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;
           
           
	   create table reservas (
          idReserva int primary key auto_increment,
          idPedido int not null,
          idQuartos int not null,
          foreign key (idPedido) references pedido(idPedido),
		  foreign key (idQuartos) references Quartos(idQuartos)
          );
          
            insert into reservas (idPedido, idQuartos, checkin, checkout) values (1, 2, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
          insert into reservas (idPedido, idQuartos, checkin, checkout) values (1, 4, "2023-11-27 15:00:00", "2023-11-05 16:00:00");
          
            describe reservas;
            
                 select * from reservas;
           describe Quartos;
            select reservas.idReserva, pedido.idPedido,
            Quartos.idQuartos, Quartos.nome, Quartos.andar, Quartos.numeroQuarto
            from (reservas inner join pedido on reservas.idPedido = pedido.idPedido)
            inner join Quartos on reservas.idQuartos = Quartos.idQuartos; 
           
        
     /*Cliente Luiz felipe - idPedido 2
     Quarto reservado: Superior Premier Twin (3° andar, número 302, preço/diária: R$ 572.90)
     Checkin 27/11/2023 às 10:00
     Checkout 08/12/2023 às 10:00
     */
     
     /*Buscar o nome do cliente, andar, número do quarto e checkout somete daqueles
     cuja data do checkout já passou ou é igual à data do sistema*/
     select clientes.nomeCompleto, Quartos.andar, Quartos.numeroQuarto, reservas.checkout from
     clientes inner join pedido on clientes.idCliente = pedido.idCliente inner join
     reservas on reservas.idPedido = pedido.idPedido inner join Quartos
     on reservas.idQuartos = Quartos.idQuartos <= current_timestamp();
     
     
     
     /*Atualizar a disponibilidade do quarto somente daqueles */
     update reservas inner join Quartos on reservas.idQuartos = Quartos.idQuartos
     set Quartos.disponibilidade  = "sim" where reservas.checkout < current_timestamp();
          
          
	select * from Quartos;
    
    /*Buscar o nome do cliente, andar, número do quarto, checkout (com data formatada 99/99/9999) e
    o cálculo de quartos dias faltam para a reserva do cliente encerrar ( dias restantes = do checkout - data de hoje)  */
	select clientes.nomeCompleto, Quartos.andar, Quartos.numeroQuarto,
	date_format(reservas.checkout, '%d/%m/%Y') as checkout, datediff(reservas.checkout, curdate()) as dias_restates
	from clientes inner join pedido on clientes.idCliente = pedido.idCliente inner join
     reservas on reservas.idPedido = pedido.idPedido inner join Quartos
     on reservas.idQuartos = Quartos.idQuartos > current_timestamp();
           