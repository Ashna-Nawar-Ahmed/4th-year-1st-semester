--GENRE LIST TABLE
create table genreList(
	genre_id int, 
	genre_name varchar2(30), 
	PRIMARY KEY (genre_id));
	
--AUTO INCREMENT GENRE_ID
drop sequence genreId_sequence;
drop trigger gid_trigger;
CREATE SEQUENCE genreId_sequence START WITH 1;

CREATE OR REPLACE TRIGGER gid_trigger 
BEFORE INSERT ON genreList
FOR EACH ROW
BEGIN
  SELECT genreId_sequence.NEXTVAL
  INTO   :new.genre_id
  FROM   dual;
  
  
END;
/

---MOVIE DETAILS TABLE
create table movieDetails(
	movie_id int, 
	movie_name varchar2(50), 
	movie_synopsis varchar2(500), 
	movie_genre1 int,
	movie_genre2 int,
	movie_genre3 int, 
	movie_avg_ratings number(3,2), 
	movie_release_date date, 
	movie_rotten_tomato int,
	movie_language varchar2(50),
	PRIMARY KEY (movie_id));

ALTER TABLE movieDetails
ADD FOREIGN KEY (movie_genre1)
   REFERENCES genreList (genre_id);
   
ALTER TABLE movieDetails
ADD FOREIGN KEY (movie_genre2)
   REFERENCES genreList (genre_id);
   
ALTER TABLE movieDetails
ADD FOREIGN KEY (movie_genre3)
   REFERENCES genreList (genre_id);

--AUTO INCREMENT MOVIE ID
drop sequence movieId_sequence;
CREATE SEQUENCE movieId_sequence START WITH 10000;
CREATE OR REPLACE TRIGGER mid_trigger 
BEFORE INSERT ON movieDetails 
FOR EACH ROW

BEGIN
  SELECT movieId_sequence.NEXTVAL
  INTO   :new.movie_id
  FROM   dual;
END;
/


insert into genreList(genre_name) values('Action');
insert into genreList(genre_name) values('Adventure');
insert into genreList(genre_name) values('Comedy');
insert into genreList(genre_name) values('Crime');
insert into genreList(genre_name) values('Drama');
insert into genreList(genre_name) values('Family');
insert into genreList(genre_name) values('Fantasy');
insert into genreList(genre_name) values('Historical');
insert into genreList(genre_name) values('Horror');
insert into genreList(genre_name) values('Musical');
insert into genreList(genre_name) values('Mystery');
insert into genreList(genre_name) values('Political');
insert into genreList(genre_name) values('Romance');
insert into genreList(genre_name) values('Science Fiction');
insert into genreList(genre_name) values('Thriller');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Monpura','Monpura, is a Bangladeshi Bengali film, directed by Giasuddin Selim. The film was remade into Bengali India in 2010
 as Achin Pakhi, which was directed by Anjan Das. Monpura is a romantic tragedy film set in rural Bangladesh. ',13,5,'13-feb-2009',100,'Bangla');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Aynabaji','Aynabaji is a 2016 Bangladeshi crime thriller film directed by Amitabh Reza Chowdhury and produced by Ziauddin Adil.
 The film stars Chanchal Chowdhury, Masuma Rahman Nabila and Partha Barua in lead roles. It is the director Amitabh Rezas first feature film.',
 11,4,'30-sep-2016',100,'Bangla');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Daruchini Dip','Daruchini Dip is a Bangladeshi Bengali-language film. It was released on 31 August 2007 throughout Bangladesh. 
The film is based on the Bangladeshi novelist and film maker Humayun Ahmeds popular novel of the same name. 
It was directed by popular actor - director Tauquir Ahmed. ',13,2,'31-aug-2007',100,'Bangla');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Ratsasan','Arun gives up on his dream of becoming a filmmaker and takes up the job of a police officer after his fathers death. 
He then attempts to track down a psycho killer.',4,15,'05-oct-2018',100,'Tamil');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('3 Idiots','In college, Farhan and Raju form a great bond with Rancho due to his refreshing outlook. Years later, a bet gives them
 a chance to look for their long-lost friend whose existence seems rather elusive.',3,13,'23-dec-2009',100,'Hindi');

 insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Taare Zameen Par','Ishaan is criticised by his parents for his poor academic performance and is sent away to a boarding school. 
Ram, an art teacher, however, realises he has dyslexia and helps him uncover his potential.',6,5,'21-dec-2007',91,'Hindi');
 
 insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Rang De Basanti','When Sue selects a few students to portray various Indian freedom fighters in her film, she unwittingly awakens 
their patriotism. The emotional and mental process turns them into rebels for a cause.',10,13,'26-jan-2006',83,'Hindi');
 
 insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Debi','Debi: Misir Ali Prothombar or simply Debi is a 2018 Bangladeshi supernatural thriller film based on Humayun Ahmeds novel 
of the same name. It is directed by Anam Biswas, starring Chanchal Chowdhury as Misir Ali, Jaya Ahsan, Iresh Zaker, Animesh Aich and 
Sabnam Faria.',11,5,'19-oct-2018',100,'Bangla');
 
 insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Shyamol Chhaya','Shyamol Chhaya is a Bangladeshi Bengali-language film. It was released on 16 December 2005. Written and 
directed by Humayun Ahmed.',12,5,'16-dec-2005',100,'Bangla');
 
 insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Aguner Poroshmoni','Alam, a member of the liberation army, plans to start a guerrilla operation against the Pakistan military. 
However, his fellow freedom fighters are tortured and murdered and eventually, he is seriously injured.',12,5,'16-dec-1995',100,'Bangla');