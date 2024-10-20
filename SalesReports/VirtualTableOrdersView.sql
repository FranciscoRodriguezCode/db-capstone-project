CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `dbCapstone`@`%` 
    SQL SECURITY DEFINER
VIEW `ordersview` AS
    SELECT 
        `orders`.`OrderID` AS `OrderID`,
        `orders`.`Quantity` AS `Quantity`,
        (`orders`.`Quantity` * `menuitems`.`Price`) AS `Cost`
    FROM
        (`orders`
        JOIN `menuitems` ON ((`orders`.`MenuItemsID` = `menuitems`.`MenuItemsID`)))