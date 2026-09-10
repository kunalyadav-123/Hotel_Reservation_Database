USE hotel_reservation;

-- =========================================
-- 1. BASIC SELECT QUERY
-- =========================================

SELECT * FROM Customers;


-- =========================================
-- 2. JOIN QUERY
-- Customer + Room + Reservation details
-- =========================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    rm.room_number,
    rt.type_name AS room_type,
    r.check_in,
    r.check_out,
    r.reservation_status
FROM Reservations r
JOIN Customers c
    ON r.customer_id = c.customer_id
JOIN Rooms rm
    ON r.room_id = rm.room_id
JOIN Room_Types rt
    ON rm.room_type_id = rt.room_type_id;


-- =========================================
-- 3. GROUP BY + HAVING QUERY
-- Rooms having at least 2 reservations
-- =========================================

SELECT
    room_id,
    COUNT(*) AS total_reservations
FROM Reservations
GROUP BY room_id
HAVING COUNT(*) >= 2;


-- =========================================
-- 4. SUBQUERY
-- Customers who have made reservations
-- =========================================

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM Customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM Reservations
);


-- =========================================
-- 5. VIEW QUERY
-- =========================================

SELECT *
FROM Reservation_Details;


-- =========================================
-- 6. CONFIRMED RESERVATIONS FROM VIEW
-- =========================================

SELECT
    customer_name,
    room_number,
    room_type,
    check_in,
    check_out
FROM Reservation_Details
WHERE reservation_status = 'Confirmed';


-- =========================================
-- 7. TOTAL PAYMENT BY PAYMENT METHOD
-- =========================================

SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method;


-- =========================================
-- 8. ROOM TYPES BY PRICE
-- =========================================

SELECT
    type_name,
    price_per_night
FROM Room_Types
ORDER BY price_per_night DESC;


-- =========================================
-- 9. AVAILABLE ROOMS
-- =========================================

SELECT
    rm.room_number,
    rt.type_name,
    rt.price_per_night
FROM Rooms rm
JOIN Room_Types rt
    ON rm.room_type_id = rt.room_type_id
WHERE rm.room_status = 'Available';


-- =========================================
-- 10. RESERVATIONS WITH 3 OR MORE NIGHTS
-- =========================================

SELECT
    reservation_id,
    customer_id,
    check_in,
    check_out,
    DATEDIFF(check_out, check_in) AS nights
FROM Reservations
WHERE DATEDIFF(check_out, check_in) >= 3;


-- =========================================
-- 11. STORED PROCEDURE
-- Get reservations of customer ID 1
-- =========================================

CALL GetCustomerReservations(1);


-- =========================================
-- 12. TRIGGER TEST
-- This should give an error because amount is 0.
-- Keep it commented for normal execution.
-- =========================================

-- INSERT INTO Payments
-- (reservation_id, amount, payment_date, payment_method, payment_status)
-- VALUES
-- (1, 0, '2026-06-01', 'UPI', 'Paid');


-- =========================================
-- 13. CHECK NUMBER OF ROWS IN EACH TABLE
-- =========================================

SELECT 'Customers' AS table_name, COUNT(*) AS total_rows
FROM Customers

UNION ALL

SELECT 'Room_Types', COUNT(*)
FROM Room_Types

UNION ALL

SELECT 'Rooms', COUNT(*)
FROM Rooms

UNION ALL

SELECT 'Reservations', COUNT(*)
FROM Reservations

UNION ALL

SELECT 'Payments', COUNT(*)
FROM Payments;
