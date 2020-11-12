CREATE DATABASE biopark;

create table cadastro(
id_age INT NOT NULL auto_increment,
NameToSend varchar(100) NOT NULL,
Comunication varchar(100) not NULL,
DateToSend varchar(11) not null,
MessageSentStatus bool not null, 
primary key(id_age)
);

insert into cadastro (NameToSend, Comunication, DateToSend,MessageSentStatus) values ("Victoria", "victoria@myEmail.com","2020-12-31", false);
insert into cadastro (NameToSend, Comunication, DateToSend, MessageSentStatus) values ("Stefani", "Stefani@myEmail.com","2020-12-31", false);
insert into cadastro (NameToSend, Comunication, DateToSend,MessageSentStatus) values ("Julia", "Julia@myEmail.com","2020-12-31", false);

Select *from cadastro;
# SE PRECISAR ALTERAR USUARIO E SENHA DO BANCO DE DADOS | DESCOMENTAR A LINHA ABAIXO
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';