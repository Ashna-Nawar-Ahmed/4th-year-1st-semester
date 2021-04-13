SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION signUp_function(name in userDetails.user_name%TYPE,pass in userDetails.password%TYPE) 
RETURN userDetails.user_id%TYPE
IS
newUId userDetails.user_id%TYPE := 0;
BEGIN
	INSERT INTO userDetails(userDetails.user_name,userDetails.password) values(name,pass);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('New account created successfully.');
	SELECT user_id into newUId from userDetails where user_name=name and password=pass;
	DBMS_OUTPUT.PUT_LINE('User ID: '||newUId);
	
RETURN newUId;
END signUp_function;
/
