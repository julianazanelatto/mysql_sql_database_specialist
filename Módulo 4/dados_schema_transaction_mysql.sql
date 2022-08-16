show databases;

use transactionexemple;
drop database transactionexemple;
show tables;

use performance_schema;
show tables;

select * from accounts;
select @@autocommit;
SET @@autocommit = OFF;

select * from performance_schema.events_transactions_summary_global_by_event_name limit 1;