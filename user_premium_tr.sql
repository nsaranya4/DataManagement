-- User subscribes to premium account DDL

-- Drops
DROP TABLE user_subscription;
DROP TABLE subscription;
DROP TABLE user_sub;

DROP SEQUENCE user_sub_id_s;
DROP SEQUENCE subscription_id_s;
DROP SEQUENCE user_subscription_id_s;

-- Create sequences
CREATE SEQUENCE user_sub_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE subscription_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE user_subscription_id_s
START WITH 1000000
INCREMENT BY 1;

-- Create tables
CREATE TABLE user_sub (
    user_id NUMBER(7) NOT NULL PRIMARY KEY,
    f_name VARCHAR(15) NOT NULL,
    m_name VARCHAR(15),
    l_name VARCHAR(15) NOT NULL,  
    birthdate DATE NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE subscription (
    subscription_id NUMBER(7) NOT NULL PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    descrip VARCHAR(30) NOT NULL
);

CREATE TABLE user_subscription (
    user_subscription_id NUMBER(7) NOT NULL PRIMARY KEY,
    user_id NUMBER(7) NOT NULL REFERENCES user_sub(user_id),
    subscription_id NUMBER(7) NOT NULL REFERENCES subscription(subscription_id),
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL 
);



