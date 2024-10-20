CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `AddBooking`(IN Booking INT, IN Customer INT, IN tableCode INT, IN bookingDay DATE)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNo, CustomerID)
VALUES (Booking, bookingDay, tableCode, Customer);
SELECT CONCAT("New booking added") AS "Confirmation";
END