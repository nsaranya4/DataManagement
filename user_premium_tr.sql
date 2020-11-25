-- user subscribes to premium account DDL

--drops
DROP TABLE user_subscription;
DROP TABLE subscription;
DROP TABLE user_sub;


DROP SEQUENCE user_sub_id_s;
DROP SEQUENCE subscription_id_s;
DROP SEQUENCE user_subscription_id_s;


--creates
CREATE TABLE user_sub (
    userid NUMBER(7) NOT NULL PRIMARY KEY,
    f_name VARCHAR(15) NOT NULL,
    m_name VARCHAR(15),
    l_name VARCHAR(15) NOT NULL,  
    birthdate DATE NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE subscription (
    subscriptionid NUMBER(7) NOT NULL PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    descrip VARCHAR(30) NOT NULL
);

CREATE TABLE user_subscription (
    user_subscriptionid NUMBER(7) NOT NULL PRIMARY KEY,
    userid NUMBER(7) NOT NULL REFERENCES user_sub(userid),
    subscriptionid NUMBER(7) NOT NULL REFERENCES subscription(subscriptionid),
    created_time TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL 
);

CREATE SEQUENCE user_sub_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE subscription_id_s
START WITH 1000000
INCREMENT BY 1;

CREATE SEQUENCE user_subscription_id_s
START WITH 1000000
INCREMENT BY 1;

