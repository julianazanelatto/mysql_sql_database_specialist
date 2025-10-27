-- inserção de dados e queries
show databases;

use ecommerce;


show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (clientType, Fname, Minit, Lname, CPF, Address) 
	   values
       ('PF','Maria','M','Silva','12345678901','Rua Silva de Prata 29, Carangola'),
       ('PF','Matheus','O','Pimentel','98765432100','Rua Alameda 289, Centro'),
       ('PF','Ricardo','F','Silva','45678913000','Avenida Vinha 1009, Centro'),
       ('PF','Julia','S','França','78912345600','Rua Laranjeiras 861, Centro'),
       ('PF','Roberta','G','Assis','98745631000','Avenida Koller 19, Centro'),
       ('PF','Isabela','M','Cruz','65478912300','Rua das Flores 28, Centro'),
       ('PF','Carlos','A','Souza','11122233344','Rua das Acácias 100 - Curitiba'),
       ('PF','Fernanda','P','Lima','55566677788','Av. Brasil 500 - São Paulo'),
       ('PF','Diego','M','Oliveira','99988877766','Rua Central 22 - Belo Horizonte');



-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size,  price) values
		('Fone de ouvido',FALSE,'Eletrônico',4.0,NULL,200.00),
		('Barbie Elsa',TRUE,'Brinquedos',3.0,NULL,150.00),
		('Body Carters',TRUE,'Vestimenta',5.0,NULL,90.00),
		('Microfone Vedo - Youtuber',FALSE,'Eletrônico',4.0,NULL,300.00),
		('Sofá retrátil',FALSE,'Móveis',3.0,'3x57x80',1200.00),
		('Farinha de arroz',FALSE,'Alimentos',2.0,NULL,15.00),
		('Fire Stick Amazon',FALSE,'Eletrônico',3.0,NULL,400.00),
		('Notebook Lenovo',FALSE,'Eletrônico',4.8,'15',3500.00),
		('Camisa Polo',FALSE,'Vestimenta',4.2,'M',80.00),
		('Lego Star Wars',TRUE,'Brinquedos',4.9,NULL,350.00),
		('Mesa de Jantar',FALSE,'Móveis',4.5,'150x90',900.00),
		('Chocolate Amargo',FALSE,'Alimentos',4.1,'100g',12.00);



select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

-- delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue) values 
		(1, DEFAULT, 'Compra via aplicativo', 10.00),
		(2, 'Confirmado', 'Compra via aplicativo', 50.00),
		(3, 'Confirmado', 'Compra via site', 25.00),
		(4, 'Em processamento', 'Compra via web site', 150.00),
		(5, 'Confirmado', 'Compra via app', 20.00),
		(6, 'Confirmado', 'Compra via site', 80.00),
		(7, 'Em processamento', 'Compra via web site', 90.00);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1, 1, 2, 'Disponível'),
(2, 1, 1, 'Disponível'),
(3, 2, 1, 'Disponível'),
(8, 3, 1, 'Disponível'),
(9, 4, 2, 'Disponível'),
(10, 5, 1, 'Disponível'),
(11, 6, 3, 'Disponível'),
(12, 7, 1, 'Disponível');


select * from productOrder;

-- storageLocation,quantity

insert into productStorage (storageLocation,quantity) values 
('Rio de Janeiro', 1000),
('São Paulo', 500),
('Brasília', 60);

select * from productStorage;

-- delete a from productStorage a;
-- inner join productStorage b 
-- where 
	-- a.idProdStorage < b.idProdStorage and a.storageLocation = b.storageLocation and a.quantity = b.quantity;
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
(1, 1, 'RJ'),
(2, 2, 'SP'),
(3, 3, 'DF');

select * from storagelocation;
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
('Almeida e filhos', 12345678912345,'21985474'),
('Eletrônicos Silva',85451964914347,'21985484'),
('Eletrônicos Valma', 93456789393695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select * from clients;

-- Pagamentos simulados
insert into payments (idPgClient, idPgOrder, typePayment, limitAvailable, paymentValue, statusPayment) values
(1, 1, 'Cartão', 5000.00, 410.00, 'Aprovado'),
(2, 2, 'Pix', 0.00, 3500.00, 'Aprovado'),
(3, 3, 'Boleto', 0.00, 25.00, 'Pendente'),
(4, 4, 'Cartão', 1500.00, 200.00, 'Aprovado'),
(5, 5, 'Pix', 0.00, 80.00, 'Aprovado'),
(6, 6, 'Dois cartões', 2000.00, 300.00, 'Pendente'),
(7, 7, 'Boleto', 0.00, 90.00, 'Aprovado');

select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select * from orders;

-- recuperação de pedido com produto associado
select c.idClient,c.Fname, count(o.idOrder) as total_orders, sum(p.poquantity) as total_itens
 from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 
        
-- Recuperar pedido por cliente e por produto

SELECT 
    c.idClient,
    c.Fname,
    g.Pname AS Produto,
    COUNT(DISTINCT o.idOrder) AS total_orders,
    SUM(p.poquantity) AS total_itens
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
INNER JOIN productOrder p ON p.idPOorder = o.idOrder
INNER JOIN product g ON g.idProduct = p.idPOproduct
GROUP BY c.idClient, c.Fname, g.Pname;

-- Consulta pagamentos por cliente

SELECT 
    c.Fname AS Cliente,
    o.idOrder AS Pedido,
    p.typePayment AS Tipo,
    p.paymentValue AS Valor,
    p.statusPayment AS Status,
    p.paymentDate AS Data
FROM payments p
JOIN clients c ON p.idPgClient = c.idClient
LEFT JOIN orders o ON p.idPgOrder = o.idOrder
ORDER BY p.paymentDate DESC;

-- clientes com pagamento pendente 

select distinct c.Fname, c.Lname
from clients c
join payments p on c.idClient = p.idPgClient
where p.statusPayment = 'Pendente';

-- produtos comprados e quantidade

select pr.Pname, po.poQuantity, po.poStatus
from productOrder po
join product pr on po.idPOproduct = pr.idProduct;

-- valor pago por cliente ordenado

SELECT
    c.idClient,
    CONCAT(c.Fname,' ',COALESCE(c.Lname,'')) AS cliente,
    COALESCE(SUM(p.paymentValue),0) AS total_pago
FROM clients c
LEFT JOIN payments p ON p.idPgClient = c.idClient AND p.statusPayment = 'Aprovado'
GROUP BY c.idClient
ORDER BY total_pago DESC;

-- vendedor como fornecedor

SELECT 
    s.idSeller, s.SocialName AS seller_name, s.CNPJ AS seller_cnpj,
    sup.idSupplier, sup.SocialName AS supplier_name, sup.CNPJ AS supplier_cnpj
FROM seller s
JOIN supplier sup ON sup.CNPJ = s.CNPJ
WHERE sup.idSupplier IS NOT NULL;

-- estoque produtos

SELECT
    pr.idProduct, pr.Pname, COALESCE(SUM(sl2.quantity),0) AS total_stock
FROM product pr
LEFT JOIN storageLocation sl ON sl.idLproduct = pr.idProduct
LEFT JOIN productStorage sl2 ON sl2.idProdStorage = sl.idLstorage
GROUP BY pr.idProduct, pr.Pname
HAVING total_stock > 20
ORDER BY total_stock DESC;
-- lista vendedores por produto

select * from seller s
left join productseller ps on s.idseller = ps.idPSeller
left join product p on p.idProduct =ps.idPproduct;