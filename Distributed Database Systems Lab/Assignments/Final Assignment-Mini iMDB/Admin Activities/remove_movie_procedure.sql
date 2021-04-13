SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE remove_movie_procedure( m_id in movieDetails.movie_id%TYPE)
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Removing movie...');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
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

	
END remove_movie_procedure;
/
