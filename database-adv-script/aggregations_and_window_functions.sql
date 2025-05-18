-- First query: Count bookings per property with proper JOIN
SELECT
    p.property_id,
    COUNT(b.booking_id) AS total_bookings
FROM
    Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY
    p.property_id;

-- Second query: Rank properties by number of bookings
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM
    Property p
    LEFT JOIN
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name;
