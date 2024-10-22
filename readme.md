This project is set to receive vague or limited information over a store that wants to create their database using MySQL and the file named LittleLemonPreviousInfo shows the data they are wanting to keep.

10/10/24 ReadMe.md - Creating Readme.md file and setting up repository for project.

10/15/24 LittleLemonPreviousInfo.PNG - Created a model for the LittleLemon database. Company is asking to maintain these tables in the new MySQL model. (This is before normalization.)

10/16/24:
The following was assumed:
1. This restaurant only serves food in-store. 
2. Columns may be deleted and replaced by tables that conform with the first 3 normalization rules.
3. OrderDeliveryStatus table informs Customer about the status of their food depending on what department their order is currently at. The status updates at the moment their ticket gets scanned in the next department. The staff's department reflects and therefore displays a message. The following example of departments could be: Reception (taking Booking information), Kitchen (In charge of the menu and food preparation), and Delivery (where staff grabs food from and delivers to customer's table number.) A CASE clause would be used to display the messages: "Preparing order...", "Cooking food...", "On its way to your table!", in regards to the Reception, Kitchen, and Delivery departments created to run the operating portion of the business.  

Process and ideas when normalizing tables:
- Bookings should contain the customer information.

- Orders would have to include MenuItems to properly get the TotalCost of items as they are itemized. This creates redundancy because the TotalCost is a column that computes non-key values. This violates the 3rd normal form, therefore having to be removed. In order to track the table the order belongs to, the BookingID needs to be added as a foreign key. DeliveryID ensures that the Orders table is aware of the time the delivery to the table takes place. 

- OrderDeliveryStatus table previously had a DeliveryStatus column to show the live food order status. This can be assumed to be given to the customer via an app to see the time, or within the kitchen to keep track of which orders have gone out. If the status is to change, then it could be tracked by finding out what department is working on the order and giving a status update with a case clause, and protecting the identity of those working on it. Any other values could be added, such as name, to include that into the receipt when the department of the staff member reaches the stage of delivering to the table. (Optional, it can be up to the business.)

- Menu table included the types of menus and items contained, this would would mean that the menu table could not include individual items to satisfy the Quantity column for the MySQL database. This means that this table was separated into two, MenuItems to be able to look up individual items and their information, as well as a relation to the Menu table to identify what menu type it belongs to.

- CustomerDetails is assumed to have the first and last name in CustomerName, so this was broken down into two columns to be able to pass the 1NF criteria. The contact details was assumed to be Phone Number and Email. No customer addresses will be saved, since there is no delivery service involved. The term delivery in this database is thought to be a department, and an indication for the DeliveryStatus criteria intended to be kept.

- StaffInformation is modified and a DepartmentID foreign key was added to enable the messages, regardless of who is working in that department. This allows multiple staff to do the same functions.

10/17/2024 - 
Added 3 Virtual tables
1. VirtualTableOrdersView.sql
2. JOINOrderAbove150.sql
3. SubQueryMoreThanTwoItems

Added 2 Stored procedures
1. OptimizedQueryGetMaxQuantity.sql
2. StoredProcedureCancelOrder.sql

and 1 Prepared statement
1. PreparedeStatementGetOrderDetails.sql 

as SQL files.

10/20/2024 -
- Reorganized the 3 virtual tables into one folder named SalesReportVirtualTables.
- Reorganized the 2 stored procedures and the prepared statements into the PreparedStatementProcedureOptimizedQuery folder as a general folder to show that I am able to create such processes.
- Created a new folder to create a booking system. It contains stored procedures that allow the user to: 
1. Add a booking, [AddBooking] (Inserts data into the booking table without checking if other bookings are reserved. Meant for first orders.)
2. Add a valid booking, [AddValidBooking] (Checks if the date and table are already booked before placing a booking, meant to display the use of transactions and version control.) 
3. Cancel a booking, [CancelBooking] (Deletes booking from the bookings table where the BookingID matches the input.)
4. Checking if there is a booking available, [CheckBooking] (This procedure checks if there is a booking already in the date and time the user is trying to reserve.)
5. Update the BookingDate, [UpdateBooking] (Updates the booking date to another day.)

10/22/2024 -
- Added mysqlconnector code for Jupyter for python and mysql
- Included the Excel and Tableau files in the TableauTablesDash
(Optional) Clean Excel data to import it into MySQL Workbench (Used for Tableau mainly)
