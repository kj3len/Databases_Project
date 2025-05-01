This project consists of SQL scripts to create a relational database with four primary tables: CUSTOMER, PRODUCT, PURCHASE, and SHIPPING.
The schema enforces various constraints to ensure data integrity, such as valid customer IDs, product IDs, purchase statuses, and shipping details.

CUSTOMER: Stores customer information, including first name, last name, customer ID, email, and zip code. Enforces constraints for valid customer ID and zip code formats.

PRODUCT: Stores product information, including product ID, quantity, name, and price. Enforces constraints for valid product ID, quantity, and price.

PURCHASE: Stores purchase details, including purchase ID, customer ID, payment amount, purchase date, order status, and product ID. Enforces constraints for valid purchase ID, payment, and order status. Includes foreign keys to link purchases to customers and products.

SHIPPING: Stores shipping information, including tracking ID, customer ID, delivery date, purchase ID, and delivery zip code. Enforces constraints for valid tracking ID and delivery zip code. Includes foreign keys to link shipping details to customers and purchases.

Basic Instructions on how to operate:

1. Connect to an Oracle SQL Database using a SQL client such as SQLDeveloper.
2. Run the two scripts in order: CreatingProjectTables.sql > InsertProjectData.sql
Optional: To verify the tables and data were inserted successfully, use SELECT queries after executing the two files provided (ex. SELECT * FROM CUSTOMER).
