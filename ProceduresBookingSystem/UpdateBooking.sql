CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `UpdateBooking`(IN bookID INT, IN dateUpdate date)
BEGIN
UPDATE bookings 
SET BookingDate = dateUpdate 
WHERE BookingID = bookID;
END