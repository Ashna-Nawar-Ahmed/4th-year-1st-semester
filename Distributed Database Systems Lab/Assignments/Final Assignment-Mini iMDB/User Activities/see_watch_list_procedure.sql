SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE see_watch_list_procedure(id in userDetails.user_id%TYPE)
		AS
M_NAME movieDetails.movie_name%TYPE;

BEGIN
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
	
END see_watch_list_procedure;
/
