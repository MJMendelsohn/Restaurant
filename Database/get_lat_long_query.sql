SELECT Location.latitude, Location.longitude
FROM RestaurantAt, Location
WHERE RestaurantAt.rest_id = :id
  AND Location.street_address = RestaurantAt.street_address
  AND Location.zip_code = RestaurantAt.zip_code;
