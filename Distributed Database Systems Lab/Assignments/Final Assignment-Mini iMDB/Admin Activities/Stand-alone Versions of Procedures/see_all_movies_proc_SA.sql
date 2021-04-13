SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE see_all_movies_proc_SA 
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('The movies in our collection are:');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	
	FOR I IN ((SELECT movieDetails.movie_id,movieDetails.movie_name,movieDetails.movie_avg_ratings,movieDetails.movie_release_date
	FROM movieDetails) union (SELECT movieDetails.movie_id,movieDetails.movie_name,movieDetails.movie_avg_ratings,movieDetails.movie_release_date
	FROM movieDetails@site_link1))
	LOOP 
	DBMS_OUTPUT.PUT_LINE('Movie ID'||'->'||I.movie_id);
	DBMS_OUTPUT.PUT_LINE('Movie Name'||'->'||I.movie_name);
	DBMS_OUTPUT.PUT_LINE('Average Rating(OUT OF 5)'||'->'||I.movie_avg_ratings);
	DBMS_OUTPUT.PUT_LINE('Date'||'->'||TO_CHAR(I.movie_release_date));
	DBMS_OUTPUT.PUT_LINE(chr(10));
	END LOOP;
	
END see_all_movies_proc_SA;
/
