SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE register_complaint_procedure(id in userDetails.user_id%TYPE,comp in complaints.complaint_details%TYPE)
		IS
BEGIN
    	INSERT INTO complaints(user_id,complaint_details,resolved) values(id,comp,0);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Thank you for your valuable opinion/suggestion. We will look into it as soon as possible.');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
END register_complaint_procedure;
/
