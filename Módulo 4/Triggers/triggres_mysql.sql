use company_constraints;
show tables;
desc employee;
select * from employee;
/*
CREATE
    [DEFINER = user]
    TRIGGER [IF NOT EXISTS] trigger_name
    trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    [trigger_order]
    trigger_body

trigger_time: { BEFORE | AFTER }
trigger_event: { INSERT | UPDATE | DELETE }
trigger_order: { FOLLOWS | PRECEDES } other_trigger_name
*/

-- before insert statement
# setando gerentes por departamento

delimiter \\ 
create trigger superssn_check before insert on company_constraints.employee 
for each row 
	begin 
		case new.Dno 
			when 1 then set new.Super_ssn = '333445555'; 
			when 2 then set new.Super_ssn = null; 
			when 3 then set new.Super_ssn = null; 
			when 4 then set new.Super_ssn = '123456789'; 
			when 5 then set new.Super_ssn = '987654321'; 
		end case; 
	end \\ 
delimiter ;  
drop trigger salary_check;
show triggers from company_constraints;

select * from employee;
insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
			values('João', 'B', 'Smith', '123456759', '1965-01-09', '731-Fondren-Houston-TX', 'M', '32000.00', NULL, '5'); 

-- after insert statement
# verificar de algum valor nulo que não foi passado alter
# adiciona uma mensagem para o usuário.

create table user_messages(
	id int auto_increment primary key,
    message varchar(100),
    ssn char(9),
    constraint fk_ssn_messages foreign key (ssn) references employee(Ssn)
);

show triggers from company_constraints;

drop trigger null_value_check;
delimiter //
create trigger null_value_check after insert on employee
for each row 
	if (new.Address is null) then
		insert into user_messages (message, ssn) values(concat('Update your adddress, please ', new.Fname),new.Ssn);
	else
		insert into user_messages (message, ssn) values(concat('Error ', new.Fname),new.Ssn);
	end if;
//
delimiter ;

insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  
				values ('Fulana', 'B', 'Smith', '513489824', '1965-08-10', null, 'F', '35000.00', '123456789', '5');
select * from employee;
select * from user_messages;


-- before update statement
# Atribuindo aumento de salário para um dept específico = 1 salary = salary * 1.20;


-- before delete statement
# salvando em outra tabela os employees demitidos
# old.attribute
