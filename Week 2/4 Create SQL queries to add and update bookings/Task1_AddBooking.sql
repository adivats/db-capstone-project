DROP PROCEDURE IF EXISTS littlelemondb.AddBooking;
DELIMITER //
CREATE PROCEDURE littlelemondb. AddBooking(IN booking_id INT,  IN customer INT, IN booking_date DATE, IN table_no INT)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE (BookingID = booking_id))
THEN
	SELECT CONCAT("BookingID " , booking_id, " already exists - booking cannot be added.") AS `Booking status`; 
	ROLLBACK;
ELSE
	IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE (BookingSlot = booking_date AND TableNo = table_no))
	THEN
		SELECT CONCAT("Table " , table_no, " is already booked - booking cancelled.") AS `Booking status`; 
		ROLLBACK;
	ELSE
		INSERT INTO littlelemondb.bookings (BookingSlot, TableNo, CustomerID)
		VALUES (booking_date, table_no, customer);
		COMMIT;
		SELECT CONCAT("New booking added for table " , table_no) AS `Booking status`; 
	END IF;
END IF;
END //
DELIMITER ;

CALL littlelemondb.AddBooking(7, 1, "2023-08-18", 4);