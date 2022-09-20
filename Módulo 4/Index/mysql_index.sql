create database if not exists customer_managment; 
use customer_managment; 

drop table customer;
create table if not exists customer( 
	id_customer int auto_increment primary key, 
    customer_name varchar(25),
    email varchar(40) not null,  
    cpf char(9),
    credit_card char(13), 
    contact char(9),
	address varchar(30) 
); 

show tables;
show index from customer;
alter table customer_managment.customer add index index_email (email);

-- outros tipos de índices

CREATE TABLE customer_v2( 
	customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
	store_id TINYINT UNSIGNED NOT NULL, 
	first_name VARCHAR(45) NOT NULL, 
	last_name VARCHAR(45) NOT NULL, 
	email VARCHAR(50) DEFAULT NULL, 
	address_id SMALLINT UNSIGNED NOT NULL, 
	active BOOLEAN NOT NULL DEFAULT TRUE, 
	create_date DATETIME NOT NULL, 
	last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (customer_id), 
	KEY idx_fk_store_id (store_id), 
	KEY idx_fk_address_id (address_id), 
	KEY idx_last_name (last_name) 
); 

show tables;
show index from customer_v2;

alter table customer_managment.customer_v2 add index active_customers_index (active);
create index ind on customer_managment.customer_v2 (active) using hash; -- não acontece: SGBD converte para Btree

drop table exemplo;
create table exemplo(
	id int primary key auto_increment,
    nome varchar(60),
    ativo boolean default true,
    email varchar(50)
) engine = MEMORY;

create index idx_hash_ativo on exemplo(ativo) using hash;
create index idx_btree_id on exemplo(id) using Btree;
show tables;
show index from exemplo;
