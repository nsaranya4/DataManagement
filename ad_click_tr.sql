-- User subscribes to premium account DDL

-- Drops
DROP TABLE user_ad;
DROP TABLE ad;
DROP TABLE ad_click;

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

);

CREATE TABLE ad (

);

CREATE TABLE ad_click (

);



