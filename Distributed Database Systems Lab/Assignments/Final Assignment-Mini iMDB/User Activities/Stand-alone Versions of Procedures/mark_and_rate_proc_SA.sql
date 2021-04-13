
SET SERVEROUTPUT ON;
BEGIN
	see_all_movies_proc_SA();
END;
/
CREATE OR REPLACE PROCEDURE mark_and_rate_proc_SA
		AS
avgRating movieDetails.movie_avg_ratings%TYPE:=0.0;	

u_id userDetails.user_id%TYPE;
m_id movieDetails.movie_id%TYPE;
mov_id varchar2(40):='&movie_id_to_mark';
rating watchedList.user_rating%TYPE;
rat varchar2(40):='&movie_ratings';


----NEEDED FOR LOGIN
/*username varchar2(40):='&userName';
password varchar2(40):='&password';*/

----FOR DIRECT USERID
us_id varchar2(40):='&user_id';

BEGIN	

	----NEEDED FOR LOGIN-----
	/*FOR I IN (SELECT user_name,password,user_id from userDetails)
	LOOP
		IF I.user_name=username and I.password=password then
			DBMS_OUTPUT.PUT_LINE('LOGGED IN SUCCESSFULLY');
			u_id:=I.user_id;
			exit;
		ELSIF I.user_name=username and I.password<>password then
			DBMS_OUTPUT.PUT_LINE('INCORRECT PASSWORD');
			exit;
		END IF;
	END LOOP;*/
	
	----FOR DIRECT userid-----
	u_id:=TO_NUMBER(us_id);
	
	
	IF mov_id IS NOT NULL THEN
		m_id:=TO_NUMBER(mov_id);
	END IF;
	IF rat IS NOT NULL THEN
		rating:=TO_NUMBER(rat);
	END IF;
	
	
	insert into watchedList(user_id,movie_id,user_rating) values(u_id,m_id,rating);
	avgRating:=avg_rating_calc_func(m_id);
	commit;
	
	DBMS_OUTPUT.PUT_LINE('MOVIE HAS BEEN MARKED AS WATCHED');

	
END mark_and_rate_proc_SA;
/
