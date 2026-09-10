USE hotel_reservation;

-- =========================================
-- SAMPLE DATA
-- 15-20 rows per table
-- =========================================

-- =========================================
-- CUSTOMERS: 20 ROWS
-- =========================================
INSERT INTO Customers (first_name, last_name, email, phone, city) VALUES
('Aarav','Sharma','aarav.sharma01@example.com','9876500001','Delhi'),
('Vivaan','Verma','vivaan.verma02@example.com','9876500002','Noida'),
('Aditya','Singh','aditya.singh03@example.com','9876500003','Meerut'),
('Arjun','Kumar','arjun.kumar04@example.com','9876500004','Ghaziabad'),
('Rohan','Gupta','rohan.gupta05@example.com','9876500005','Jaipur'),
('Kabir','Malhotra','kabir.malhotra06@example.com','9876500006','Chandigarh'),
('Reyansh','Yadav','reyansh.yadav07@example.com','9876500007','Lucknow'),
('Ishaan','Mehta','ishaan.mehta08@example.com','9876500008','Mumbai'),
('Krish','Bansal','krish.bansal09@example.com','9876500009','Agra'),
('Atharv','Jain','atharv.jain10@example.com','9876500010','Pune'),
('Dev','Chauhan','dev.chauhan11@example.com','9876500011','Haridwar'),
('Kunal','Sharma','kunal.sharma12@example.com','9876500012','Dehradun'),
('Manav','Saini','manav.saini13@example.com','9876500013','Gurugram'),
('Dhruv','Agarwal','dhruv.agarwal14@example.com','9876500014','Kolkata'),
('Yash','Mishra','yash.mishra15@example.com','9876500015','Varanasi'),
('Aryan','Kapoor','aryan.kapoor16@example.com','9876500016','Bhopal'),
('Rudra','Joshi','rudra.joshi17@example.com','9876500017','Shimla'),
('Ansh','Tyagi','ansh.tyagi18@example.com','9876500018','Faridabad'),
('Samar','Thakur','samar.thakur19@example.com','9876500019','Amritsar'),
('Veer','Rana','veer.rana20@example.com','9876500020','Nainital');

-- =========================================
-- ROOM TYPES: 15 ROWS
-- =========================================
INSERT INTO Room_Types (type_name, description, price_per_night) VALUES
('Single','Single bed room',2500.00),
('Double','Double bed room',3500.00),
('Deluxe','Deluxe room with city view',4500.00),
('Super Deluxe','Premium deluxe room',5500.00),
('Suite','Luxury suite',7500.00),
('Executive','Executive business room',6000.00),
('Family','Family room',6500.00),
('Premium','Premium king room',7000.00),
('Standard','Standard comfortable room',3000.00),
('Twin','Twin bed room',3600.00),
('King','King bed room',5000.00),
('Queen','Queen bed room',4800.00),
('Garden View','Room with garden view',4200.00),
('Mountain View','Room with mountain view',6500.00),
('Presidential','Presidential luxury suite',12000.00);

-- =========================================
-- ROOMS: 20 ROWS
-- =========================================
INSERT INTO Rooms (room_number, room_type_id, floor_number, room_status) VALUES
('101',1,1,'Available'),
('102',2,1,'Occupied'),
('103',3,1,'Available'),
('104',4,1,'Available'),
('105',5,1,'Occupied'),
('201',6,2,'Available'),
('202',7,2,'Occupied'),
('203',8,2,'Available'),
('204',9,2,'Available'),
('205',10,2,'Maintenance'),
('301',11,3,'Available'),
('302',12,3,'Occupied'),
('303',13,3,'Available'),
('304',14,3,'Occupied'),
('305',15,3,'Available'),
('401',2,4,'Available'),
('402',3,4,'Occupied'),
('403',5,4,'Available'),
('404',7,4,'Available'),
('405',8,4,'Occupied');

-- =========================================
-- RESERVATIONS: 20 ROWS
-- =========================================
INSERT INTO Reservations
(customer_id, room_id, check_in, check_out, number_of_guests, reservation_status, booking_date)
VALUES
(1,1,'2026-01-05','2026-01-07',1,'Completed','2025-12-20'),
(2,2,'2026-01-10','2026-01-13',2,'Completed','2025-12-25'),
(3,3,'2026-01-15','2026-01-17',2,'Completed','2026-01-02'),
(4,4,'2026-02-01','2026-02-04',3,'Completed','2026-01-10'),
(5,5,'2026-02-05','2026-02-08',4,'Completed','2026-01-15'),
(6,6,'2026-02-10','2026-02-12',1,'Completed','2026-01-20'),
(7,7,'2026-02-15','2026-02-18',4,'Completed','2026-01-25'),
(8,8,'2026-03-01','2026-03-03',2,'Completed','2026-02-05'),
(9,9,'2026-03-05','2026-03-09',2,'Completed','2026-02-10'),
(10,10,'2026-03-10','2026-03-12',2,'Cancelled','2026-02-15'),
(11,11,'2026-03-15','2026-03-18',2,'Completed','2026-02-20'),
(12,12,'2026-04-01','2026-04-05',2,'Completed','2026-03-01'),
(13,13,'2026-04-06','2026-04-08',3,'Completed','2026-03-05'),
(14,14,'2026-04-10','2026-04-13',4,'Completed','2026-03-10'),
(15,15,'2026-04-15','2026-04-17',2,'Confirmed','2026-03-15'),
(16,16,'2026-05-01','2026-05-04',2,'Confirmed','2026-04-01'),
(17,17,'2026-05-05','2026-05-08',3,'Confirmed','2026-04-05'),
(18,18,'2026-05-10','2026-05-12',4,'Confirmed','2026-04-10'),
(19,19,'2026-05-15','2026-05-18',3,'Confirmed','2026-04-15'),
(20,20,'2026-05-20','2026-05-23',2,'Confirmed','2026-04-20');

-- =========================================
-- PAYMENTS: 20 ROWS
-- =========================================
INSERT INTO Payments
(reservation_id, amount, payment_date, payment_method, payment_status)
VALUES
(1,5000.00,'2026-01-05','UPI','Paid'),
(2,10500.00,'2026-01-10','Card','Paid'),
(3,9000.00,'2026-01-15','Cash','Paid'),
(4,16500.00,'2026-02-01','UPI','Paid'),
(5,22500.00,'2026-02-05','Card','Paid'),
(6,12000.00,'2026-02-10','UPI','Paid'),
(7,19500.00,'2026-02-15','Card','Paid'),
(8,14000.00,'2026-03-01','Cash','Paid'),
(9,12000.00,'2026-03-05','UPI','Paid'),
(10,7200.00,'2026-03-10','Card','Refunded'),
(11,10000.00,'2026-03-15','UPI','Paid'),
(12,19200.00,'2026-04-01','Card','Paid'),
(13,8400.00,'2026-04-06','Cash','Paid'),
(14,19500.00,'2026-04-10','UPI','Paid'),
(15,10000.00,'2026-04-15','Card','Paid'),
(16,7000.00,'2026-05-01','UPI','Paid'),
(17,15000.00,'2026-05-05','Card','Paid'),
(18,13000.00,'2026-05-10','UPI','Paid'),
(19,21000.00,'2026-05-15','Cash','Paid'),
(20,14000.00,'2026-05-20','Card','Paid');

-- =========================================
-- CHECK ROW COUNTS
-- =========================================
SELECT 'Customers' AS table_name, COUNT(*) AS total_rows FROM Customers
UNION ALL
SELECT 'Room_Types', COUNT(*) FROM Room_Types
UNION ALL
SELECT 'Rooms', COUNT(*) FROM Rooms
UNION ALL
SELECT 'Reservations', COUNT(*) FROM Reservations
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments;
