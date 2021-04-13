SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE register_complaint_proc_SA
		AS
comp complaints.complaint_details%TYPE:='&complaint_or_suggestion';		
id userDetails.user_id%TYPE;

----NEEDED FOR LOGIN
/*username varchar2(40):='&userName';
password varchar2(40):='&password';*/

----FOR DIRECT USERID
us_id varchar2(40):='&user_id';
BEGIN
	----NEEDED FOR LOGIN-----
	/*FOR I IN (SELECT user_name,password,user_id from userDetails)
	LOOP
		IF I.user_name=username and I.password=password then
			DBMS_OUTPUT.PUT_LINE('LOGGED IN SUCCESSFULLY');
			id:=I.user_id;
			exit;
		ELSIF I.user_name=username and I.password<>password then
			DBMS_OUTPUT.PUT_LINE('INCORRECT PASSWORD');
			exit;
		END IF;
	END LOOP;*/
	
	----FOR DIRECT userid-----
	id:=TO_NUMBER(us_id);
	
	
    INSERT INTO complaints(user_id,complaint_details,resolved) values(id,comp,0);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Thank you for your valuable opinion/suggestion. We will look into it as soon as possible.');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
END register_complaint_proc_SA;
/
