DROP PROCEDURE IF EXISTS littlelemondb.CancelBooking;
DELIMITER //
CREATE PROCEDURE littlelemondb. CancelBooking(IN booking_id INT)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE (BookingID = booking_id))
THEN
	DELETE FROM littlelemondb.bookings WHERE BookingID = booking_id;
	COMMIT;
	SELECT CONCAT("Booking ", booking_id ," cancelled.") AS `Confirmation`; 
ELSE
	SELECT CONCAT("BookingID " , booking_id, " does not exist - booking cannot be cancelled.") AS `Response`; 
	ROLLBACK;
END IF;
END //
DELIMITER ;

CALL littlelemondb.CancelBooking(7);