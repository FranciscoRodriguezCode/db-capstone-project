CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `dbCapstone`@`%` 
    SQL SECURITY DEFINER
VIEW `morethantwoitems` AS
    SELECT 
        `menuitems`.`Name` AS `MenuName`
    FROM
        `menuitems`
    WHERE
        `menuitems`.`MenuItemsID` IN (SELECT 
                `orders`.`MenuItemsID`
            FROM
                `orders`
            WHERE
                (`orders`.`Quantity` > 2))