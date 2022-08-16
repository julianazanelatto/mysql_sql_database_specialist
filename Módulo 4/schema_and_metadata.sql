use company_constraints;
show tables;
show index from employee;
use information_schema;
use mysql;
show tables;
select user from mysql;
show databases;

select * from user;
create database testuser;

create user 'geral'@localhost identified by '123456798';
grant all privileges on testuser.* to 'geral'@localhost; 
/*
grant all privileges on testuser.* to 'geral'@localhost; 
grant all privileges on testuser.table to 'geral'@localhost; 
grant all privileges on *.* to 'geral'@localhost; 
*/
flush privileges;