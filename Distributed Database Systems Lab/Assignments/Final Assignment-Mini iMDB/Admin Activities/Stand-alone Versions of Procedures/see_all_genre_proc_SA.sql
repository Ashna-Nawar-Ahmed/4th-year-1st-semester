SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE see_all_genre_proc_SA
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Genres Keys are:');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	FOR I IN (SELECT genre_id,genre_name
	FROM genreList)
	LOOP 
	
	DBMS_OUTPUT.PUT_LINE('Genre ID:'||'->'||TO_CHAR (I.genre_id));
	DBMS_OUTPUT.PUT_LINE('Genre Name:'||'->'||I.genre_name);
	
	DBMS_OUTPUT.PUT_LINE(chr(10));
	END LOOP;
	
END see_all_genre_proc_SA;
/
