SELECT
    p.property_id,
    p.name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM
    Property p
    JOIN
    Review r ON p.property_id = r.property_id
WHERE 
    p.property_id IN (
        SELECT
    property_id
FROM
    Review
GROUP BY 
            property_id
HAVING 
            AVG(rating) > 4.0
    );


SELECT *
FROM "User" u
WHERE (
  SELECT COUNT(*)
FROM Booking b
WHERE b.user_id = u.user_id
) > 3;
