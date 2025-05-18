-- 1️⃣ INNER JOIN: Get all bookings along with the users who made those bookings

SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.email
FROM
Booking
INNER JOIN 
User ON Booking.user_id = User.user_id


-- 2️⃣ LEFT JOIN: Get all properties and their reviews (including properties without reviews)


SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;


-- 3️⃣ Simulated FULL OUTER JOIN: Get all users and all bookings
-- This includes users with no bookings and bookings without users
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.email
FROM Booking
LEFT JOIN User ON Booking.user_id = User.user_id

UNION

SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.email
FROM Booking
RIGHT JOIN User ON Booking.user_id = User.user_id;
