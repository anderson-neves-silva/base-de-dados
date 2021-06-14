-- verificando todos os bancos de dados 
show databases

-- criando o banco de dados
create database base_de_dados
default character set utf8
default collate utf8_general_ci;

show databases;

-- selecionando para uso o banco de dados
use base_de_dados;

-- criando a tabela de transação
create table if not exists transacao (
    id int not null auto_increment,
    tipo varchar(10) not null,
    nome varchar(200) not null,
    valor double not null,
    data_de_cadastro date not null,
    primary key(id)
) default charset = utf8;

-- verificando todas as tabela do banco de dados
show tables;

-- verificando a descrição da tabela transação 
desc transacao;

-- inserindo 3 registros na tabela transação, no campo 'data de cadastr'o eu poderia ter colocado a função ', now()’ para inserir a data no momento da inserção dos dados na tabela mas resolvi inserir a data diretamente
insert into transacao values
(default, 'Compra', 'Sapato', '70.50', '2021-06-01'),
(default, 'Compra', 'Camisa', '30.40', '2021-10-01'),
(default, 'Compra', 'Par de Bricos', '40.00', '2021-02-01');

-- mostrando todos os dados da tabela transação
select * from transacao;

-- mostrando todos os dados da tabela transação ordenados pela data de cadasro
select * from transacao
order by data_de_cadastro;

-- mostrando a soma total dos valores da tabela transação
select sum(valor) from transacao;

-- apagando todos os registros da tabela transação
truncate table transacao;
