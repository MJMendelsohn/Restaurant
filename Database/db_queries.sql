--Finds name of restaurants in the same zipcode as each user
SELECT R.name, U.username
FROM Restaurant AS R, RestaurantAt AS RA, Users AS U, LivesAt AS L
WHERE R.rest_id = RA.rest_id AND RA.zip_code = L.zip_code AND U.username = L.username;

-- Retrieving password of a username, 'uname'
SELECT password FROM Users u WHERE u.username = 'uname';

-- Select only the names of restaurants that don't serve alcohol
SELECT name FROM Restaurant r WHERE r.alcohol = 'f';

-- Select only the names of restaurants with a price range of $10-20 and deliver
SELECT name FROM Restaurant r WHERE r.price_range = 3 AND r.delivers = 't';

-- Get the number of users at a particular ZIP code, 12345
SELECT COUNT(DISTINCT username) FROM LivesAt la WHERE la.zip_code = 12345;

---Selects all restaurants that a pair of friends have swiped the same way on
SELECT Friends.username1,Friends.username2, u1.rest_id
FROM Friends, Userswipe u1, Userswipe u2
WHERE Friends.username1 = u1.username
AND Friends.username2 = u2.username
AND u1.rest_id = u2.rest_id
AND u1.likes = u2.likes;

-- Select all restaurants with 4-star ratings or more
SELECT name FROM Restaurant r where r.rating >= 4.0;

-- Select all restaurants that users have dined at
SELECT name from Restaurant r, DinesAt d WHERE d.dining_date != 'NULL' AND d.rest_id = r.rest_id;

-- Select all restaurants based on survey responses (zip code [12345], attire [formal], price range [3], alcohol [true], and sit_down [true])
SELECT name FROM Restaurant r, DinesAt d WHERE r.zip_code = 12345 AND r.attire = 'formal' AND r.price_range = 3 AND r.alcohol = 't' AND r.sit_down = 't' AND d.dining_date != 'NULL' AND r.rest_id = d.rest_id;

