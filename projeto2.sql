-- criando o banco de dados2
create database base_de_dados2
default character set utf8
default collate utf8_general_ci;

-- selecionando para uso o banco de dados2
use base_de_dados2;

-- criando a tabela de usuário
create table if not exists usuario (
    id int unsigned not null auto_increment,
    nome varchar(50) not null,
    imagem text not null,
    nome_de_usuario varchar(150) not null,
    data_de_cadastro date not null,
    primary key(id)
) default charset = utf8;

-- criando a tabela de cartão
create table if not exists cartao (
    id int unsigned not null auto_increment,
    numero bigint not null,
    cvv int(3) not null,
    data_de_expiracao date not null,
    valido enum('S', 'N') not null,
    data_de_cadastro date not null,
    primary key(id)
) default charset = utf8;

-- criando a tabela de transação
create table if not exists transacao (
    id int unsigned not null auto_increment,
    id_usuario int unsigned not null,
    id_cartao int unsigned not null,
    valor float(10,2) not null,
    data_de_cadastro date not null,
    primary key(id),
    UNIQUE KEY (id_usuario),
    UNIQUE KEY (id_cartao),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_cartao) REFERENCES cartao(id) ON DELETE CASCADE ON UPDATE CASCADE
) default charset = utf8;

-- mostrando todas as tabelas do banco
SHOW tables;

-- verificando a descrição das tabelas abaixo
DESC usuario;
DESC cartao;
DESC transacao;

-- inserindo os dados na tabela de usuários
INSERT INTO usuario
(nome, imagem, nome_de_usuario, data_de_cadastro)
VALUES
("Carlos Gomes", "http://caminho-da-imagem-carlos-gomes", "carlos", "2021-06-01"),
("Juca Pereira", "http://caminho-da-imagem-juca-pereira", "juca", "2021-03-17"),
("Maria do Nascimento", "http://caminho-da-imagem-maria-do-nascimento", "maria", "2021-05-22"),
("Bernadete Cordeiro", "http://caminho-da-imagem-bernadete-cordeiro", "bernadete", "2021-04-27");

-- mostrando os dados da tabela usuário em ordem alfabética pelo nome
SELECT * FROM usuario
ORDER BY nome;

-- inserindo os dados na tabela cartão
INSERT INTO cartao
(numero, cvv, data_de_expiracao, valido, data_de_cadastro)
VALUES
("1111222233334444", "123", "2022-06-17", "S", "2019-01-19"),
("2222333344445555", "456", "2021-05-07", "N", "2017-08-25"),
("3333444455556666", "789", "2024-01-02", "S", "2020-12-28"),
("4444555566667777", "234", "2021-06-16", "N", "2016-04-02");

-- mostrando apenas os cartões válidos em ordem crescente pela data de cadastro
SELECT * from cartao
WHERE valido = "S"
ORDER BY data_de_cadastro;

-- inserindo transações
INSERT INTO transacao
(id_usuario, id_cartao, valor, data_de_cadastro)
VALUES
("1", "1", "200.29", "2021-02-08"),
("4", "2", "1000.98", "2021-01-29"),
("3", "4", "10.55", "2019-12-28"),
("2", "3", "531.01", "2021-06-10");

-- mostrando todas as trasações em ordem crescente da data de cadastro
SELECT * FROM transacao
INNER JOIN usuario ON transacao.id_usuario = usuario.id
INNER JOIN cartao ON transacao.id_cartao = cartao.id 
ORDER BY transacao.data_de_cadastro;






























