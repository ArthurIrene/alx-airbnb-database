-- Drop the partitioned table if it exists
DROP TABLE IF EXISTS Booking_partitioned;

-- Recreate the table with partitioning by year of start_date
CREATE TABLE Booking_partitioned (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Partitioned tables can't have foreign keys in MySQL
    -- PRIMARY KEY must include partition column (start_date)
    PRIMARY KEY
(booking_id, start_date)
)
PARTITION BY RANGE
(YEAR
(start_date))
(
    PARTITION p2023 VALUES LESS THAN
(2024),
    PARTITION p2024 VALUES LESS THAN
(2025),
    PARTITION p2025 VALUES LESS THAN
(2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);
-- Performance test query
EXPLAIN
SELECT *
FROM Booking_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
