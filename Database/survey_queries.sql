SELECT r.name
--TODO: Users and DinesAt are empty, and cause all search results to be None
--Can be uncommented when populated
FROM Restaurant r--, Users u, DinesAt d
WHERE 
r.attire = :formal
AND
r.alcohol = :alcohol
AND
--TODO: Calculate price ranges
r.price_range = '2'
-- THIS SYNTAX EXECUTES ONE THING OR THE OTHER, I.E., IF USER SELECTS DELIVERY, IT ONLY CHECKS TO SEE IF R.DELIVERS IS TRUE
AND
((:delivery = 'Dining') OR
(:delivery = 'Delivery' AND r.delivers = 1) OR
(:delivery = 'Take-Out' AND r.take_out = 1))


--Requires Users and DinesAt Tables
--AND 
--u.username = d.username
--AND
-- EXECUTES ONE OR THE OTHER BASED ON IF USER WANTS OLD/NEW RESTAURANT
--(:new_or_old = 1 AND d.rest_id=r.rest_id) OR
--(:new_or_old = 0 AND d.rest_id!=r.rest_id);
