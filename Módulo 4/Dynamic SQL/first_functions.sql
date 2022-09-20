show databases;
use teste;
show tables;

create function first_function (numa decimal(10,2), numb int)
	returns int deterministic
    return numa * numb;

select first_function(10.2,2);