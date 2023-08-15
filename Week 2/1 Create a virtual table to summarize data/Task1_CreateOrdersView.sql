CREATE OR REPLACE VIEW littlelemondb.OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM littlelemondb.orders
WHERE Quantity > 2;

SELECT * FROM littlelemondb.OrdersView;