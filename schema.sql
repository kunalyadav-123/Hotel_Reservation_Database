CREATE DATABASE hotel_reservation;
USE hotel_reservation;

-- =========================================
-- TABLE 1: CUSTOMERS
-- =========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    city VARCHAR(50)
);


-- =========================================
-- TABLE 2: ROOM TYPES
-- =========================================

CREATE TABLE Room_Types (
    room_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    price_per_night DECIMAL(10,2) NOT NULL
);


-- =========================================
-- TABLE 3: ROOMS
-- =========================================

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type_id INT NOT NULL,
    floor_number INT,
    room_status VARCHAR(20) DEFAULT 'Available',

    FOREIGN KEY (room_type_id)
        REFERENCES Room_Types(room_type_id)
);


-- =========================================
-- TABLE 4: RESERVATIONS
-- =========================================

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    number_of_guests INT NOT NULL,
    reservation_status VARCHAR(20) DEFAULT 'Confirmed',
    booking_date DATE NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (room_id)
        REFERENCES Rooms(room_id),

    CHECK (check_out > check_in)
);


-- =========================================
-- TABLE 5: PAYMENTS
-- =========================================

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20) DEFAULT 'Paid',

    FOREIGN KEY (reservation_id)
        REFERENCES Reservations(reservation_id)
);


-- =========================================
-- VIEW
-- =========================================

CREATE VIEW Reservation_Details AS
SELECT
    r.reservation_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    rm.room_number,
    rt.type_name AS room_type,
    r.check_in,
    r.check_out,
    r.number_of_guests,
    r.reservation_status
FROM Reservations r
JOIN Customers c
    ON r.customer_id = c.customer_id
JOIN Rooms rm
    ON r.room_id = rm.room_id
JOIN Room_Types rt
    ON rm.room_type_id = rt.room_type_id;


-- =========================================
-- TRIGGER
-- =========================================

DELIMITER //

CREATE TRIGGER check_payment_amount
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END //

DELIMITER ;


-- =========================================
-- STORED PROCEDURE
-- =========================================

DELIMITER //

CREATE PROCEDURE GetCustomerReservations(IN cust_id INT)
BEGIN
    SELECT *
    FROM Reservation_Details
    WHERE reservation_id IN
    (
        SELECT reservation_id
        FROM Reservations
        WHERE customer_id = cust_id
    );
END //

DELIMITER ;
