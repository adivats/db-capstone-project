DROP PROCEDURE IF EXISTS littlelemondb.CheckBooking;

DELIMITER //
CREATE PROCEDURE littlelemondb.CheckBooking(IN checkdate DATE, IN checktable INT)
BEGIN
	IF EXISTS(SELECT 1 FROM littlelemondb.bookings WHERE BookingSlot = checkdate AND TableNo = checktable)
	THEN
		SELECT CONCAT("Table ", checktable, " is already booked.") AS "Booking Status";
	ELSE
		SELECT CONCAT("Table ", checktable, " is available.") AS "Booking Status";
	END IF;
END //
DELIMITER ;

CALL littlelemondb.CheckBooking("2023-08-15", 5);