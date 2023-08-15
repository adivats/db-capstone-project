SELECT ItemName
FROM littlelemondb.menu
WHERE ItemName = ANY
	(SELECT littlelemondb.orders.MenuName
     FROM littlelemondb.orders
     WHERE littlelemondb.orders.Quantity > 2
    );