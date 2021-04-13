SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE add_movie_proc_SA
		AS
m_name movieDetails.movie_name%TYPE;
m_synop movieDetails.movie_synopsis%TYPE; 
m_genre1 varchar2(40);
m_genre2 varchar2(40);
m_genre3 varchar2(40);
m_gen1 movieDetails.movie_genre1%TYPE;
m_gen2 movieDetails.movie_genre1%TYPE;
m_gen3 movieDetails.movie_genre1%TYPE;  
m_release_date movieDetails.movie_release_date%TYPE;
m_rotten_tom varchar2(40);
m_rotten_tomato movieDetails.movie_rotten_tomato%TYPE;
m_lang movieDetails.movie_language%TYPE;
		
BEGIN
	m_name  :='&movie_name';
	m_synop :='&movie_synop'; 
	m_genre1:='&movie_gen1';
	m_genre2:='&movie_gen2';
	m_genre3:='&movie_gen3';
	
	m_release_date:='&movie_releaseDate';
	m_rotten_tom:='&movie_rottenTomato';
	m_lang:='&movie_lang';		
	
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Inserting new movie...');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	IF m_genre1 IS NULL THEN
		m_gen1:=0;
	ELSE m_gen1:=TO_NUMBER(m_genre1);
	END IF;
	IF m_genre2 IS NULL THEN
		m_gen2:=0;
	ELSE m_gen2:=TO_NUMBER(m_genre2);
	END IF;
	IF m_genre3 IS NULL THEN
		m_gen3:=0;
	ELSE m_gen3:=TO_NUMBER(m_genre3);
	END IF;
	IF m_rotten_tom IS NULL THEN
		m_rotten_tomato:=0;
	ELSE m_rotten_tomato:=TO_NUMBER(m_rotten_tom);
	END IF;
	
	--INSERTING ENGLISH MOVIES
	IF m_lang='English' or m_lang='ENGLISH' or m_lang='english' THEN
		IF m_gen1<>0 and m_gen2<>0 and m_gen3<>0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_genre3,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_gen3,m_release_date,m_rotten_tomato,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2<>0 and m_gen3=0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_release_date,m_rotten_tomato,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2=0 and m_gen3=0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_release_date,m_rotten_tomato,m_lang);
	
		END IF;
		commit;
	
	--INSERTING NON ENGLISH MOVIES
	ELSE 
		IF m_gen1<>0 and m_gen2<>0 and m_gen3<>0 THEN
			INSERT INTO movieDetails@site_link1(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_genre3,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_gen3,m_release_date,100,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2<>0 and m_gen3=0 THEN
			INSERT INTO movieDetails@site_link1(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_release_date,100,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2=0 and m_gen3=0 THEN
			INSERT INTO movieDetails@site_link1(movie_name,movie_synopsis,movie_genre1,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_release_date,100,m_lang);
	
		END IF;
		commit;
	END IF;
	
	
	DBMS_OUTPUT.PUT_LINE('Movie '||m_name||' has been inserted.');

	
END add_movie_proc_SA;
/
