-- User plays a song

-- Drops
DROP TABLE song_play;
DROP TABLE user_sp;
DROP TABLE song;

DROP TABLE user_subscription;
DROP TABLE user_sub;
DROP TABLE subscription;

DROP TABLE ad_click;
DROP TABLE user_ad;
DROP TABLE ad;

DROP SEQUENCE user_ad_s;
DROP SEQUENCE ad_s;
DROP SEQUENCE ad_click_s;

DROP SEQUENCE user_id_s;
DROP SEQUENCE subscription_id_s;
DROP SEQUENCE user_subscription_id_s;


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

CREATE SEQUENCE user_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE subscription_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE user_subscription_id_s
START WITH 100000
INCREMENT BY 1;

CREATE SEQUENCE user_ad_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE ad_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE ad_click_s
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

CREATE TABLE subscription (
    subscription_id NUMBER(7) NOT NULL PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    descrip VARCHAR(150) NOT NULL,
    price DECIMAL(4,2)
);

CREATE TABLE user_sub (
    user_id NUMBER(7) NOT NULL PRIMARY KEY,
    f_name VARCHAR(15) NOT NULL,
    m_name VARCHAR(15),
    l_name VARCHAR(15) NOT NULL,  
    birthdate DATE NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    city VARCHAR(30) NOT NULL,
    st   VARCHAR(2)  NOT NULL,
    created_at TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL, 
    user_subscription_type NUMBER REFERENCES subscription(subscription_id)
);


-- Transaction table
CREATE TABLE user_subscription (
    user_subscription_id NUMBER(7) NOT NULL PRIMARY KEY,
    user_id NUMBER(7) NOT NULL REFERENCES user_sub(user_id),
    subscription_id NUMBER(7) NOT NULL REFERENCES subscription(subscription_id),
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE user_ad (
    user_id NUMBER DEFAULT(user_ad_s.NEXTVAL) PRIMARY KEY,
    user_dob VARCHAR(50) NOT NULL,
    user_gender CHAR(1) NOT NULL,
    click_count NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE ad (
    ad_id NUMBER DEFAULT(ad_s.NEXTVAL) PRIMARY KEY,
    sponsor VARCHAR2(50) NOT NULL,
    click_count NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE ad_click (
    ad_click_id NUMBER default(ad_click_s.NEXTVAL) PRIMARY KEY,
    user_id NUMBER NOT NULL,
    ad_id NUMBER NOT NULL,
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL,
    
    CONSTRAINT user_ad_id_fk FOREIGN KEY(user_id) REFERENCES user_ad(user_id),
    CONSTRAINT ad_id_fk FOREIGN KEY(ad_id) REFERENCES ad(ad_id)
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
VALUES(song_play_id_s.NEXTVAL,1000003,1000007,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000014,1000009,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000001,1000010,'03-NOV-20');

INSERT INTO song_play
VALUES(song_play_id_s.NEXTVAL,1000000,1000010,'03-NOV-20');

-- add subscription
INSERT INTO subscription
VALUES(subscription_id_s.NEXTVAL,'Free','Users with this account will be able to listen to music, create playlists, follow artist, etc. but ads will ocassionally be played',0.00);

INSERT INTO subscription
VALUES(subscription_id_s.NEXTVAL,'Premium','All functionality with free but with no ads',7.99);

INSERT INTO subscription
VALUES(subscription_id_s.NEXTVAL,'Student','Premium account at a discounted rate provided the user verifies student status',4.99);


ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH:MI';

-- add users
INSERT INTO user_sub
VALUES (user_id_s.NEXTVAL,'Jacque','Robert','Sawyer','18-OCT-01','rsawyergmail.com','Austin','TX','2019-02-01 12:56',1000000);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (user_id_s.NEXTVAL,'Yvonne','Doherty','07-SEP-91','yvonne345@yahoo.com','Atlanta','GA','2019-08-12 4:45',1000000);

INSERT INTO user_sub
VALUES (user_id_s.NEXTVAL,'Hareem','Robert','Sawyer','03-JAN-97','h.b.heaton@utexas.edu','Los Angeles','CA','2017-03-24 4:12',1000002);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (user_id_s.NEXTVAL,'Lewie','Short','20-JAN-83','lewiethegreat@gmail.com','Dallas','TX','2018-05-01 5:12',1000001);

INSERT INTO user_sub
VALUES (user_id_s.NEXTVAL,'Ada','Lewis','Simons','25-SEP-93','adaLewis@yahoo.com','Houston','TX','2019-07-12 1:23',1000001);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (user_id_s.NEXTVAL,'Bridget','Paine','20-FEB-94','bringthepaine@gmail.com','Princeton','NJ','2018-12-25 9:12',1000001);

INSERT INTO user_sub 
VALUES (user_id_s.NEXTVAL,'Reilly','Hurst','Keith','26-MAY-83','reillyhurst@outlook.com','Austin','TX','2019-02-22 6:23',1000000);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (user_id_s.NEXTVAL,'Karam','Derrick','04-AUG-92','karam213@aol.com','San Jose','CA','2020-04-05 11:23',1000001);

INSERT INTO user_sub 
VALUES (user_id_s.NEXTVAL,'Elsa','Lily','Hopkins','27-OCT-95','elsa-lily@gmail.com','San Antonio','TX', '2020-01-31 7:12',1000000);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type)
VALUES (user_id_s.NEXTVAL,'Avni','Gates','25-JUN-01','openthegates@gmail.com','Chicago','IL','2013-08-04 11:29',1000001);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type)
VALUES (user_id_s.NEXTVAL,'Hisham','Rowley','15-MAR-91','rowleythetroops@gmail.com','Bloomington','IL','2014-09-21 8:12',1000001);

INSERT INTO user_sub
VALUES (user_id_s.NEXTVAL,'Nyah','Zhang','Yang','13-APR-94','nyah.yang@gmail.com','New York','NY','2016-02-20 11:11',1000000);

--Insert into user_subscription

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000003,1000001,'2018-11-12 5:10');

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000004,1000001,'2020-05-23 6:27');

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000005,1000001,'2019-03-20 11:25');

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000007,1000001,'2020-04-05 11:23');

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000009,1000001,'2015-07-31 2:21');

INSERT INTO user_subscription
VALUES(user_subscription_id_s.NEXTVAL,1000010,1000001,'2016-02-24 4:20');

-- add users
INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'18-OCT-01','M',23);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'07-SEP-91','F',45);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'03-JAN-97','M',78);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'20-JAN-83','M',48);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'25-SEP-93','F',169);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'20-FEB-94','F',35);

INSERT INTO user_ad 
VALUES (user_ad_s.NEXTVAL,'26-MAY-83','M',16);

INSERT INTO user_ad 
VALUES (user_ad_s.NEXTVAL,'04-AUG-92','M',34);

INSERT INTO user_ad 
VALUES (user_ad_s.NEXTVAL,'27-OCT-95','F',13);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'25-JUN-01','F',101);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'15-MAR-91','F',156);

INSERT INTO user_ad
VALUES (user_ad_s.NEXTVAL,'13-APR-94','F',39);


-- Add advertisments
INSERT INTO ad
VALUES(ad_s.NEXTVAL,'Google',1455);

INSERT INTO ad
VALUES(ad_s.NEXTVAL,'Nike',26357);

INSERT INTO ad
VALUES(ad_s.NEXTVAL,'Apple',78426);

INSERT INTO ad
VALUES(ad_s.NEXTVAL,'Adidas',1823);

INSERT INTO ad
VALUES(ad_s.NEXTVAL,'Netflix',18531);

-- add ad_click
INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000000,1000000,'2019-05-20 4:32');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000008,1000002,'2020-03-12 6:30');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000002,1000001,'2018-02-22 11:42');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000006,1000003,'2020-04-20 1:22');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000001,1000004,'2019-12-25 7:01');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000011,1000002,'2017-12-31 10:22');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000000,1000000,'2019-05-20 4:32');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000003,1000001,'2018-07-31 12:58');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000005,1000004,'2019-01-12 6:48');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000004,1000001,'2019-12-12 2:42');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000009,1000003,'2014-05-22 4:21');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000009,1000002,'2015-07-30 4:48');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000010,1000000,'2014-11-26 8:22');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000000,1000002,'2020-10-30 8:22');

INSERT INTO ad_click
VALUES(ad_click_s.NEXTVAL,1000008,1000002,'2020-06-15 11:24');

