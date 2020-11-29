--Get top ten played songs
SELECT *
FROM song_dw
WHERE ROWNUM <= 10
ORDER BY playcount DESC;
​
--Get top ten played songs by free user
SELECT spft.song_id, sdw.song_name, udw.user_subscription_title, count(spft.song_play_id) AS total_play_by_free_user
FROM song_dw sdw
JOIN song_play_ft spft
ON sdw.song_id = spft.song_id
JOIN user_dw udw
ON udw.user_id = spft.user_id
GROUP BY spft.song_id, sdw.song_name, udw.user_subscription_title
HAVING udw.user_subscription_title = 'Free'
ORDER BY count(spft.song_play_id) DESC;
​
--Get top ten played songs by Premium user
SELECT spft.song_id, sdw.song_name, udw.user_subscription_title, count(spft.song_play_id) AS total_play_by_free_user
FROM song_dw sdw
JOIN song_play_ft spft
ON sdw.song_id = spft.song_id
JOIN user_dw udw
ON udw.user_id = spft.user_id
GROUP BY spft.song_id, sdw.song_name, udw.user_subscription_title
HAVING udw.user_subscription_title = 'Premium' or udw.user_subscription_title = 'Student'
ORDER BY count(spft.song_play_id) DESC;
​
--Get top ten ads in terms of revenue
SELECT ad_id, sponsor, click_count * 0.05 AS total_revenue_US_dollar
FROM ad_dw
WHERE ROWNUM <= 10
ORDER BY click_count * 0.05 DESC;