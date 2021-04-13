SET SERVEROUTPUT ON;
create or replace trigger fun1
after insert
on students
for each row
begin
DBMS_OUTPUT.PUT_LINE('FUN1');
end;

create or replace trigger fun2
before insert
on students
for each row
begin
DBMS_OUTPUT.PUT_LINE('FUN2');
end;

create or replace trigger fun3
after insert or delete
on students
for each row
when cgpa<3.65
begin
DBMS_OUTPUT.PUT_LINE('FUN3');
end;


create or replace trigger fun4
after update
on students
for each row
begin
DBMS_OUTPUT.PUT_LINE('FUN4');
end;

create or replace trigger fun5
after update
on students
for each row
when 
begin
DBMS_OUTPUT.PUT_LINE('FUN5');
end;

create or replace trigger INVALID_NAME
before insert
on students
for each row
when Student_name is like '%0%' or is like '%1%' or is like '%2%' or is like '%3%' 
or is like '%4%' or is like '%5%' or is like '%6%' or is like '%7%' or is like '%8%' or is like '%9%'
begin
	raise exception noMoreInput;
end;

exception
WHEN noMoreInput THEN
	DBMS_OUTPUT.PUT_LINE('Invalid Student Name');
