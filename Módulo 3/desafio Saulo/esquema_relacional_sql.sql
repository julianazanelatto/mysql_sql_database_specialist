-- criação do banco de dados para o cenário de E-commerce 
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
		idClient int auto_increment primary key,
        clientType enum('PF','PJ') not null,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) default null,
        CNPJ char (14) default null,
        Address varchar(255),
        constraint unique_cpf_client unique (CPF),
		constraint unique_cnpj_client unique (CNPJ),
        constraint chk_client_type check( 
        (clientType = 'PF' and CPF is not null and CNPJ is null)
        or
        (clientType ='PJ' and CNPJ is not null and CPF is null)
        )
);

alter table clients auto_increment=1;

-- desc clients;
-- criar tabela produto

-- size = dimensão do produto
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(255) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10),
    price decimal(12,2) default 0.00
);

alter table product auto_increment=1;


-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento


-- criar tabela pedido
-- drop table orders;
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int not null,
    idPayment int,
    orderStatus enum('Cancelado','Confirmado','Em processamento','Enviado') default 'Em processamento',
    orderDescription varchar(255),
    sendValue decimal(12,2) default 10.00,
    created_at datetime default current_timestamp,
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
			on delete restrict on update cascade
);
alter table orders auto_increment=1;

desc orders;

-- drop table if exists payments;

create table payments(
	idPayment int auto_increment primary key,
	idPgClient int not null,
    idPgOrder int,
    typePayment enum('Boleto','Cartão','Dois cartões','Pix') not null,
    limitAvailable decimal(12,2) default 0.00,
    paymentValue decimal(12,2) default 0.00,
    paymentDate datetime default current_timestamp,
    statusPayment enum('Pendente','Aprovado','Recusado','Estornado') default 'Pendente',
    constraint fk_payments_client foreign key (idPgClient) references clients(idClient)
		on delete cascade on update cascade,
	constraint fk_payments_order foreign key (idPgOrder) references orders(idOrder)
		on delete cascade on update cascade
);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_payment
    FOREIGN KEY (idPayment) REFERENCES payments(idPayment)
    ON DELETE SET NULL ON UPDATE CASCADE;



-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
alter table productStorage auto_increment=1;


-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;

desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(14),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;


-- tabelas de relacionamentos M:N

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

desc productSeller;

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)

);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
desc storageLocation;

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);

desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
