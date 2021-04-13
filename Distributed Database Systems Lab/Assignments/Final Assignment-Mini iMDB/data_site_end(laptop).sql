clear screen;

drop table genreList cascade constraints;
drop table movieDetails cascade constraints;
drop table userDetails cascade constraints;
drop table adminDetails cascade constraints;
drop table complaints cascade constraints;
drop table watchedList cascade constraints;


---------------CREATING DATABASE---------------------------




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
CREATE SEQUENCE movieId_sequence START WITH 1;
CREATE OR REPLACE TRIGGER mid_trigger 
BEFORE INSERT ON movieDetails 
FOR EACH ROW

BEGIN
  SELECT movieId_sequence.NEXTVAL
  INTO   :new.movie_id
  FROM   dual;
END;
/


---USER DETAILS TABLE
create table userDetails(
	user_id NUMBER(10), 
	user_name varchar2(30), 
	password varchar2(30), 
	PRIMARY KEY (user_id));

--AUTO INCREMENT USER ID
drop sequence userId_sequence;
CREATE SEQUENCE userId_sequence START WITH 1;
CREATE OR REPLACE TRIGGER uid_trigger 
BEFORE INSERT ON userDetails 
FOR EACH ROW

BEGIN
  SELECT userId_sequence.NEXTVAL
  INTO   :new.user_id
  FROM   dual;
END;
/


---WATCHED LIST TABLE
create table watchedList(
	watch_id NUMBER(10),
	user_id NUMBER(10), 
	movie_id int,
	user_rating int,
	date_added date);
	
ALTER TABLE watchedList
ADD FOREIGN KEY (user_id)
   REFERENCES userDetails (user_id);



--AUTO INCREMENT WATCH_ID AND AUTO-ADD CURRENT DATE 
drop sequence watchId_sequence;
drop trigger wid_trigger;
CREATE SEQUENCE watchId_sequence START WITH 1;

CREATE OR REPLACE TRIGGER wid_trigger 
BEFORE INSERT ON watchedList
FOR EACH ROW
BEGIN
  SELECT watchId_sequence.NEXTVAL
  INTO   :new.watch_id
  FROM   dual;
  
  SELECT SYSDATE
  INTO   :new.date_added
  FROM   dual;
END;
/

---ADMIN DETAILS TABLE
create table adminDetails(
	admin_id NUMBER(10),
	admin_name varchar2(30),	
	password varchar2(30), 
	PRIMARY KEY (admin_id));
	
	
--COMPLAINTS TABLE
create table complaints(
	complaint_id NUMBER(10),
	user_id NUMBER(10), 
	complaint_details varchar2(500),
	resolved int,
	date_submitted date);	
	
ALTER TABLE complaints
ADD FOREIGN KEY (user_id)
   REFERENCES userDetails (user_id);

--AUTO INCREMENT COMPLAINT_ID AND AUTO-ADD CURRENT DATE 
drop sequence complaintId_sequence;
drop trigger cid_trigger;
CREATE SEQUENCE complaintId_sequence START WITH 1;

CREATE OR REPLACE TRIGGER cid_trigger 
BEFORE INSERT ON complaints
FOR EACH ROW
BEGIN
  SELECT complaintId_sequence.NEXTVAL
  INTO   :new.complaint_id
  FROM   dual;
  
  SELECT SYSDATE
  INTO   :new.date_submitted
  FROM   dual;
END;
/

	
insert into userDetails(user_name,password) values('ashna','123456');
insert into userDetails(user_name,password) values('tayeeba','123456');
insert into userDetails(user_name,password) values('tasfia','123456');

insert into adminDetails(admin_id,admin_name,password) values(24,'nusrat','123456');
insert into adminDetails(admin_id,admin_name,password) values(26,'musrat','123456');
insert into adminDetails(admin_id,admin_name,password) values(28,'israt','123456');

insert into complaints(user_id,complaint_details,resolved) values(1,'please add life of pi',0);
insert into complaints(user_id,complaint_details,resolved) values(2,'please add schidlers list',0);
insert into complaints(user_id,complaint_details,resolved) values(3,'cannot see my watched list, please resolve',0);
insert into complaints(user_id,complaint_details,resolved) values(2,'please add booksmart',0);
insert into complaints(user_id,complaint_details,resolved) values(1,'please add tangled',0);



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



insert into movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Harry Potter and the Philosophers Stone','Harry Potter, an eleven-year-old orphan, discovers that he is a wizard 
and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him.',6,2, '04-nov-2001',81,'English');

insert into movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Harry Potter and the Chamber of Secrets','A house-elf warns Harry against returning to Hogwarts, but he decides to ignore it. 
When students and creatures at the school begin to get petrified, Harry finds himself surrounded in mystery.',6,2,'03-nov-2002',83,'English');

insert into movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Harry Potter and the Prisoner of Azkaban','Harry, Ron and Hermoine return to Hogwarts just as they learn about Sirius
 Black and his plans to kill Harry. However, when Harry runs into him, he learns that the truth is far from reality.',6,2,'31-may-2004',90,'English');
 
insert into movieDetails(movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Harry Potter and the Goblet of Fire','When Harry is chosen as a fourth participant of the inter-school Triwizard 
Tournament, he is unwittingly pulled into a dark conspiracy that endangers his life.',6,2,'06-nov-2005',81,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Harry Potter and the Order of the Phoenix','Harry Potter and Dumbledores warning about the return of Lord Voldemort
 is not heeded by the wizard authorities who, in turn, look to undermine Dumbledores authority at Hogwarts and discredit Harry.',
 6,2,'28-jun-2007',78,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Home Alone','Eight-year-old Kevin is accidentally left behind when his family leaves for France. At first, he is
 happy to be in charge, but when thieves try to break into his home, he tries to put up a fight.',3,14,'10-nov-1990',65,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Home Alone 2: Lost in New York','Kevin accidentally boards a flight to New York City and gets separated from his 
family who are on their way to Miami. He then bumps into two of his old enemies, who plan to rob a toy store.',3,14,'20-nov-1992',33,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('The Avengers','Nick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. 
His squad of superheroes put their minds together to accomplish the task.',1,12,'03-aug-2012',92,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Avengers: Age of Ultron','Tony Stark builds an artificial intelligence system named Ultron with the help of Bruce 
Banner. When the sentient Ultron makes plans to wipe out the human race, the Avengers set out to stop him.',1,12,'01-may-2015',76,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Avengers: Infinity War','The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the
 infinity stones. However, Thanos is prepared to go to any lengths to carry out his insane plan.',1,12,'23-apr-2018',85,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Avengers: Endgame','After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must 
reunite and assemble again to reinvigorate their trounced allies and restore balance.',1,12,'22-apr-2019',94,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('A Quiet Place','A family struggles for survival in a world where most humans have been killed by blind but noise-sensitive
 creatures. They are forced to communicate in sign language to keep the creatures at bay.',12,8,'01-apr-2018',96,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Train to Busan','Seok-woo and his daughter are on a train to Busan on the latters birthday to see his wife. 
However, the journey turns into a nightmare when they are trapped amidst a zombie outbreak in South Korea.',8,13,'01-jul-2016',94,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Joker','Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham
 City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt 
 to feel like he is part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent 
 into madness as he transforms into the criminal mastermind known as the Joker.',4,5,'02-oct-2019',68,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Parasite','Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park 
family and the destitute Kim clan.',13,3,'15-jun-2019',99,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Get Out','Chris, an African-American man, decides to visit his Caucasian girlfriends parents during a weekend getaway.
 Although they seem normal at first, he is not prepared to experience the horrors ahead.',8,13,'24-feb-2017',98,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('12 Years a Slave','Solomon Northup, a free African-American, is promised a fortnightly job by Brown and Hamilton. 
However, after arriving in Washington DC, he realises that he has been sold into slavery.',5,7,'18-oct-2013',95,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Knives Out','The circumstances surrounding the death of crime novelist Harlan Thrombey are mysterious, but theres 
one thing that renowned Detective Benoit Blanc knows for sure -- everyone in the wildly dysfunctional Thrombey family is a 
suspect. Now, Blanc must sift through a web of lies and red herrings to uncover the truth.',3,9,'07-oct-2019',97,'English');

insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_genre3,movie_release_date,movie_rotten_tomato,movie_language ) 
values('Argo','An exfiltration specialist masquerades as a Hollywood producer in order to rescue six Americans who are held
 captive in Tehran during the US hostage crisis in Iran.',13,5,10,'04-oct-2012',96,'English');
 
insert into movieDetails(  movie_name,movie_synopsis,movie_genre1,movie_genre2,movie_release_date,movie_rotten_tomato,movie_language ) 
values('A Star is Born','After falling in love with struggling artist Ally, Jackson, a musician, coaxes her to follow her 
dreams, while he battles with alcoholism and his personal demons.',11,15,'03-oct-2018',90,'English');


insert into watchedList(user_id,movie_id,user_rating) values(1,1,4);
insert into watchedList(user_id,movie_id,user_rating) values(1,19,3);
insert into watchedList(user_id,movie_id,user_rating) values(1,2,5);
insert into watchedList(user_id,movie_id,user_rating) values(1,3,5);
--insert into watchedList(user_id,movie_id,user_rating) values(1,21,5);


insert into watchedList(user_id,movie_id,user_rating) values(2,1,5);
insert into watchedList(user_id,movie_id,user_rating) values(2,2,3);
insert into watchedList(user_id,movie_id,user_rating) values(2,4,5);
insert into watchedList(user_id,movie_id,user_rating) values(2,5,3);

insert into watchedList(user_id,movie_id,user_rating) values(3,20,5);
insert into watchedList(user_id,movie_id,user_rating) values(3,19,3);
insert into watchedList(user_id,movie_id,user_rating) values(3,18,5);
insert into watchedList(user_id,movie_id,user_rating) values(3,17,3);


commit;
--select * from watchedList;
--select * from genreList;
--select * from userDetails;
--select movie_name from movieDetails;