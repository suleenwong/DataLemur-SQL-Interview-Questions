-- Matching Rental Amenities
WITH airbnb_amenities AS (
SELECT
  rental_id,
  ARRAY_AGG(amenity ORDER BY amenity) AS amenities
FROM rental_amenities
GROUP BY rental_id)
SELECT COUNT(*) AS matching_airbnb
FROM airbnb_amenities AS airbnb1
JOIN airbnb_amenities AS airbnb2
  ON airbnb1.amenities = airbnb2.amenities
WHERE airbnb1.rental_id > airbnb2.rental_id;