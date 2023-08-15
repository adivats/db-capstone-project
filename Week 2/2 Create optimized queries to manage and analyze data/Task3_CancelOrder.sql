DROP PROCEDURE IF EXISTS littlelemondb.CancelOrder;

DELIMITER //
CREATE PROCEDURE littlelemondb.CancelOrder(IN id INT)
BEGIN
	IF EXISTS(SELECT 1 FROM littlelemondb.orders WHERE OrderID = id)
	THEN
		DELETE FROM littlelemondb.orders WHERE OrderID = id; 
		SELECT CONCAT("Order ", id, " is cancelled.") AS Confirmation;
	ELSE
		SELECT CONCAT("Order ", id, " does not exist.") AS Response;
	END IF;
END //
DELIMITER ;

CALL littlelemondb.CancelOrder(6);