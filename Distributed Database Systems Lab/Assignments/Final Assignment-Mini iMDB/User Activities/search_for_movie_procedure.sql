SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE search_for_movie_procedure(search_term in movieDetails.movie_name%TYPE)
		AS
genreName1 genreList.genre_name%TYPE:='-';	
genreName2 genreList.genre_name%TYPE:='-';	
genreName3 genreList.genre_name%TYPE:='-';
avgRating movieDetails.movie_avg_ratings%TYPE:=0.0;	
genreId genreList.genre_id%TYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search results:');	
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	--SEARCHING BY MOVIE NAME
	FOR I IN ((SELECT * FROM movieDetails where 
	UPPER(movie_name) like UPPER('%'||search_term||'%')) UNION 
	(SELECT * FROM movieDetails@site_link1 where 
	UPPER(movie_name) like UPPER('%'||search_term||'%')))
	
	LOOP 
		IF I.movie_genre1 IS NOT NULL THEN
			genreName1:=genre_finder_function(I.movie_genre1);
		ELSE genreName1:=' ';
		END IF;
		IF I.movie_genre2 IS NOT NULL THEN
			genreName2:=genre_finder_function(I.movie_genre2);
		ELSE genreName2:=' ';
		END IF;
		IF I.movie_genre3 IS NOT NULL THEN
			genreName3:=genre_finder_function(I.movie_genre3);
		ELSE genreName3:=' ';
		END IF;
		
		--INSERTING AVERAGE RATING
		avgRating:=avg_rating_calc_func(I.movie_id);
		
		DBMS_OUTPUT.PUT_LINE('Movie Name'||'->'||I.movie_name);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Synopsis'||'->'||I.movie_synopsis);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Genre'||'->'||genreName1||', '||genreName2||', '||genreName3);
		DBMS_OUTPUT.PUT_LINE('Avg Rating(OUT OF 5)'||'->'||avgRating);
		DBMS_OUTPUT.PUT_LINE('Rotten Tomato(%)'||'->'||I.movie_rotten_tomato);
		DBMS_OUTPUT.PUT_LINE('Release-Date'||'->'||I.movie_release_date);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		
	 DBMS_OUTPUT.PUT_LINE(chr(10));
	
	
	END LOOP;
	
	--SEARCHING BY GENRE
	SELECT genreList.genre_id into genreId 
	FROM genreList where 
	UPPER(genre_name) like UPPER('%'||search_term||'%');
	FOR I IN ((select * from movieDetails where movie_genre1=genreId or movie_genre2=genreId or movie_genre3=genreId) UNION
	(select * from movieDetails@site_link1 where movie_genre1=genreId or movie_genre2=genreId or movie_genre3=genreId))
	
	LOOP 
		
		IF I.movie_genre1 IS NOT NULL THEN
			genreName1:=genre_finder_function(I.movie_genre1);
		ELSE genreName1:=' ';
		END IF;
		IF I.movie_genre2 IS NOT NULL THEN
			genreName2:=genre_finder_function(I.movie_genre2);
		ELSE genreName2:=' ';
		END IF;
		IF I.movie_genre3 IS NOT NULL THEN
			genreName3:=genre_finder_function(I.movie_genre3);
		ELSE genreName3:=' ';
		END IF;
		
		--INSERTING AVERAGE RATING
		avgRating:=avg_rating_calc_func(I.movie_id);
		
		
		DBMS_OUTPUT.PUT_LINE('Movie Name'||'->'||I.movie_name);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Synopsis'||'->'||I.movie_synopsis);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Genre'||'->'||genreName1||', '||genreName2||', '||genreName3);
		DBMS_OUTPUT.PUT_LINE('Avg Rating(OUT OF 5)'||'->'||avgRating);
		DBMS_OUTPUT.PUT_LINE('Rotten Tomato(%)'||'->'||I.movie_rotten_tomato);
		DBMS_OUTPUT.PUT_LINE('Release-Date'||'->'||I.movie_release_date);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		
	 DBMS_OUTPUT.PUT_LINE(chr(10));
	 
	 END LOOP;
	 
	 EXCEPTION
	 WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No more results found.');
END search_for_movie_procedure;
/
