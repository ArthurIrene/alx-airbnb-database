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
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_bookings
FROM
    Booking
GROUP BY 
    property_id;