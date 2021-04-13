SET SERVEROUTPUT ON;

CREATE OR REPLACE VIEW MOVIES_VIEW2 AS
SELECT movie_id,movie_name,movie_avg_ratings, movie_release_date
FROM movieDetails;
CREATE OR REPLACE VIEW GENRE_VIEW AS
SELECT genre_id,genre_name
FROM GENRELIST;
CREATE OR REPLACE VIEW COMPLAINT_VIEW2 AS
SELECT complaint_id,complaint_details
FROM complaints
where resolved=0;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Enter admin name and password to login');
	DBMS_OUTPUT.PUT_LINE('Once you have logged in, your choices are:');
	DBMS_OUTPUT.PUT_LINE('1: See All-Movies List');
	DBMS_OUTPUT.PUT_LINE('2: Add a Movie');
	DBMS_OUTPUT.PUT_LINE('3: Remove a Movie');
	DBMS_OUTPUT.PUT_LINE('4: See User Complaints');
	DBMS_OUTPUT.PUT_LINE('5: Resolve a Complaint');
	DBMS_OUTPUT.PUT_LINE('6: Add a Genre');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	--DBMS_OUTPUT.PUT_LINE('The movies currently in our collection are:');
	
	DBMS_OUTPUT.PUT_LINE(chr(10));
END;
/

--select * from MOVIES_VIEW2;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Genre List:');
END;
/
select * from GENRE_VIEW;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Pending complaints:');
END;
/
select * from COMPLAINT_VIEW2;



DECLARE
	adminName varchar2(40):='&adminName';
	password varchar2(40):='&password';
	
	choice number(1);
	A adminDetails.admin_name%TYPE;
	B adminDetails.password%TYPE;
	C adminDetails.admin_id%TYPE;
	currentAid adminDetails.admin_id%TYPE;
	
	Movie_ID movieDetails.movie_id%TYPE;
	Name movieDetails.movie_name%TYPE;
	Synopsis movieDetails.movie_synopsis%TYPE;
	Genre1 movieDetails.movie_name%TYPE;
	Genre2 movieDetails.movie_name%TYPE;
	Genre3 movieDetails.movie_name%TYPE;
	Release_Date movieDetails.movie_release_date%TYPE;
	R_Tomatoes movieDetails.movie_name%TYPE;
	Lang movieDetails.movie_language%TYPE;
	
	Genre_new genreList.genre_name%TYPE;
	Complaint_to_resolve complaints.complaint_id%TYPE;
	
	
	
	CURSOR I IS (SELECT adminDetails.admin_name,adminDetails.password,adminDetails.admin_id from adminDetails);
	flag number:=0;
	incorrectPassword exception;

BEGIN

	OPEN I;
		LOOP
			FETCH I INTO A,B,C;				
			IF A=adminName and B=password  THEN
				currentAid:=C;
				DBMS_OUTPUT.PUT_LINE('Logged in successfully');
				flag:=1;
				exit;
			ELSIF A=adminName and B<>password THEN
				RAISE incorrectPassword;
				flag:=2;
				exit;
			ELSE
				flag:=0;
				
			END IF;
			EXIT WHEN I%notfound;
		END LOOP;
	CLOSE I;
	
	
	IF flag=1 THEN
		
		choice:='&choice';
		CASE
			--SEE ALL MOVIES
			WHEN choice=1 THEN
				see_all_movies_procedure();
			
			
			--ADD A MOVIE TO DATABASE
			WHEN choice=2 THEN
				Name:='&movieToAdd_NAME';
				Synopsis:='&movieToAdd_SYNOPSIS';
				Genre1:='&movieToAdd_GENRE1';
				Genre2:='&movieToAdd_GENRE2';
				Genre3:='&movieToAdd_GENRE3';
				Release_Date:='&movieToAdd_RELEASE';
				R_Tomatoes:='&movieToAdd_ROT_TOMATO';
				Lang:='&movieToAdd_LANGUAGE';
								
				see_all_genre_procedure();
				IF Genre1 IS NOT NULL AND Genre2 IS NOT NULL AND Genre3 IS NOT NULL THEN
				add_movie_procedure(Name,Synopsis,TO_NUMBER(GENRE1),TO_NUMBER(GENRE2),TO_NUMBER(GENRE3),TO_DATE(Release_Date),TO_NUMBER(R_Tomatoes),Lang);
				
				ELSIF Genre1 IS NOT NULL AND Genre2 IS NOT NULL AND Genre3 IS NULL THEN
				add_movie_procedure(Name,Synopsis,TO_NUMBER(GENRE1),TO_NUMBER(GENRE2),0,TO_DATE(Release_Date),TO_NUMBER(R_Tomatoes),Lang);
				
				ELSIF Genre1 IS NOT NULL AND Genre2 IS NULL AND Genre3 IS NULL THEN
				add_movie_procedure(Name,Synopsis,TO_NUMBER(GENRE1),0,0,TO_DATE(Release_Date),TO_NUMBER(R_Tomatoes),Lang);
				
				END IF;
				
				
				
			--REMOVE A MOVIE FROM DATABASE	
			WHEN choice=3 THEN
				see_all_movies_procedure();
				Movie_ID:='&movie_id_to_remove';
				remove_movie_procedure(Movie_ID);
			
			
			--SEE ALL PENDING COMPLAINTS
			WHEN choice=4 THEN
				see_all_complaints_procedure();
			
			
			--RESOLVE PENDING COMPLAINTS
		    WHEN choice=5 THEN
				Complaint_to_resolve:='&complaint_to_resolve';
				see_all_complaints_procedure();
				resolve_complaint_procedure(TO_NUMBER(Complaint_to_resolve));
				see_all_complaints_procedure();
			
			
			--ADD A NEW GENRE TO DATABASE
			WHEN choice=6 THEN
				Genre_new:='&genre_to_add';
				add_genre_procedure(Genre_new);
				
			
				
			
			
		END CASE;
		
		
	END IF;
	
EXCEPTION
WHEN incorrectPassword THEN
	DBMS_OUTPUT.PUT_LINE('Incorrect password');

	
END;
/ 

