SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE add_movie_procedure( m_name in movieDetails.movie_name%TYPE, m_synop in movieDetails.movie_synopsis%TYPE, 
m_gen1 in movieDetails.movie_genre1%TYPE, m_gen2 in movieDetails.movie_genre2%TYPE, m_gen3 in movieDetails.movie_genre3%TYPE,  
m_release_date in movieDetails.movie_release_date%TYPE, m_rotten_tom in movieDetails.movie_rotten_tomato%TYPE, m_lang in movieDetails.movie_language%TYPE)
		IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10));
	DBMS_OUTPUT.PUT_LINE('Inserting new movie...');
	DBMS_OUTPUT.PUT_LINE(chr(10));
	
	IF m_lang='English' or m_lang='ENGLISH' or m_lang='english' THEN
		IF m_gen1<>0 and m_gen2<>0 and m_gen3<>0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_genre3,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_gen3,m_release_date,m_rotten_tom,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2<>0 and m_gen3=0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_gen2,m_release_date,m_rotten_tom,m_lang);
		
		ELSIF m_gen1<>0 and m_gen2=0 and m_gen3=0 THEN
			INSERT INTO movieDetails(movie_name,movie_synopsis,movie_genre1,movie_release_date,movie_rotten_tomato,movie_language)
			values(m_name,m_synop,m_gen1,m_release_date,m_rotten_tom,m_lang);
	
		END IF;
		commit;
	
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

	
END add_movie_procedure;
/
