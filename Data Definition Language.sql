create DATABASE sample1; #Created Dataset named Sample1

drop DATABASE sample1; #Deleted the empty Dataset sample1

use superstore; #Data Definition command this is used for using perticular DATABASE

show databases; #this command will show all databases available

create table sample2(ID INT, name varchar(20), Age INT, Address Char(50));
insert into sample2 (ID,name,Age,Address) values(1,'ram',18,'akola');

update sample2 set ID = 3, name = 'shyam';

alter table sample2 rename column name to Naam;
select * from sample2;

alter table sample2 rename to prctice_table;
insert into prctice_table (id,Naam,Age,Address) values (20,'ram',54,'pune');
select * from prctice_table;

delete from prctice_table where ID=20;

truncate prctice_table;