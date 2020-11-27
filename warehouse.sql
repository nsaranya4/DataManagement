
-- Data Warehouse DDL

-- Drops
DROP TABLE song_play_ft;
DROP TABLE song_dw;
DROP TABLE ad_click_ft;
DROP TABLE ad_dw;
DROP TABLE user_subscription_ft;
DROP TABLE user_dw;
DROP TABLE subscription_dw;

-- Create Tables

CREATE TABLE subscription_dw (
    subscription_id NUMBER(10) PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    descrip VARCHAR(150) NOT NULL,
    price DECIMAL(4,2)
);

CREATE TABLE user_dw 
(
    user_id NUMBER(10) PRIMARY KEY,
    f_name VARCHAR(15) NOT NULL,
    m_name VARCHAR(15),
    l_name VARCHAR(15) NOT NULL,  
    birthdate DATE NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    city VARCHAR(30) NOT NULL,
    st VARCHAR(2) NOT NULL,
    created_at TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL, 
    user_subscription_type NUMBER REFERENCES subscription_dw(subscription_id),
    gender CHAR(1) NOT NULL,
    click_count NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE song_dw
(
    song_id NUMBER(10) PRIMARY KEY,
    song_name VARCHAR(50) NOT NULL,
    playcount NUMBER(20) NOT NULL
);

CREATE TABLE song_play_ft
(
    song_play_id NUMBER(10) PRIMARY KEY,
    song_id NUMBER(10) NOT NULL REFERENCES song_dw(song_id),
    user_id NUMBER(10) NOT NULL REFERENCES user_dw(user_id),
    time_stamp DATE NOT NULL
);

CREATE TABLE ad_dw 
(
    ad_id NUMBER PRIMARY KEY,
    sponsor VARCHAR2(50) NOT NULL,
    click_count NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE ad_click_ft 
(
    ad_click_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL REFERENCES user_dw(user_id),
    ad_id NUMBER NOT NULL REFERENCES ad_dw(ad_id),
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE user_subscription_ft (
    user_subscription_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(7) NOT NULL REFERENCES user_dw(user_id),
    subscription_id NUMBER(7) NOT NULL REFERENCES subscription_dw(subscription_id),
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL
);
