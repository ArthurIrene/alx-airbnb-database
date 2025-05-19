# Performance Monitoring Report

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Step 1: Query Selection

We selected a frequently used query that retrieves:

- Booking details,
- User’s first name,
- Property name,
- Total price, and
- Start date

Filtered by:

- `total_price > 500`

Ordered by:

- `start_date DESC`

---

## Step 2: Performance Analysis

We used `EXPLAIN ANALYZE` to inspect the performance of the query. Initially, the query was scanning a large number of rows due to missing indexes on `total_price` and `start_date`.

---

## Step 3: Optimization

To improve performance, we added the following indexes:

```sql
CREATE INDEX idx_booking_total_price ON Booking(total_price);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
```
