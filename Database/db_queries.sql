SELECT Restaurant.name
FROM Restaurant
WHERE Restaurant.price_range = 4;

--Finds name of restaurants in the same zipcode as each user
SELECT R.name, U.username
FROM Restaurant AS R, RestaurantAt AS RA, Users AS U, LivesAt AS L
WHERE R.rest_id = RA.rest_id AND RA.zip_code = L.zip_code AND U.username = L.username;

-- Retrieving password of a username, 'uname'
SELECT password FROM Users u WHERE u.username = "uname";
-- Select only the names of restaurants that don't serve alcohol
SELECT name FROM Restaurant r WHERE r.alcohol = 'f';
-- Select only the names of restaurants with a price range of $10-20 and deliver
SELECT name FROM Restaurant r WHERE r.price_range = 3;
-- Select only the names of restaurants that serve a selected food, 'peaches'
SELECT name from Restaurant r, Serves s, Food f WHERE f.food_id = s.food_id AND r.rest_id = s.rest_id AND f.item = "peaches";
-- Select only the names of restaurants at a particular ZIP code, 12345
SELECT name from Restaurant r1, RestaurantAt r2 WHERE r1.rest_id = r2.rest_id AND r2.zip_code = 12345;
-- Get the number of users at a particular ZIP code, 12345
SELECT COUNT(DISTINCT username) FROM LivesAt la WHERE la.zip_code = 12345;
