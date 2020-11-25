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
    user_sp_name                VARCHAR(50)         NOT NULL,
    user_sp_email               VARCHAR(50)         UNIQUE,
    user_sp_dob                 DATE                NOT NULL,
    user_sp_subscription_type   VARCHAR(50)         NOT NULL,
    user_sp_followers           NUMBER(10)          NULL,
    user_sp_following           NUMBER(10)          NULL
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

