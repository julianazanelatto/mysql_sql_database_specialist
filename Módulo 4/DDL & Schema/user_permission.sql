show databases;
use testuser;
show tables;

drop table tabela_user;
create table tabela_user(
	nome_tabela varchar(255),
    id int primary key
);

show tables;
use information_schema;
show tables;
select * from information_schema.table_constraints;