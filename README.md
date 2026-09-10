# Hotel Reservation Database

## Project Overview

The Hotel Reservation Database is a MySQL-based database management project designed to manage hotel customers, rooms, room types, reservations, and payments.

The project demonstrates database design, relationships, normalization, SQL queries, views, triggers, and stored procedures.

---

## Objectives

- Manage customer information.
- Manage hotel rooms and room types.
- Store and manage reservations.
- Manage customer payments.
- Demonstrate SQL JOIN queries.
- Demonstrate GROUP BY and HAVING.
- Demonstrate subqueries.
- Create and use a database view.
- Implement a trigger.
- Implement a stored procedure.
- Design the database up to Third Normal Form (3NF).

---

## Database Tables

The database contains five main tables:

### 1. Customers

Stores information about hotel customers.

Important columns:

- customer_id - Primary Key
- first_name
- last_name
- email
- phone
- city

### 2. Room_Types

Stores different types of hotel rooms.

Important columns:

- room_type_id - Primary Key
- type_name
- description
- price_per_night

### 3. Rooms

Stores information about individual hotel rooms.

Important columns:

- room_id - Primary Key
- room_number
- room_type_id - Foreign Key
- floor_number
- room_status

### 4. Reservations

Stores customer hotel reservations.

Important columns:

- reservation_id - Primary Key
- customer_id - Foreign Key
- room_id - Foreign Key
- check_in
- check_out
- number_of_guests
- reservation_status
- booking_date

### 5. Payments

Stores payment information for reservations.

Important columns:

- payment_id - Primary Key
- reservation_id - Foreign Key
- amount
- payment_date
- payment_method
- payment_status

---

## Relationships

- One customer can make many reservations.
- One room can have many reservations over time.
- One room type can contain many rooms.
- One reservation can have multiple payments.

See the complete ER diagram in:

`ER_Diagram.md`

---

## Normalization

The database is normalized up to Third Normal Form (3NF).

### First Normal Form (1NF)

All attributes contain atomic values and there are no repeating groups.

### Second Normal Form (2NF)

All non-key attributes depend completely on their respective primary keys.

### Third Normal Form (3NF)

There are no transitive dependencies between non-key attributes.

Customer information is stored separately from reservations.

Room type information is stored separately from rooms.

Payment information is stored separately from reservations.

### Denormalization

No deliberate denormalization has been used in this project.

---

## SQL Features Demonstrated

### JOIN

The project uses JOIN queries to combine customer, reservation, room, and room type information.

### GROUP BY and HAVING

Used to find rooms having multiple reservations and to summarize payment information.

### Subquery

Used to find customers who have made reservations.

### View

A view named `Reservation_Details` combines reservation, customer, room, and room type information.

### Trigger

A trigger named `check_payment_amount` prevents payments with an amount less than or equal to zero.

### Stored Procedure

A stored procedure named `GetCustomerReservations` retrieves reservations for a specific customer.

---

## Sample Data

The project contains sample data for testing:

| Table | Records |
|---|---:|
| Customers | 20 |
| Room_Types | 15 |
| Rooms | 20 |
| Reservations | 20 |
| Payments | 20 |

---

## Project Files

| File | Description |
|---|---|
| `schema.sql` | Database tables, relationships, view, trigger and procedure |
| `sample_data.sql` | Sample records for all tables |
| `queries.sql` | SQL queries demonstrating required concepts |
| `ER_Diagram.md` | ER diagram and database relationships |
| `README.md` | Project documentation |

---

## Technologies Used

- MySQL
- SQL
- GitHub

---

## How to Run

Run the SQL files in the following order:

1. `schema.sql`
2. `sample_data.sql`
3. `queries.sql`

The database should be created before inserting sample data.

---

## Requirements Checklist

- [x] ER Diagram
- [x] Primary Keys
- [x] Foreign Keys
- [x] Normalization up to 3NF
- [x] JOIN query
- [x] GROUP BY query
- [x] HAVING query
- [x] Subquery
- [x] View
- [x] Trigger
- [x] Stored Procedure
- [x] 15-20 sample rows per table
