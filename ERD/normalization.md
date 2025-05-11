# AirBnB Database Normalization Documentation

## Normalization Analysis

### Initial Schema Review

Upon reviewing the original AirBnB database schema, I identified the following potential normalization issues:

1. **Price information in Property table**: The `price_per_night` attribute in the Property table presented a limitation as it:

   - Could not track price history
   - Did not support variable pricing (weekends vs weekdays, seasonal pricing)
   - Made calculating accurate `total_price` in Bookings challenging

2. **Derived data in Booking table**: The `total_price` in the Booking table appeared to be a derived attribute calculated from `price_per_night` and the duration of stay, potentially causing update anomalies if prices changed.

### Normalization Decision

To achieve Third Normal Form (3NF) and improve the database design, I created a separate Price table to manage property pricing. This addresses transitive dependencies and provides enhanced functionality.

## Normalization Implementation

### New Price Table

Created a new `Price` table with the following structure:

- **price_id**: Primary Key, UUID, Indexed
- **property_id**: Foreign Key, references `Property(property_id)`
- **amount**: DECIMAL, NOT NULL
- **currency**: VARCHAR, NOT NULL
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NULL
- **day_of_week**: ENUM or INT, NULL
- **special_price_reason**: VARCHAR, NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Modified Property Table

Removed the `price_per_night` attribute from the Property table since pricing information is now stored in the Price table.

### Modified Booking Table

The `total_price` in the Booking table remains but is now calculated by summing the applicable prices from the Price table for each night of the stay. This preserves the historical record of what was paid even if prices change later.

## Benefits of the New Structure

1. **Improved data integrity**: Eliminates redundancy and potential inconsistencies
2. **Enhanced business functionality**: Supports dynamic pricing models including:
   - Seasonal pricing
   - Weekend/weekday differentiation
   - Special event pricing
3. **Better historical tracking**: Maintains a complete history of price changes over time
4. **Flexible currency support**: Allows prices in different currencies

## Third Normal Form Verification

The new schema satisfies 3NF requirements because:

1. It is in 1NF: All attributes are atomic and there are no repeating groups
2. It is in 2NF: No partial dependencies exist as all attributes depend on their primary keys
3. It is in 3NF: No transitive dependencies exist between non-key attributes

The `total_price` in Booking is now properly derived from the Price table entries, eliminating the previous transitive dependency on `price_per_night`.
