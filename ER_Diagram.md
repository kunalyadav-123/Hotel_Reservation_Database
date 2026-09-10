# Hotel Reservation Database - ER Diagram

## Entity Relationship Diagram

```mermaid
erDiagram

    CUSTOMERS ||--o{ RESERVATIONS : makes
    ROOMS ||--o{ RESERVATIONS : assigned_to
    ROOM_TYPES ||--o{ ROOMS : contains
    RESERVATIONS ||--o{ PAYMENTS : has

    CUSTOMERS {
        INT customer_id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email
        VARCHAR phone
        VARCHAR city
    }

    ROOM_TYPES {
        INT room_type_id PK
        VARCHAR type_name
        VARCHAR description
        DECIMAL price_per_night
    }

    ROOMS {
        INT room_id PK
        VARCHAR room_number
        INT room_type_id FK
        INT floor_number
        VARCHAR room_status
    }

    RESERVATIONS {
        INT reservation_id PK
        INT customer_id FK
        INT room_id FK
        DATE check_in
        DATE check_out
        INT number_of_guests
        VARCHAR reservation_status
        DATE booking_date
    }

    PAYMENTS {
        INT payment_id PK
        INT reservation_id FK
        DECIMAL amount
        DATE payment_date
        VARCHAR payment_method
        VARCHAR payment_status
    }
