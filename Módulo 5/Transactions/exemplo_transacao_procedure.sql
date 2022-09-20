drop procedure insercao_de_dados;

call insercao_de_dados();

DELIMITER //
CREATE PROCEDURE insercao_de_dados()
BEGIN
	-- declarando variavel de controle do procedimento
    declare erro_sql tinyint default false;
    
    -- declarando o handler de exeções sql e setando erro_sql = true 
    declare continue handler for sqlexception set erro_sql = true;
    
    START TRANSACTION;
    UPDATE transactionExample.orders set orderStatus = 'ENTREGUE' where orderNumbers = 3;
    
    if erro_sql = false then
        commit;
        select * from orders where orderNumber = 2;
	else
		rollback;
        select 'Erro na transação' AS Resultado;
	end if;
END//