create database my_test_db;

use my_test_db;

create table test_table (somevalue VARCHAR(50))

insert into test_table (somevalue) values ('Test');

commit;

select somevalue from test_table;