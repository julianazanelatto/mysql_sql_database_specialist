create database events_example;
use events_example;

create table if not exists processtable(
	id int auto_increment primary key,
    message varchar(20),
    messagedate datetime
);

show processlist;

select @@event_scheduler;

set global event_scheduler = OFF;
set @@global.event_scheduler = ON;

-- criando um schedule
create event myevent
	on schedule at current_timestamp + interval 1 minute
    do 
		insert into processtable (message, datemessage) values('Message', now()) ;

show warnings;
show events;

select * FROM information_schema.events;


select * from processtable;
select current_timestamp() as date;

drop event if exists myevent;

use company_constraints;
show events;

create table contabilizando_employees(
	id int auto_increment primary key,
    numberofemployess int not null,
    countdate date
);
select * from contabilizando_employees;


set @total := (select count(*) from employee);
select @total as total;

DELIMITER |

create event total_de_employees
	on schedule 
		every current_time() + 2 second
    on completion preserve
    comment 'Teste de agendamento de evento'
    do
    begin
		declare total int;
		set @total := (select count(*) from employee);
		insert into contabilizando_employees (numberofemployess, countdate) values (2, date);	
	END |
DELIMITER ;

alter event total_de_employees 
	on schedule
		every 1 day
		starts current_time + interval 1 second;

show events;

select * from contabilizando_employees;
DROP EVENT total_de_employees;

alter event total_de_employees disable;

ALTER EVENT total_de_employees
    RENAME TO totalemployees;


-- podemos ainda criar uma função e chama-la dentro do evento
/*
CREATE EVENT e_call_myproc
    ON SCHEDULE
      AT CURRENT_TIMESTAMP + INTERVAL 1 DAY
    DO CALL myproc(5, 27);
*/

-- -- OUTRO


DELIMITER |

CREATE EVENT soldoutreset
ON SCHEDULE EVERY 5 MINUTE
    DO
    BEGIN
        IF db.Inventory.soldout = 1 AND db.Inventory.Quantity > 0 THEN
            UPDATE db.Inventory SET soldout = 0
            WHERE soldout = 1 AND Quantity > 1;
        END IF;
    END |

DELIMITER ;