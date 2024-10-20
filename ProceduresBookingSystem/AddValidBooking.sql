CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `AddValidBooking`(IN bookDate DATE, IN tableNum INT, IN loginID INT)
BEGIN
DECLARE reservationCount INT;

START TRANSACTION;

SELECT COUNT(*) 
INTO reservationCount 
FROM bookings 
WHERE BookingDate = bookDate 
AND TableNo = tableNum;

IF reservationCount > 0 THEN
SELECT CONCAT("Table ", tableNum, " is already booked - booking cancelled") AS "Booking status";
ROLLBACK;

ELSE
INSERT INTO bookings (BookingDate, TableNo, CustomerID)
VALUES (bookDate, tableNum, loginID);
SELECT 
CONCAT("Congrats ", CONCAT(CustomerFirstName, " ",CustomerLastName), 
", you have secured table number ", 
tableNum, 
", on the day of ", bookDate, ".") AS "Booking status" FROM customerdetails WHERE CustomerID = loginID;
COMMIT;

END IF;

END