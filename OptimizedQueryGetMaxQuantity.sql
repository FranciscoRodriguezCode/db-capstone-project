CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order'
FROM Orders;
END