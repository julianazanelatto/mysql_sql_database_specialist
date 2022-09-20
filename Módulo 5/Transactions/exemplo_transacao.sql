 -- exemplo com transações
 -- sem determinar o rollback explicitamente ele não acontece
SET @@autocommit = off; 

-- startando uma transação
START TRANSACTION;
 -- query sql recuperando o id de order
	 SELECT
        -- declarando uma variável com @
		@orderNumber:=max(orderNumbers)+1
	FROM
		orders;

	-- inserção de dados em order
	INSERT INTO orders( orderNumbers,
						orderDate,
						requiredDate,
						shippedDate,
						orderStatus	
					)
	VALUES(@orderNumber,
			'2005-05-31',
			'2005-6-10',
			'2005-06-11',
			'EM PROGRESSO'
			);

	SAVEPOINT insercao_em_order;
    
	SELECT
        -- declarando uma variável com @
		@orderNumber:=max(orderNumbers)
	FROM
		orders;

	-- inserindo linhas de order
	INSERT INTO ordersDetails(orderNumbers,
							 productCode,
							 quantityOrder,
							 price
							 )
	VALUES(@orderNumber,181749, 30, '136'),
		  (@orderNumber,182248, 50, '55.09'); 
      
SAVEPOINT insercao_em_orderdetails;

-- comitando as modificações
COMMIT;

-- ROLLBACK TO SAVEPOINT insercao_em_order;
rollback;