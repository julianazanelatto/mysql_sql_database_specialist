create database if not exists triggersdb;
use triggersdb;

create table account (
	id int primary key, 
	acct_num int not null,
	amount DECIMAL(10,2)
);


create trigger check_amount before insert on account
for each row 
	set @sum = @sum+new.amount; 

-- drop trigger check_amount;
show triggers from triggersdb;

set @sum = 0;
insert into account (id, acct_num, amount)
					values(1, 137,14.98),
						  (2, 141,1937.50),
                          (3, 97,-100.00); 
                          
select * from account;
drop trigger check_amount;

delimiter // 
create trigger upd_check BEFORE UPDATE ON account 
       FOR EACH ROW 
       BEGIN 
           IF NEW.amount < 0 THEN 
               SET NEW.amount = 0; 
           ELSEIF NEW.amount > 100 THEN 
               SET NEW.amount = 100; 
           END IF; 
       END// 
delimiter ; 

update account set amount = -50 where id=3;
select * from account;