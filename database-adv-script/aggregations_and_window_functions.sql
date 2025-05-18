SELECT
    User.user_id,
    User.first_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM
    "User"
    LEFT JOIN Booking ON "User".user_id = Booking.user_id
GROUP BY
    "User".user_id, "User".first_name;


SELECT
    p.property_id,
    RANK(b.booking_id) AS total_bookings
FROM
    Property
    LEFT JOIN Booking ON p.property_id = b.property_id;



SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_bookings
FROM
    Booking
GROUP BY 
    property_id;
