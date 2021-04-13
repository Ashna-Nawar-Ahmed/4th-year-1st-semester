
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE mark_and_rate_procedure(u_id in userDetails.user_id%TYPE,m_id in movieDetails.movie_id%TYPE,
rating in watchedList.user_rating%TYPE)
		AS
avgRating movieDetails.movie_avg_ratings%TYPE:=0.0;	

BEGIN	
	insert into watchedList(user_id,movie_id,user_rating) values(u_id,m_id,rating);
	avgRating:=avg_rating_calc_func(m_id);
	commit;
	
	DBMS_OUTPUT.PUT_LINE('MOVIE HAS BEEN MARKED AS WATCHED');

	
END mark_and_rate_procedure;
/
