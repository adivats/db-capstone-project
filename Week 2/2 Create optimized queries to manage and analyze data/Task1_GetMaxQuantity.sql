DROP PROCEDURE IF EXISTS littlelemondb.GetMaxQuantity;

DELIMITER //
CREATE PROCEDURE littlelemondb.GetMaxQuantity()
BEGIN
	SELECT MAX(littlelemondb.orders.Quantity) AS "Max Quantity in Order"
    FROM littlelemondb.orders;
END //
DELIMITER ;

CALL littlelemondb.GetMaxQuantity;