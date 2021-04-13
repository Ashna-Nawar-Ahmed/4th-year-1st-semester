SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE see_watch_list_proc_SA
		AS
M_NAME movieDetails.movie_name%TYPE;

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
	
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('The movies you have watched so far are:');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	
	
	
	FOR I IN (SELECT movie_id,user_rating,date_added
	FROM watchedList
	where watchedList.user_id=id)
	LOOP 
	IF I.movie_id>9999 THEN
		SELECT movie_name into M_NAME from movieDetails@site_link1 where movie_id=I.movie_id;
	ELSE SELECT movie_name into M_NAME from movieDetails where movie_id=I.movie_id;
	END IF;
	DBMS_OUTPUT.PUT_LINE('Movie Name'||'->'||M_NAME);
	DBMS_OUTPUT.PUT_LINE('Your Rating'||'->'||I.user_rating);
	DBMS_OUTPUT.PUT_LINE('Date Added'||'->'||I.date_added);
	DBMS_OUTPUT.PUT_LINE(chr(10));
	END LOOP;
	
END see_watch_list_proc_SA;
/
