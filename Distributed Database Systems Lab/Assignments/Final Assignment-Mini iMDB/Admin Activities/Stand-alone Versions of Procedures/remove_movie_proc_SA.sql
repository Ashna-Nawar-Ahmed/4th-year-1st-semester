SET SERVEROUTPUT ON;

BEGIN
	see_all_movies_proc_SA();
END;
/

CREATE OR REPLACE PROCEDURE remove_movie_proc_SA
		AS
mov_id varchar2(20):='&movie_id_to_remove';
m_id movieDetails.movie_id%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Removing movie...');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	IF mov_id IS NOT NULL THEN
		m_id:=TO_NUMBER(mov_id);
	END IF;
	IF m_id>9999 THEN
		DELETE FROM watchedList WHERE movie_id=m_id;
		DELETE FROM movieDetails@site_link1 WHERE movie_id=m_id;		
		commit;
	ELSE
		DELETE FROM watchedList WHERE movie_id=m_id;
		DELETE FROM movieDetails WHERE movie_id=m_id;		
		commit;
	END IF;
	
	
	DBMS_OUTPUT.PUT_LINE('Movie has been removed.');

	
END remove_movie_proc_SA;
/
