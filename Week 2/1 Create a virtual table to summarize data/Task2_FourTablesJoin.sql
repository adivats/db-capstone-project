SELECT littlelemondb.customers.CustomerID,
CONCAT(littlelemondb.customers.FirstName, " ", littlelemondb.customers.LastName) AS FullName,
littlelemondb.orders.OrderID,
littlelemondb.orders.TotalCost,
littlelemondb.orders.MenuName,
littlelemondb.menuitems.CourseName
FROM littlelemondb.customers
INNER JOIN littlelemondb.orders ON littlelemondb.customers.CustomerID = littlelemondb.orders.CustomerID
INNER JOIN littlelemondb.menu ON littlelemondb.orders.MenuName = littlelemondb.menu.ItemName
INNER JOIN littlelemondb.menuitems ON littlelemondb.menu.MenuItemsID = littlelemondb.menuitems.MenuItemsID
WHERE littlelemondb.orders.TotalCost > 150
ORDER BY littlelemondb.orders.TotalCost;