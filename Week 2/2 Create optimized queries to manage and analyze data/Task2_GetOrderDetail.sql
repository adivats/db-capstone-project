PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM littlelemondb.orders WHERE  OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;