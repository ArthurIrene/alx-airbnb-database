# Partitioning Report

We partitioned the `Booking` table by `start_date` (year). After partitioning, date-based queries using `WHERE start_date BETWEEN ...` performed better. Using `EXPLAIN`, the database scanned only the relevant partition (e.g., `p2025`) rather than the full table, improving speed and efficiency. This optimization is especially helpful for large datasets.
