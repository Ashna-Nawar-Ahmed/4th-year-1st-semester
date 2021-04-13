--Created by G. M. Shahariar Shibli
clear screen;

--delete existing table
drop table supplier cascade constraints;
drop table parts cascade constraints;
drop table records cascade constraints;

--Create supplier, parts, records database
create table supplier(
sid     integer, 
sname   varchar2(30), 
address varchar2(30), 
        PRIMARY KEY (sid)
);

create table parts(
pid   integer, 
pname varchar2(30), 
color varchar2(30), 
      PRIMARY KEY(pid)
);

create table records(
sid   integer, 
pid   integer, 
cost  number, 
      FOREIGN KEY(sid) REFERENCES supplier(sid), 
      FOREIGN KEY(pid) REFERENCES parts(pid)
);

--Insert data into the supplier database
insert into supplier values(1, 'Sham', 'Devils Canyon');
insert into supplier values(2, 'Coyote', 'RR Asylum');
insert into supplier values(3, 'Cage', 'Carrot Patch');

--Insert data into parts database
insert into parts values(1, 'red1', 'red');
insert into parts values(2, 'red2', 'red');
insert into parts values(3, 'green1', 'green');
insert into parts values(4, 'blue1', 'blue');
insert into parts values(5, 'red3', 'red');
insert into parts values(6, 'green2', 'green');
insert into parts values(7, 'blue2', 'blue');

--Insert data into records database
insert into records values(1, 1, 10);
insert into records values(1, 2, 20);
insert into records values(1, 3, 30);
insert into records values(1, 4, 40);
insert into records values(1, 5, 50);
insert into records values(2, 1, 9);
insert into records values(2, 3, 34);
insert into records values(2, 4, 48);

--Trying to commit -_-
commit;

--Display all data from three databases
select * from supplier;
select * from parts;
select * from records;

