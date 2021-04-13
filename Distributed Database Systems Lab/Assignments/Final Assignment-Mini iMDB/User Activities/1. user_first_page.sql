SET SERVEROUTPUT ON;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Enter username and password to login or signup. ');
	DBMS_OUTPUT.PUT_LINE('Once you have logged in, your choices are:');
	DBMS_OUTPUT.PUT_LINE('1: See Watched-Movies List');
	DBMS_OUTPUT.PUT_LINE('2: Search for a movie(by title or genre)');
	DBMS_OUTPUT.PUT_LINE('3: See Our suggestions');
	DBMS_OUTPUT.PUT_LINE('4: Mark a movie as WATCHED(by movie_id) and rate it');
	DBMS_OUTPUT.PUT_LINE('5: Register a complaint or suggestion.');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('The movies currently in our collection are:');
	for I IN (SELECT * FROM movieDetails union SELECT * FROM movieDetails@site_link1 )
	LOOP
	DBMS_OUTPUT.PUT_LINE('Movie ID: ' ||I.movie_id||'->'||'Movie Name: '||I.movie_name);
	DBMS_OUTPUT.PUT_LINE(chr(10));
	END LOOP;
END;
/
DECLARE
	username varchar2(40):='&userName';
	password varchar2(40):='&password';
	searchTerm varchar2(40);
	movie_id_for_marking varchar2(40);
	ratings varchar2(40);
	complaint varchar2(500);
	choice number(1);
	A userDetails.user_name%TYPE;
	B userDetails.password%TYPE;
	C userDetails.user_id%TYPE;
	currentUid userDetails.user_id%TYPE;
	CURSOR I IS (SELECT userDetails.user_name,userDetails.password,userDetails.user_id from userDetails);
	flag number:=0;
	incorrectPassword exception;
	nonExistentAccount exception;

BEGIN

	OPEN I;
		LOOP
			FETCH I INTO A,B,C;				
			IF A=username and B=password  THEN
				currentUid:=C;
				DBMS_OUTPUT.PUT_LINE('Logged in successfully');
				flag:=1;
				exit;
			ELSIF A=username and B<>password THEN
				RAISE incorrectPassword;
				flag:=2;
				exit;
			ELSE
				flag:=0;
				
			END IF;
			EXIT WHEN I%notfound;
		END LOOP;
	CLOSE I;
	IF flag=0 THEN
		RAISE nonExistentAccount;
		
	END IF;
	
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Welcome to your account. What do you want to do?');
		DBMS_OUTPUT.PUT_LINE('1: See Watched List');
		DBMS_OUTPUT.PUT_LINE('2: Search for a movie(by title or genre)');
		DBMS_OUTPUT.PUT_LINE('3: Our suggestions');
		DBMS_OUTPUT.PUT_LINE('4: Mark as WATCHED and rate a movie');
		DBMS_OUTPUT.PUT_LINE('5: Register a complaint or suggestion.');
		choice:='&choice';
		CASE
			--SEE WATCHED MOVIES IN A LIST
			WHEN choice=1 THEN				
				see_watch_list_procedure(currentUid);
			
			
			--SEARCH FOR A MOVIE BY TITLE OR GENRE
			WHEN choice=2 THEN
				searchTerm:='&search_by_title_or_genre';
				search_for_movie_procedure(searchTerm);
			
			
			--SEE OUR SUGGESTIONS FOR WHAT TO WATCH NEXT
			WHEN choice=3 THEN
				movie_suggestion_procedure(currentUid);
			
			
			--MARK A MOVIE AS WATCHED AND RATE IT
			WHEN choice=4 THEN				
				movie_id_for_marking:='&movie_id_to_mark_watched';
				ratings:='&movie_rating';
				IF movie_id_for_marking IS NOT NULL THEN
					movie_id_for_marking:=TO_NUMBER(movie_id_for_marking);
				END IF;
				IF ratings IS NOT NULL THEN
					ratings:=TO_NUMBER(ratings);
				END IF;
				mark_and_rate_procedure(currentUid,movie_id_for_marking,ratings);
				
				
			--ADD A COMPLAINT OR SUGGESTION
		    WHEN choice=5 THEN
				complaint:='&complaint_or_suggestion';
				register_complaint_procedure(currentUid,complaint);
						
		END CASE;
		
		
	END IF;
	
EXCEPTION
WHEN incorrectPassword THEN
	DBMS_OUTPUT.PUT_LINE('Incorrect password');
WHEN nonExistentAccount THEN
	DBMS_OUTPUT.PUT_LINE('Account does not exist');
	currentUid:=signUp_function(username,password);
	
END;
/ 

