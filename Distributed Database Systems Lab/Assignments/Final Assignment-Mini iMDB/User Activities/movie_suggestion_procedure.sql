SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE movie_suggestion_procedure(id in userDetails.user_id%TYPE)
		AS

genreName1 genreList.genre_name%TYPE:='-';	
genreName2 genreList.genre_name%TYPE:='-';	
genreName3 genreList.genre_name%TYPE:='-';	
TYPE nestedTableType IS TABLE OF int;
genreTableFull nestedTableType := nestedTableType();
movieTableFull nestedTableType := nestedTableType();
watchedMoviesTableFull nestedTableType := nestedTableType();
genreCount int:=1;
movieCount int:=1;
watchedCount int:=1;
avgRating movieDetails.movie_avg_ratings%TYPE:=0.0;	

BEGIN
	genreTableFull.EXTEND(100);
	movieTableFull.EXTEND(100);
	watchedMoviesTableFull.EXTEND(100);
    	DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Based on the movies you have watched so far, our suggestions are:');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	--MAKING A LIST OF ALL THE GENRES WATCHED
	FOR I IN (SELECT movie_id FROM watchedList WHERE watchedList.user_id=id)
	LOOP
		watchedMoviesTableFull(watchedCount):=I.movie_id;
		watchedCount:=watchedCount+1;
		FOR J IN(select movie_genre1,movie_genre2,movie_genre3 from movieDetails where movieDetails.movie_id = I.movie_id 
		UNION select movie_genre1,movie_genre2,movie_genre3 from movieDetails@site_link1 where movie_id = I.movie_id )
		LOOP
			genreTableFull(genreCount):=J.movie_genre1;
			genreCount:=genreCount+1;
			genreTableFull(genreCount):=J.movie_genre2;
			genreCount:=genreCount+1;
			genreTableFull(genreCount):=J.movie_genre3;
			genreCount:=genreCount+1;
			
			
		END LOOP;
		
	END LOOP;
	
	--SELECTING DISTINCT GENRES
	genreTableFull:=genreTableFull MULTISET INTERSECT DISTINCT genreTableFull;

	FOR count_var IN 1..genreTableFull.COUNT LOOP
		for X in ((select movie_id from movieDetails where movie_genre1=genreTableFull(count_var) or
		movie_genre2=genreTableFull(count_var) or movie_genre3=genreTableFull(count_var))
		UNION (select movie_id from movieDetails@site_link1 where movie_genre1=genreTableFull(count_var) or
		movie_genre2=genreTableFull(count_var) or movie_genre3=genreTableFull(count_var))	)
		loop
			movieTableFull(movieCount):=X.movie_id;
			movieCount:=movieCount+1;
		end loop;
		
	END LOOP;
	--SELECTING DISTINCT MOVIES BASED ON THE GENRES
	movieTableFull:=movieTableFull MULTISET INTERSECT DISTINCT movieTableFull;
	
	--REMOVING ALREADY WATCHED MOVIES
	watchedMoviesTableFull:= watchedMoviesTableFull MULTISET INTERSECT DISTINCT watchedMoviesTableFull;
	movieTableFull:=movieTableFull MULTISET EXCEPT watchedMoviesTableFull;
	FOR M IN 1..movieTableFull.COUNT LOOP
		for Y in (select * from movieDetails where movie_id=movieTableFull(M) UNION select * from movieDetails@site_link1 where movie_id=movieTableFull(M))
		loop
			IF Y.movie_genre1 IS NOT NULL THEN
				genreName1:=genre_finder_function(Y.movie_genre1);
			ELSE genreName1:=' ';
			END IF;
			IF Y.movie_genre2 IS NOT NULL THEN
				genreName2:=genre_finder_function(Y.movie_genre2);
			ELSE genreName2:=' ';
			END IF;
			IF Y.movie_genre3 IS NOT NULL THEN
				genreName3:=genre_finder_function(Y.movie_genre3);
			ELSE genreName3:=' ';
			END IF;
			
			--INSERTING AVERAGE RATING
			avgRating:=avg_rating_calc_func(Y.movie_id);
			
			DBMS_OUTPUT.PUT_LINE('Movie Name'||'->'||Y.movie_name);
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE('Synopsis'||'->'||Y.movie_synopsis);
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE('Genre'||'->'||genreName1||', '||genreName2||', '||genreName3);
			DBMS_OUTPUT.PUT_LINE('Avg Rating(OUT OF 5)'||'->'||avgRating);
			DBMS_OUTPUT.PUT_LINE('Rotten Tomato(%)'||'->'||Y.movie_rotten_tomato);
			DBMS_OUTPUT.PUT_LINE('Release-Date'||'->'||Y.movie_release_date);
			DBMS_OUTPUT.PUT_LINE(chr(10));
		
		end loop;
	END LOOP;
	
END movie_suggestion_procedure;
/
