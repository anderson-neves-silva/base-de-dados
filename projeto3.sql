-- criando o banco
create database base_de_dados3;
-- usando o banco criado
use base_de_dados3;
/* 
 * criando a tabela "project_team" com restrição de criação de 
 * chave primária e campos únicos para as colunas squad e email
 */
create table project_team (
	team_id int unsigned not null auto_increment,
	name varchar(255) not null,
	linkedin varchar(255) not null unique,
	image varchar(255) not null,
	squad int unsigned not null default '0',
	description varchar(255) not null,
	github varchar(255) not null,
	email varchar(255),
	constraint project_team_pk primary key (team_id),
	constraint project_team_un_squad unique key (squad),
	constraint project_team_un_email unique key (email)
);
/*
 * criando a tabela de "performed_searches" com restrição de criação 
 * de chave primária e chave estrangeira para a tabela "project_team"
 */
create table performed_searches (
	search_id int unsigned not null auto_increment,
	hashtag varchar(255) not null,
	data date not null,
	hora time not null,
	team_id int unsigned not null,
	constraint performed_searches_pk primary key (search_id),
	constraint performed_searches_fk foreign key (team_id) references project_team(team_id)
);
/*
 * criando a tabela de "about_project" com restrição de criação de 
 * chave primária e chave estrangeira para a tabela "project_team"
 */
create table about_project (
	about_id int unsigned not null auto_increment,
	about varchar(500),
	team_id int unsigned not null,
	constraint about_project_pk primary key (about_id),
	constraint about_project_fk foreign key (team_id) references project_team(team_id)
);
/*
 * criando a tabela de "user" com restrição de criação de chave primária e 
 * chave estrangeira para a tabela "project_team" e campos únicos para a coluna de email
 */
create table user (
	user_id int unsigned not null auto_increment,
	email varchar(255) not null,
	senha varchar(8),
	team_id int unsigned not null,
	constraint user_pk primary key (user_id),
	constraint user_fk foreign key (team_id) references project_team(team_id),
	constraint user_un_email unique key (email)
);
/*
 * criando a tabela de "tweets" com restrição de criação de chave 
 * primária e chave estrangeira para a tabela "performed_searches"
 */
create table tweets (
	id_tweets int unsigned not null auto_increment,
	search_return varchar(500) not null,
	search_url varchar(500) not null,
	search_id int unsigned not null,
	constraint tweets_pk primary key (id_tweets),
	constraint tweets_fk foreign key (search_id) references performed_searches(search_id)
);
-- <---------------------------------------------------------------------------------------->
-- inserindo um dado na tabela "project_team"
insert into project_team 
(name, linkedin, image, squad, description, github, email)
values
('Juca', 'https://www.linkedin.com/juca', 'https://www.linkedin.com/juca_img.jpg', 1, 'Lorem ipsum dolor sit amet etc...', 'https://github.com/juca1', 'juca1@gmail.com');
-- retornar todos os dados da tabela "project_team"
select * from project_team;
-- atualizando os dados da tabela "project_team", onde o team_id for igual a 1
update project_team 
set name = 'Castro', linkedin = 'https://www.linkedin.com/castro', image = 'https://www.linkedin.com/castro_img.jpg', squad = 2, description = 'Lorem ipsum dolor sit amet 1 etc...', github = 'https://github.com/castro1', email = 'castro1@gmail.com'
where team_id = 1;
-- deletando um dado da tabela "project_team", onde o team_id for igual a 1
delete from project_team
where team_id = 1;
-- <---------------------------------------------------------------------------------------->
-- inserindo um dado na tabela "performed_searches"
insert into performed_searches
(hashtag, data, hora, team_id)
values
('palmeiras tem mundial', '2022-02-27', '11:25:10', 1);
-- retornando todos os dados da tabela "performed_searches"
select * from performed_searches;
-- atualizando os dados da tabela "performed_searches", onde o serch_id for igual a 1
update performed_searches
set hashtag = 'covid19', data = '2022-02-28', hora = '14:56:02', team_id = 1
where search_id = 1;
-- deletando um dado da tabela "performed_searches", onde o search_id for igual a 1 da
delete from performed_searches
where search_id = 1;
-- <---------------------------------------------------------------------------------------->
-- inserindo um dado na tabela "about_project"
insert into about_project 
(about, team_id)
values 
('Hashtag Finder ! Projeto pensado em facilitar as buscas de Hashtags o famoso #', 1);
-- retornando todos os dados da tabela "about_project"
select * from about_project;
-- atualizando os dados da tabela "about_project", onde about_id for igual a 1
update about_project
set about = 'Hashtag Finder ! Projeto pensado em facilitar as buscas de Hashtags o famoso # 1', team_id = 1
where about_id = 1;
-- deletando um dado da tabela "about_project", onde o about_id for igual a 1
delete from about_project
where about_id = 1;
-- <---------------------------------------------------------------------------------------->
-- inserindo um dado na tabela "user"
insert into user
(email, senha, team_id)
values 
('teste@gamil.com', '123t456t', 1);
-- retornando todos os dados da tabela "user"
select * from user;
-- atualizando os dados da tabela "user", onde user_id for igual a 1
update user
set email = 'teste1@gamil.com', senha = '1234567t', team_id = 1
where user_id = 1;
-- deletando um dado da tabela "user", onde o user_id for igual a 1
delete from user
where user_id = 1;
-- <---------------------------------------------------------------------------------------->
-- inserindo um dado na tabela "tweets"
insert into tweets
(search_return, search_url, search_id)
values 
('covid19', 'https://pt.wikipedia.org/wiki/COVID-19', 1)
('palmeiras tem mundial', 'https://www.uol.com.br/esporte/futebol/colunas/rafael-reis/2022/02/12/7-clubes-importantes-do-cenario-internacional-que-nao-tem-mundial.htm#:~:text=Palmeiras%3A%207%20clubes%20importantes%20que%20n%C3%A3o%20t%C3%AAm%20Mundial', 1);
-- retornando todos os dados da tabela "tweets"
select * from tweets;
-- atualizando os dados da tabela "tweets", onde id_tweets for igual a 1
update tweets 
set search_return = 'vírus covid19', search_url = 'https://www.who.int/pt/news-room?adgroupsurvey={adgroupsurvey}', search_id = 1
where id_tweets = 1;
-- deletando um dado da tabela "tweets", onde o id_tweets for igual a 1
delete from tweets
where id_tweets = 1;
-- <---------------------------------------------------------------------------------------->
-- criando um index na coluna hashtag da tabela "performed_searches" para otimizar as buscas
create index idx_hashtag on performed_searches (hashtag);
-- criando um index na coluna search_return da tabela "tweets" para otimizar as buscas
create index idx_search_return on tweets (search_return);
/*
 * criando a quary na tabela de "tweets" que retorne uma palavra dentro de um texto 
 * retornado da busca da tabela "performed_searches"
 */
select * from tweets
where search_return like '%cov%';

desc project_team;
desc performed_searches;
desc about_project;
desc user;
desc tweets;
show tables;