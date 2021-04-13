SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE signUp_proc_SA
AS 
newUId userDetails.user_id%TYPE;
name userDetails.user_name%TYPE:='&user_name';
pass userDetails.password%TYPE:='&pass_word';
flag userDetails.user_id%TYPE:=0;
BEGIN
	FOR I IN (SELECT user_name,password,user_id from userDetails)
	LOOP
		IF I.user_name=name and I.password=pass then
			DBMS_OUTPUT.PUT_LINE('Account already exists. LOGGED IN SUCCESSFULLY');
			flag:=1;
			exit;
		ELSIF I.user_name=name and I.password<>pass then
			DBMS_OUTPUT.PUT_LINE('Account already exists. INCORRECT PASSWORD');
			flag:=1;
			exit;			
		END IF;
	END LOOP; 
	
	IF flag=0 THEN
		INSERT INTO userDetails(userDetails.user_name,userDetails.password) values(name,pass);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('New account created successfully.');
		SELECT user_id into newUId from userDetails where user_name=name and password=pass;
		DBMS_OUTPUT.PUT_LINE('New User ID: '||newUId);
	END IF;
	
	

END signUp_proc_SA;
/
