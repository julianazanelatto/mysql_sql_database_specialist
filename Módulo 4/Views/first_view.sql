show databases;
use company;

drop view v_today;
create or replace view v_today(Today) as select current_date();
select * from v_today;

describe v_today;
show databases;
use information_schema;
show tables;
select * from views;