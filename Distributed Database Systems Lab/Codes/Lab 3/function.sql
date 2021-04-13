create or replace function isEven(n_number in money.id%TYPE)
  return money.id%TYPE
  is

begin
	
	IF MOD(n_number, 2) = 0 THEN
		return 1;
	ELSE
		return 0;
	END IF;

end isEven;
/