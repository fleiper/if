DROP TABLE tbl_clientes;




#### TABELA ALTERADA PARA RESOLUÇÃO DA ATIVIDADE ####

CREATE DATABASE bd_clientes_ie;
USE bd_clientes_ie;

CREATE TABLE  tbl_clientes(
codigo int not null primary key auto_increment,
nome varchar (50) not null,
sexo char(1) not null,
idade int not null,
email varchar (100) not null,
telefone varchar (15) not null,
endereço varchar (50) not null
);
insert into tbl_clientes (nome,sexo, idade, email, telefone, endereço)
values ("Marcos Tulio", "M", 25, "google@gmail.com", "15 99999-9999", "EUA"),
	("Pac", "M", 23, "twitch@gmail.com", "15 88888-8888", "EUA"),
	("Mike", "M", 21, "minecraft@gmail.com", "15 666666-6666", "EUA"),
	("Woman", "F", 15, "roblox@gmail.com", "15 00000-0000", "EUA"),
	("Barry", "M", 12, "gta@gmail.com", "15 11111-1111", "EUA"),
	("Alex", "F", 7, "steam@gmail.com", "15 22222-22222", "EUA");

select * from tbl_clientes;


DELIMITER $$ #Começa
CREATE procedure sp_lista_clientes (IN opcao int)
begin 
	if opcao = 0 then
		select * from tbl_clientes where sexo = 'F'; #Seleciona todo com genero F, ou seja feminino = mulher
	elseif opcao = 1 then
		select * from tbl_clientes where sexo = 'M';#Seleciona todo com genero M, ou seja masculino = homem
	else 
		select * from tbl_clientes; #Seleciona todos 
	end if; #Finaliza a estrutura de decisão
end $$  
DELIMITER ; #encerra
 
DELIMITER $$
CREATE PROCEDURE sp_busca_cliente_por_nome (in nome_inicial varchar(100))
 begin 
	select * from tbl_clientes
    where nome like concat('%', nome_inicial, '%');
end $$
DELIMITER ;
  
CALL sp_busca_cliente_por_nome ("Pac");
CALL sp_busca_cliente_por_nome ("J");
  
 #Lista de mulheres
CALL sp_lista_clientes(0);
#Lista de homens
CALL sp_lista_clientes(0);
#Lista com qualquer serio
CALL sp_lista_clientes(0);

########## ATIVIDADE ########
DELIMITER $$
CREATE procedure maior_idade(IN opcao int)
begin 
	if opcao = 0 then
		select * from tbl_clientes where idade > '18';
    end if;
end $$
DELIMITER ;

call maior_idade(0);

DELIMITER $$ 
CREATE procedure menor_idade(IN opcao int)
begin 
	if opcao = 0 then
		select * from tbl_clientes where idade < 18;
	end if;
end $$
DELIMITER ;

call menor_idade(0);