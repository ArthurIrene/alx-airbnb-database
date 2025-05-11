-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('u1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', '+123456789', 'host'),
('u2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '+987654321', 'guest'),
('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '+192837465', 'guest');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location)
VALUES 
('p1', 'u1', 'Cozy Cottage', 'A peaceful cottage in the countryside.', 'Ruhengeri, Rwanda'),
('p2', 'u1', 'City Apartment', 'Modern apartment in Kigali city center.', 'Kigali, Rwanda');

-- Insert Prices
INSERT INTO Price (price_id, property_id, amount, currency, start_date, end_date, day_of_week, special_price_reason)
VALUES
('pr1', 'p1', 75.00, 'USD', '2025-05-01', '2025-05-31', NULL, 'Spring discount'),
('pr2', 'p1', 90.00, 'USD', '2025-06-01', NULL, NULL, NULL),
('pr3', 'p2', 120.00, 'USD', '2025-05-01', NULL, NULL, NULL),
('pr4', 'p2', 100.00, 'USD', '2025-05-01', '2025-05-31', '7', 'Weekend special');

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1', 'p1', 'u2', '2025-05-10', '2025-05-12', 150.00, 'confirmed'),
('b2', 'p2', 'u3', '2025-05-15', '2025-05-18', 360.00, 'confirmed');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('r1', 'p1', 'u2', 5, 'Loved the peaceful atmosphere and beautiful view!'),
('r2', 'p2', 'u3', 4, 'Great location, but a bit noisy at night.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('m1', 'u2', 'u1', 'Hi! Is the cottage available for this weekend?'),
('m2', 'u1', 'u2', 'Yes, it is. Would you like to proceed with booking?'),
('m3', 'u3', 'u1', 'Is there parking available at the apartment?');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay1', 'b1', 150.00, 'credit_card'),
('pay2', 'b2', 360.00, 'paypal');
