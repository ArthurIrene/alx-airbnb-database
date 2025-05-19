Before adding indexes, the query used full table scans on the Booking, User, and Payment tables. This was inefficient for large datasets.

After adding indexes on key columns used in JOINs (e.g., booking_id, user_id, property_id), the EXPLAIN output showed improved join strategies (e.g., using ref instead of ALL). This reduced execution time and improved query performance.
