CREATE TABLE t (i INT) ENGINE = InnoDB;
INSERT INTO t (i) VALUES(1);
START TRANSACTION;

SELECT * FROM t WHERE i = 1 FOR SHARE;

-- próximo cliente
 START TRANSACTION;
 DELETE FROM t WHERE i = 1; -- xlock

 --cliente 1
 mysql> DELETE FROM t WHERE i = 1;
/* não pode executar por que o cliente 2 já solicitou o xlock
   ele ainda espera que o cliente 1 libere o item

   O bloqueio S mantido por A também não pode ser atualizado para um bloqueio X devido à 
   solicitação anterior de B para um bloqueio X. 
   Como resultado, o InnoDB gera um erro para um dos clientes e libera seus bloqueios. O cliente retorna este erro:

   ERROR 1213 (40001): Deadlock found when trying to get lock;
t   ry restarting transaction

    Neste ponto outra transação pode executar a operação
 */