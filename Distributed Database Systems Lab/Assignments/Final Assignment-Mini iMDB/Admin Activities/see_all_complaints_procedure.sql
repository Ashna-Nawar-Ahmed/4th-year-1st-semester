
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE see_all_complaints_procedure
		IS
BEGIN
    	DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('The pending complaints are:');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	FOR I IN (SELECT complaint_id,complaint_details,date_submitted
	FROM complaints
	where complaints.resolved=0)
	LOOP 
	
	DBMS_OUTPUT.PUT_LINE('Complaint ID:'||'->'||TO_CHAR (I.complaint_id));
	DBMS_OUTPUT.PUT_LINE('Complaint Details:'||'->'||I.complaint_details);
	DBMS_OUTPUT.PUT_LINE('Date Submitted:'||'->'||TO_CHAR (I.date_submitted));
	
	DBMS_OUTPUT.PUT_LINE(chr(10));
	END LOOP;
	
END see_all_complaints_procedure;
/
