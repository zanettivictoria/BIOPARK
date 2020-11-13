CREATE DATABASE biopark;

create table cadastro(
id_age INT NOT NULL auto_increment,
NameToSend varchar(100) NOT NULL,
ComunicationType varchar(100) not NULL,
Contact varchar(100) not NULL,
DateToSend varchar(11) not null,
MessageSentStatus bool not null, 
MessageToSend varchar(20000) not NULL,
primary key(id_age)
);

insert into cadastro (NameToSend, ComunicationType, Contact, DateToSend,MessageSentStatus, MessageToSend) values ("Victoria", "email","victoria@myEmail.com","2020-12-31", false, "Aqui é a da BIOPARK temos um agendamento!");
insert into cadastro (NameToSend, ComunicationType, Contact, DateToSend, MessageSentStatus, MessageToSend) values ("Stefani", "email", "Stefani@myEmail.com","2020-12-31", false, "Aqui é a da BIOPARK temos um agendamento!");
insert into cadastro (NameToSend, ComunicationType, Contact, DateToSend,MessageSentStatus, MessageToSend) values ("Julia", "email", "Julia@myEmail.com","2020-12-31", false, "Aqui é a da BIOPARK temos um agendamento!");

Select *from cadastro;
# SE PRECISAR ALTERAR USUARIO E SENHA DO BANCO DE DADOS | DESCOMENTAR A LINHA ABAIXO
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';