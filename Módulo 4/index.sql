use company_constraints;  

  

show index from employee; 

/*Suponha que o campo email é muito acessado 

Podemos criar um index para este campo(atributo)*/ 

  

-- secure-file-priv option 

-- select * from employee into outfile "/tmp/fileselect.txt"; 

  

create database if not exists customer_managment; 

use customer_managment; 

create table if not exists customer( 

	id_customer int auto_increment primary key, 

    customer_name varchar(25), 

    email varchar(40), 

    cpf char(9), 

    credit_card char(13), 

    contact char(9), 

	address varchar(30) 

); 

  

  

show index from customer; 

  

alter table customer add index idx_email (email); 

  

  

CREATE TABLE customer ( 

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

  

ALTER TABLE customer DROP INDEX idx_email; 

  

-- Unique index 

ALTER TABLE customer ADD UNIQUE idx_email (email); 

ALTER TABLE customer ADD primary key idx_email (email); 

  

-- multicolumn index 

ALTER TABLE customer ADD INDEX idx_full_name (last_name, first_name); 

  

explain 

SELECT customer_id, first_name, last_name  

FROM customer  

WHERE first_name LIKE 'S%' AND last_name LIKE 'P%'; 