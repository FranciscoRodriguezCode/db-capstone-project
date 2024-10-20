CREATE DEFINER=`dbCapstone`@`%` PROCEDURE `CancelBooking`(IN booking INT)
BEGIN
DELETE FROM bookings
WHERE BookingID = booking;
END