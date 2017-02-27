SELECT Restaurant.name
FROM Restaurant
WHERE Restaurant.price_range = 4;

SELECT R.name
FROM Restaurant AS R, RestaurantAt AS RA, Users AS U, LivesAt AS L
WHERE R.rest_id = RA.rest_id AND RA.zip_code = L.zip_code AND U.username = L.username;
