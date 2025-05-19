-- User table
CREATE INDEX idx_user_id ON "User"(user_id);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property table
CREATE INDEX idx_property_id ON Property(property_id);

-- Review table
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_rating ON Review(rating);



EXPLAIN ANALYZE
SELECT
    p.property_id,
    COUNT(b.booking_id) AS total_bookings
FROM
    Property p
    LEFT JOIN
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id;
