show databases;

create database base_de_dados;

show databases;

use base_de_dados;

create table transacao (
    id int not null auto_increment,
    tipo varchar(10) not null,
    nome varchar(200) not null,
    valor double not null,
    data_de_cadastro date not null,
    primary key(id)
) default charset = utf8;

show tables;

desc transacao;

insert into transacao values
(default, 'Compra', 'Sapato', '70.50', '2021-06-01'),
(default, 'Compra', 'Camisa', '30.40', '2021-10-01'),
(default, 'Compra', 'Par de Bricos', '40.00', '2021-02-01');

select * from transacao;

select * from transacao
order by data_de_cadastro;

select sum(valor) from transacao;

truncate table transacao;





