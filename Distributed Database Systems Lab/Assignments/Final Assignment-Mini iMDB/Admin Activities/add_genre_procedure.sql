SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE add_genre_procedure(g_name in genreList.genre_name%TYPE)
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Inserting new genre...');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	insert into genreList(genre_name) values(g_name);	
	commit;
	insert into genreList@site_link1(genre_name) values(g_name);	
	commit;
	
	DBMS_OUTPUT.PUT_LINE('Genre '||g_name||' has been inserted.');
	
END add_genre_procedure;
/
