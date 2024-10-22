CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `ManageBooking`(IN searchDate DATE, IN searchTable INT)
BEGIN

DECLARE OutPut VARCHAR(255);

SELECT CASE
WHEN COUNT(TableNo) > 0 THEN CONCAT("Table ", searchTable, " is already booked")
ELSE CONCAT("Available to book table ", searchTable, " !")
END INTO OutPut 
FROM bookings 
WHERE BookingDate = searchDate AND TableNo = searchTable;
SELECT OutPut AS "Booking status";

END