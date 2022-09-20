mysqldump --tab=/tmp db1

--fields-enclosed-by='"'
--fields-enclosed-by=0x22

mysqldump --tab=/tmp --fields-terminated-by=,
         --fields-enclosed-by='"' --lines-terminated-by=0x0d0a db1

-- https://dev.mysql.com/doc/refman/8.0/en/mysqldump-delimited-text.html

-- reloading
mysql db1 < t1.sql
mysqlimport db1 t1.txt

USE db1;
LOAD DATA INFILE 't1.txt' INTO TABLE t1;

mysqlimport --fields-terminated-by=,
         --fields-enclosed-by='"' --lines-terminated-by=0x0d0a db1 t1.txt


USE db1;
LOAD DATA INFILE 't1.txt' INTO TABLE t1
FIELDS TERMINATED BY ',' FIELDS ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';