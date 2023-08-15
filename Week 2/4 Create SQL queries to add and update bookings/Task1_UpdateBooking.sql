DROP PROCEDURE IF EXISTS littlelemondb.UpdateBooking;
DELIMITER //
CREATE PROCEDURE littlelemondb. UpdateBooking(IN booking_id INT,  IN booking_date DATE)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE (BookingID = booking_id))
THEN
	UPDATE littlelemondb.bookings SET BookingSlot = booking_date WHERE BookingID = booking_id;
	COMMIT;
	SELECT CONCAT("Booking ", booking_id ," updated.") AS `Confirmation`; 
ELSE
	SELECT CONCAT("BookingID " , booking_id, " does not exist - booking cannot be updated.") AS `Response`; 
	ROLLBACK;
END IF;
END //
DELIMITER ;

CALL littlelemondb.UpdateBooking(7, "2023-08-19");