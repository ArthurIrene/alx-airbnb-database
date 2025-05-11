# Airbnb – Database Schema

This project provides a relational database schema for a **Vacation Rental Booking System**, similar to platforms like Airbnb. It supports essential features such as user management, listings, dynamic pricing, bookings, reviews, messaging, and payments.

---

## 📦 Features

- **User Roles**: Guests, hosts, and admins.
- **Property Listings**: Descriptions, location, and host association.
- **Dynamic Pricing**: Per day, with support for seasonal and weekday variations.
- **Bookings**: Date-based availability with conflict prevention.
- **Reviews**: Guest reviews with ratings and comments.
- **Messaging**: Internal system for host-guest communication.
- **Payments**: Booking payments with method tracking.

---

## 🗃️ Database Tables

| Table      | Description                                          |
| ---------- | ---------------------------------------------------- |
| `User`     | Stores user details with role distinction.           |
| `Property` | Stores rental listings hosted by users.              |
| `Price`    | Stores dynamic pricing per property per date or day. |
| `Booking`  | Tracks bookings and their status.                    |
| `Review`   | User-submitted reviews of properties.                |
| `Message`  | Internal messaging between users.                    |
| `Payment`  | Records booking payments and payment methods.        |
