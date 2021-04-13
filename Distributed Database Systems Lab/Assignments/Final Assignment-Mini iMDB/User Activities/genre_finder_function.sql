SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION genre_finder_function(gid in movieDetails.movie_genre1%TYPE)
 RETURN genreList.genre_name%TYPE
		IS
gen genreList.genre_name%TYPE:='-';

BEGIN	
	
	SELECT genreList.genre_name into gen 
	from genreList 
	where genreList.genre_id=gid;

RETURN gen;
END genre_finder_function;
/
