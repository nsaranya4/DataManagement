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
VALUES (1000001,'Jacque','Robert','Sawyer','18-OCT-01','j.sawyer@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000002,'Yvonne','Doherty','07-SEP-91','yvonne345@yahoo.com');

INSERT INTO user_sp
VALUES (1000003,'Hareem','Robert','Sawyer','03-JAN-97','h.b.heaton');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000004,'Lewie','Short','20-JAN-83','lewiethegreat@gmail.com');

INSERT INTO user_sp
VALUES (1000005,'Ada','Lewis','Simons','25-SEP-93','adaLewis@yahoo.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000006,'Bridget','Paine','20-FEB-94','bringthepaine@gmail.com');

INSERT INTO user_sp 
VALUES (1000007,'Reilly','Hurst','Keith','26-MAY-83','reillyhurst@outlook.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000008,'Karam','Derrick','04-AUG-92','karam213@aol.com');

INSERT INTO user_sp 
VALUES (1000009,'Elsa','Lily','Hopkins','27-OCT-95','elsa-lily@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000010,'Avni','Gates','25-JUN-01','openthegates@gmail.com');

INSERT INTO user_sp(user_sp_id,f_name,l_name,dob,email) 
VALUES (1000011,'Hisham','Rowley','15-MAR-91','rowleythetroops@gmail.com');

INSERT INTO user_sp
VALUES (1000012,'Nyah','Zhang','Yang','13-APR-94','nyah.yang@gmail.com');

--Adding Songs
INSERT INTO song
VALUES(1000001,'Riptide',18456923);

INSERT INTO song
VALUES(1000002,'Therefore I Am',59600459);

INSERT INTO song
VALUES(1000003,'positions',188428229);

INSERT INTO song
VALUES(1000004,'For the Night',366869873);

INSERT INTO song
VALUES(1000005,'Come and Go',305642353);

INSERT INTO song
VALUES(1000006,'Sweater Weather',675778871);

INSERT INTO song
VALUES(1000007,'Watermelon Sugar',890919586);

INSERT INTO song
VALUES(1000008,'Laugh Now Cry Later',298235509);

INSERT INTO song
VALUES(1000009,'Holiday',18736983);

INSERT INTO song
VALUES(1000010,'Dynamite',447287514);

INSERT INTO song
VALUES(1000011,'Lonely',136295492);

INSERT INTO song
VALUES(1000012,'Tyler Herro',42496255);

INSERT INTO song
VALUES(1000013,'Holy',210888914);

INSERT INTO song
VALUES(1000014,'Jingle Bell Rock',279592960);

INSERT INTO song
VALUES(1000015,'Blinding Lights',1677071791);


-- Insert play song entries
INSERT INTO song_play
VALUES(1000001,1000011,1000008,'30-OCT-20');

INSERT INTO song_play
VALUES(1000002,1000014,1000005,'30-OCT-20');

INSERT INTO song_play
VALUES(1000003,1000011,1000008,'30-OCT-20');

INSERT INTO song_play
VALUES(1000004,1000001,1000006,'31-OCT-20');

INSERT INTO song_play
VALUES(1000005,1000006,1000004,'31-OCT-20');

INSERT INTO song_play
VALUES(1000006,1000012,1000001,'31-OCT-20');

INSERT INTO song_play
VALUES(1000007,1000014,1000002,'31-OCT-20');

INSERT INTO song_play
VALUES(1000008,1000007,1000007,'01-NOV-20');

INSERT INTO song_play
VALUES(1000009,1000004,1000003,'01-NOV-20');

INSERT INTO song_play
VALUES(1000010,1000015,1000010,'01-NOV-20');

INSERT INTO song_play
VALUES(1000011,1000003,1000011,'01-NOV-20');

INSERT INTO song_play
VALUES(1000012,1000002,1000004,'01-NOV-20');

INSERT INTO song_play
VALUES(1000013,1000008,1000001,'01-NOV-20');

INSERT INTO song_play
VALUES(1000014,1000001,1000010,'01-NOV-20');

INSERT INTO song_play
VALUES(1000015,1000002,1000007,'01-NOV-20');

INSERT INTO song_play
VALUES(1000016,1000009,1000010,'02-NOV-20');

INSERT INTO song_play
VALUES(1000017,1000008,1000008,'02-NOV-20');

INSERT INTO song_play
VALUES(1000018,1000004,1000001,'02-NOV-20');

INSERT INTO song_play
VALUES(1000019,1000011,1000011,'02-NOV-20');

INSERT INTO song_play
VALUES(1000020,1000010,1000004,'02-NOV-20');

INSERT INTO song_play
VALUES(1000021,1000008,1000007,'03-NOV-20');

INSERT INTO song_play
VALUES(1000022,1000004,1000008,'03-NOV-20');

INSERT INTO song_play
VALUES(1000023,1000015,1000010,'03-NOV-20');

INSERT INTO song_play
VALUES(1000024,1000002,1000011,'03-NOV-20');

INSERT INTO song_play
VALUES(1000025,1000001,1000011,'03-NOV-20');

