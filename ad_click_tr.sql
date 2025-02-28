-- User subscribes to premium account DDL

-- Drops
DROP TABLE ad_click;
DROP TABLE user_ad;
DROP TABLE ad;

DROP SEQUENCE user_ad_s;
DROP SEQUENCE ad_s;
DROP SEQUENCE ad_click_s;

-- Create sequences
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






