CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `dbCapstone`@`%` 
    SQL SECURITY DEFINER
VIEW `orderabove150` AS
    SELECT 
        `bookings`.`CustomerID` AS `CustomerID`,
        CONCAT(`customerdetails`.`CustomerFirstName`,
                ' ',
                `customerdetails`.`CustomerLastName`) AS `FullName`,
        `orders`.`OrderID` AS `OrderID`,
        (`orders`.`Quantity` * `menuitems`.`Price`) AS `Cost`,
        `menu`.`MenuType` AS `MenuName`,
        `menuitems`.`Name` AS `CourseName`
    FROM
        ((((`customerdetails`
        JOIN `bookings` ON ((`customerdetails`.`CustomerID` = `bookings`.`CustomerID`)))
        JOIN `orders` ON ((`bookings`.`BookingID` = `orders`.`BookingID`)))
        JOIN `menuitems` ON ((`orders`.`MenuItemsID` = `menuitems`.`MenuItemsID`)))
        JOIN `menu` ON ((`menuitems`.`MenuID` = `menu`.`MenuID`)))
    WHERE
        ('Cost' > 150)
    ORDER BY 'Cost'