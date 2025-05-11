-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,  
    last_name VARCHAR(50) NOT NULL,   
    email VARCHAR(100) UNIQUE NOT NULL,  
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON User(email);

-- Property Table (normalized - no price_per_night)
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (host_id) REFERENCES User(user_id),
    INDEX idx_property_host (host_id)
);

-- Price Table (for normalized pricing)
CREATE TABLE Price (
    price_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    day_of_week TINYINT CHECK (day_of_week BETWEEN 1 AND 7),
    special_price_reason VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    INDEX idx_price_property (property_id),
    INDEX idx_price_dates (property_id, start_date, end_date),
    CHECK (end_date IS NULL OR end_date > start_date),
    CHECK (amount > 0)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    INDEX idx_booking_property (property_id),
    INDEX idx_booking_user (user_id),
    INDEX idx_booking_dates (property_id, start_date, end_date),
    CHECK (end_date > start_date),
    CHECK (total_price >= 0)
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    INDEX idx_review_property (property_id),
    INDEX idx_review_user (user_id)
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id),
    INDEX idx_message_sender (sender_id),
    INDEX idx_message_recipient (recipient_id),
    INDEX idx_message_conversation (sender_id, recipient_id)
);

-- Payment Table
CREATE TABLE Payment (  
    payment_id UUID PRIMARY KEY,  
    booking_id UUID NOT NULL, 
    amount DECIMAL(10,2) NOT NULL,  
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id), 
    INDEX idx_payment_booking (booking_id)
);
