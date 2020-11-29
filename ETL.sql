
MERGE INTO subscription_dw dest
USING (
    SELECT subscription_id, title, descrip, price FROM subscription ) src
ON (dest.subscription_id = src.subscription_id)
WHEN MATCHED THEN UPDATE SET
title = src.title,
descrip = src.descrip,
price = src.price
WHEN NOT MATCHED THEN INSERT VALUES (
src.subscription_id,
src.title,
src.descrip,
src.price);

MERGE INTO user_dw dest
USING (
    SELECT u.user_id, u.f_name,u.m_name, u.l_name, u.birthdate, u.email, u.city, u.st, u.created_at, u.user_subscription_type, 
      CASE a.user_gender 
           WHEN 'F' THEN 'Female' /*Person*/
           WHEN 'M' THEN 'Male' /*Business*/
         END              as gender,
     CASE 
     when a.click_count > 30 then 'Consumer'
     when a.click_count < 30 then 'Regular'
     End as user_type
    FROM user_sub u
    LEFT JOIN user_ad a ON u.user_id = a.user_id) src
ON (dest.user_id = src.user_id)
WHEN MATCHED THEN UPDATE SET
f_name = src.f_name,
m_name = src.m_name,
l_name = src.l_name,
birthdate = src.birthdate,
email = src.email,
city = src.city,
st = src.st,
created_at = src.created_at,
user_subscription_type = src.user_subscription_type,
gender = src.gender,
user_type = src.user_type
WHEN NOT MATCHED THEN INSERT VALUES (
src.user_id,
src.f_name,
src.m_name,
src.l_name,
src.birthdate,
src.email,
src.city,
src.st,
src.created_at,
src.user_subscription_type,
src.gender,
src.user_type);

-- Ad Extraction to dw

MERGE INTO ad_dw dest
USING (
    SELECT ad_id, sponsor, click_count FROM ad ) src
ON (dest.ad_id = src.ad_id)
WHEN MATCHED THEN UPDATE SET
sponsor = src.sponsor,
click_count = src.click_count
WHEN NOT MATCHED THEN INSERT VALUES (
src.ad_id,
src.sponsor,
src.click_count);

-- Song Extraction to dw
MERGE INTO song_dw dest
USING (
    SELECT song_id, song_name, playcount FROM song ) src
ON (dest.song_id = src.song_id)
WHEN MATCHED THEN UPDATE SET
song_name = src.song_name,
playcount = src.playcount
WHEN NOT MATCHED THEN INSERT VALUES (
src.song_id,
src.song_name,
src.playcount);

-- Song play extraction 
MERGE INTO song_play_ft dest
USING (
    SELECT song_play_id, song_id, user_id,time_stamp FROM song_play ) src
ON (dest.song_play_id = src.song_play_id)
WHEN MATCHED THEN UPDATE SET
song_id = src.song_id,
user_id = src.user_id,
time_stamp = src.time_stamp
WHEN NOT MATCHED THEN INSERT VALUES (
src.song_play_id,
src.song_id,
src.user_id,
src.time_stamp
);

-- Add click extraction 
MERGE INTO ad_click_ft dest
USING (
    SELECT ad_click_id, user_id,ad_id, created_time FROM ad_click ) src
ON (dest.ad_click_id = src.ad_click_id)
WHEN MATCHED THEN UPDATE SET
user_id = src.user_id,
ad_id = src.ad_id,
created_time = src.created_time
WHEN NOT MATCHED THEN INSERT VALUES (
src.ad_click_id,
src.user_id,
src.ad_id,
src.created_time
);