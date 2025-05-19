SELECT
    b.booking_id,
    u.first_name,
    p.name AS property_name,
    pay.amount
FROM
    Booking b
    JOIN "User" u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- database_index.sql

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_id ON Booking(booking_id);

CREATE INDEX idx_user_id ON "User"(user_id);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
