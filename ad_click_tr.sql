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


