-- https://dev.mysql.com/doc/refman/8.0/en/import-table.html

-- copiando arquivos
FLUSH TABLES hr.employees, hr.managers WITH READ LOCK;

cd export_basedir/data/hr

cp employees_125.sdi /tmp/export
cp managers_238.sdi /tmp/export
cp employees.{MYD,MYI} /tmp/export
cp managers.{MYD,MYI} /tmp/export

-- desbloqueando tabelas
UNLOCK TABLES;

-- criando um novo banco de dados

CREATE SCHEMA hr;

cd /tmp/export
cp employees_125.sdi /tmp/mysql-files
cp managers_238.sdi /tmp/mysql-files
cp employees.{MYD,MYI} import_basedir/data/hr
cp managers.{MYD,MYI} import_basedir/data/hr

-- recovery do bd

IMPORT TABLE FROM
       '/tmp/mysql-files/employees.sdi',
       '/tmp/mysql-files/managers.sdi';


IMPORT TABLE FROM '/tmp/mysql-files/*.sdi';