-- User plays a song

-- Drops
DROP TABLE song_play;
DROP TABLE user_sp;
DROP TABLE song;


DROP SEQUENCE user_sp_id_s;
DROP SEQUENCE song_id_s;
DROP SEQUENCE song_play_id_s;

-- Create sequences
CREATE SEQUENCE user_sp_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE song_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE song_play_id_s
START WITH 1000000
INCREMENT BY 1;

-- Create tables
CREATE TABLE song
(
    song_id         NUMBER(10)          PRIMARY KEY,
    song_name       VARCHAR(50)         NOT NULL,
    playcount       NUMBER(20)          NOT NULL
);

CREATE TABLE user_sp
(
    user_sp_id                  NUMBER(10)          PRIMARY KEY,
    f_name                      VARCHAR(50)         NOT NULL,
    m_name                      VARCHAR(50)         NULL,
    l_name                      VARCHAR(50)         NOT NULL,
    dob                         DATE                NOT NULL,
    email                       VARCHAR(50)         NOT NULL        UNIQUE
    --user_sp_followers           NUMBER(10)          NULL,
    --user_sp_following           NUMBER(10)          NULL
);

CREATE TABLE song_play
(

    song_play_id    NUMBER(10)          PRIMARY KEY,
    song_id         NUMBER(10)          NOT NULL,
    user_id         NUMBER(10)          NOT NULL,
    time_stamp      DATE                NOT NULL,
    CONSTRAINT song_play_song_id FOREIGN KEY(song_id) REFERENCES song(song_id),
    CONSTRAINT song_play_user_id FOREIGN KEY(user_id) REFERENCES user_sp(user_sp_id)
);

--Adding Users
INSERT INTO user_sp 
VALUES (user_sp_id_s.NEXTVAL,'Jacque','Robert','Sawyer','18-OCT-01','j.sawyer@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Yvonne','Doherty','07-SEP-91','yvonne345@yahoo.com');

INSERT INTO user_sp
VALUES (user_sp_id_s.NEXTVAL,'Hareem','Robert','Sawyer','03-JAN-97','h.b.heaton@utexas.edu');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Lewie','Short','20-JAN-83','lewiethegreat@gmail.com');

INSERT INTO user_sp
VALUES (user_sp_id_s.NEXTVAL,'Ada','Lewis','Simons','25-SEP-93','adaLewis@yahoo.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Bridget','Paine','20-FEB-94','bringthepaine@gmail.com');

INSERT INTO user_sp 
VALUES (user_sp_id_s.NEXTVAL,'Reilly','Hurst','Keith','26-MAY-83','reillyhurst@outlook.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Karam','Derrick','04-AUG-92','karam213@aol.com');

INSERT INTO user_sp 
VALUES (user_sp_id_s.NEXTVAL,'Elsa','Lily','Hopkins','27-OCT-95','elsa-lily@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Avni','Gates','25-JUN-01','openthegates@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (user_sp_id_s.NEXTVAL,'Hisham','Rowley','15-MAR-91','rowleythetroops@gmail.com');

INSERT INTO user_sp
VALUES (user_sp_id_s.NEXTVAL,'Nyah','Zhang','Yang','13-APR-94','nyah.yang@gmail.com');

--Adding Songs
INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Riptide',18456923);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Therefore I Am',59600459);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'positions',188428229);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'For the Night',366869873);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Come and Go',305642353);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Sweater Weather',675778871);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Watermelon Sugar',890919586);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Laugh Now Cry Later',298235509);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Holiday',18736983);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Dynamite',447287514);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Lonely',136295492);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Tyler Herro',42496255);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Holy',210888914);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Jingle Bell Rock',279592960);

INSERT INTO song
VALUES(song_id_s.NEXTVAL,'Blinding Lights',1677071791);


-- Insert play song entries
INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000010,1000007,'30-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000013,1000004,'30-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000010,1000007,'30-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000000,1000005,'31-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000005,1000003,'31-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000011,1000000,'31-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000013,1000001,'31-OCT-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000006,1000006,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000003,1000002,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000014,1000009,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000002,1000010,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000001,1000003,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000007,1000000,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000000,1000009,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000001,1000006,'01-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000008,1000009,'02-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000007,1000007,'02-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000003,1000000,'02-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000010,1000010,'02-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000009,1000003,'02-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000007,1000006,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000005,1000007,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000014,1000009,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000001,1000010,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000000,1000010,'03-NOV-20');
