DROP PROCEDURE IF EXISTS littlelemondb.AddValidBooking;
DELIMITER //
CREATE PROCEDURE littlelemondb. AddValidBooking(IN booking_date DATE, IN table_no INT, IN customer INT)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE (BookingSlot = booking_date AND TableNo = table_no))
THEN
SELECT CONCAT("Table " , table_no, " is already booked - booking cancelled.") AS `Booking status`; 
ROLLBACK;
ELSE
INSERT INTO littlelemondb.bookings (BookingSlot, TableNo, CustomerID)
VALUES (booking_date, table_no, customer);
COMMIT;
SELECT CONCAT("Booking for table " , table_no, " is successful.") AS `Booking status`; 
END IF;
END //
DELIMITER ;

CALL littlelemondb.AddValidBooking("2023-08-18", 2, 2);