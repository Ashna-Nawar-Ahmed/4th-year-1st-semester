create or replace package PK_CONVERSION as
	
	function CONVERT_NUMBER(n_number in varchar2(10))
		return varchar2(10);

	
end PK_CONVERSION;
/

create or replace package body PK_CONVERSION as
	function CONVERT_NUMBER(n_number in varchar2(10))
		return varchar2(10)
		is
		ret_val varchar2(10);	
	begin
	
	if TO_CHAR(mod(TO_NUMBER(n_number),1))=(n_number) then	
		ret_val:='yes';
		
	else 
		ret_val:='no';
		
	end if;
	
	
	end CONVERT_NUMBER;
	
end PK_CONVERSION;
/