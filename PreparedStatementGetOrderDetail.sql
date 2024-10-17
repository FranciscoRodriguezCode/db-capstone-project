PREPARE GetOrderDetail FROM 
'SELECT Orders.OrderID AS OrderID, 
Orders.Quantity AS Quantity, 
Orders.Quantity* MenuItems.Price AS Cost 
FROM Orders INNER JOIN MenuItems
ON Orders.MenuItemsID = MenuItems.MenuItemsID WHERE OrderID = ?';

set @id =1;
EXECUTE GetOrderDetail using @id;