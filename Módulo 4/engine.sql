SHOW ENGINES;

SELECT ENGINE FROM information_schema.tables
	where table_schema = 'transactionExample';
    
SELECT * FROM information_schema.tables
	where table_schema = 'transactionExample' and table_name = 'orders';

