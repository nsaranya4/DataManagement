-- User subscribes to premium account DDL

-- Drops
DROP TABLE user_subscription;
DROP TABLE user_sub;
DROP TABLE subscription;

DROP SEQUENCE user_id_s;
DROP SEQUENCE subscription_id_s;
DROP SEQUENCE user_subscription_id_s;

-- Create sequences
CREATE SEQUENCE user_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE subscription_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE user_subscription_id_s
START WITH 1000000
INCREMENT BY 1;

-- Create tables
CREATE TABLE subscription (
    subscription_id NUMBER(7) NOT NULL PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    descrip VARCHAR(150) NOT NULL,
    price   FLOAT(2)
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


-- add subscription
INSERT INTO subscription
VALUES(1000001,'Free','Users with this account will be able to listen to music, create playlists, follow artist, etc. but ads will ocassionally be played',0.00);

INSERT INTO subscription
VALUES(1000002,'Premium','All functionality with free but with no ads',7.99);

INSERT INTO subscription
VALUES(1000003,'Student','Premium account at a discounted rate provided the user verifies student status',4.99);

ALTER SESSION SET NLS_TIMESTAMP_TZ_FORMAT = 'YYYY-MM-DD HH:MI';

-- add users
INSERT INTO user_sub 
VALUES (1000001,'Jacque','Robert','Sawyer','18-OCT-01','j.sawyer@gmail.com','Austin','TX','2019-10-25 12:56',1000001);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (1000002,'Yvonne','Doherty','07-SEP-91','yvonne345@yahoo.com','Atlanta','GA','2019-08-12 4:45',1000001);

INSERT INTO user_sub
VALUES (1000003,'Hareem','Robert','Sawyer','03-JAN-97','h.b.heaton@utexas.edu','Los Angeles','CA','2017-03-24 4:12',1000003);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (1000004,'Lewie','Short','20-JAN-83','lewiethegreat@gmail.com','Dallas','TX','2018-05-01 5:12',1000002);

INSERT INTO user_sub
VALUES (1000005,'Ada','Lewis','Simons','25-SEP-93','adaLewis@yahoo.com','Houston','TX','2019-07-12 1:23',1000002);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (1000006,'Bridget','Paine','20-FEB-94','bringthepaine@gmail.com','Princeton','NJ','2018-12-25 9:12',1000002);

INSERT INTO user_sub 
VALUES (1000007,'Reilly','Hurst','Keith','26-MAY-83','reillyhurst@outlook.com','Austin','TX','2019-02-22 6:23',1000001);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type) 
VALUES (1000008,'Karam','Derrick','04-AUG-92','karam213@aol.com','San Jose','CA','2020-04-05 11:23',1000002);

INSERT INTO user_sub 
VALUES (1000009,'Elsa','Lily','Hopkins','27-OCT-95','elsa-lily@gmail.com','San Antonio','TX', '2020-01-31 7:12',1000001);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type)
VALUES (1000010,'Avni','Gates','25-JUN-01','openthegates@gmail.com','Chicago','IL','2013-08-04 11:29',1000002);

INSERT INTO user_sub(user_id,f_name,l_name,birthdate,email,city,st,created_at,user_subscription_type)
VALUES (1000011,'Hisham','Rowley','15-MAR-91','rowleythetroops@gmail.com','Bloomington','IL','2014-09-21 8:12',1000002);

INSERT INTO user_sub
VALUES (1000012,'Nyah','Zhang','Yang','13-APR-94','nyah.yang@gmail.com','New York','NY','2016-02-20 11:11',1000001);


