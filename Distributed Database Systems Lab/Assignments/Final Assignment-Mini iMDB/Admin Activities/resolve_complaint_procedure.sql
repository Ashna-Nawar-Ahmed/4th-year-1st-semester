
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE resolve_complaint_procedure(cid in complaints.complaint_id%TYPE)
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Resolving complaint '||cid);
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	UPDATE complaints
	set resolved=1
	where complaint_id=cid;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Complaint Resolved.');
	DBMS_OUTPUT.PUT_LINE(chr(10));

	
END resolve_complaint_procedure;
/
