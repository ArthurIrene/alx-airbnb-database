# Index Performance Report

## 🧠 Purpose

This file documents the performance optimization through the use of indexes in our Airbnb-style database. We analyzed frequently used columns in queries involving `JOIN`, `WHERE`, and `ORDER BY` clauses to improve performance.

---

## 🧱 Indexes Created

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_name ON Property(name);


EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-id';
-- Output: Full table scan

EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-id';
-- Output: Uses idx_booking_user_id
```
