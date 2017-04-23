SELECT r.name, r.rest_id
--TODO: Users and DinesAt are empty, and cause all search results to be None
--Can be uncommented when populated
FROM Restaurant r, Users u, DinesAt d
WHERE 
r.attire = :formal
AND
(:alcohol = 1 AND r.alcohol = :alcohol)
AND
((:maximum<='7') AND (r.price_range = '1' )) OR
((:maximum<='14') AND (r.price_range = '1' OR r.price_range='2')) OR
((:maximum<='21') AND (r.price_range = '1' OR r.price_range='2' OR r.price_range = '3')) OR
((:maximum<='28') AND (r.price_range = '1' OR r.price_range='2' OR r.price_range = '3' OR r.price_range = '4')) 
-- THIS SYNTAX EXECUTES ONE THING OR THE OTHER, I.E., IF USER SELECTS DELIVERY, IT ONLY CHECKS TO SEE IF R.DELIVERS IS TRUE
AND
((:delivery = 'Dining') OR
(:delivery = 'Delivery' AND r.delivers = 1) OR
(:delivery = 'Take-Out' AND r.take_out = 1))
AND 
u.username = d.username
AND
EXECUTES ONE OR THE OTHER BASED ON IF USER WANTS OLD/NEW RESTAURANT
(:new_or_old = 1 AND d.rest_id=r.rest_id) OR
(:new_or_old = 0 AND d.rest_id!=r.rest_id);

