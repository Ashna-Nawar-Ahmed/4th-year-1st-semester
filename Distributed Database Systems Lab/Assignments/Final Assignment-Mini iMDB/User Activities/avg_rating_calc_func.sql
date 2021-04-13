SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION avg_rating_calc_func(id in movieDetails.movie_id%TYPE)
  RETURN movieDetails.movie_avg_ratings%TYPE
		IS
avgRating movieDetails.movie_avg_ratings%TYPE:=0.0;	
BEGIN	
	
	FOR I IN (SELECT movie_id from movieDetails union SELECT movie_id from movieDetails@site_link1)
	LOOP 
	SELECT AVG(user_rating) into avgRating FROM watchedList where movie_id=id;
	UPDATE movieDetails
	set movie_avg_ratings=avgRating
	where movie_id=id;
	commit;
	

	UPDATE movieDetails@site_link1
	set movie_avg_ratings=avgRating
	where movie_id=id;
	commit;
	END LOOP;
	
RETURN avgRating;	
END avg_rating_calc_func;
/
