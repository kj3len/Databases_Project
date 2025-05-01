This project consists of SQL scripts to create a relational database with four primary tables: CUSTOMER, PRODUCTS, ORDERS, and SHIPPING. 
The schema enforces various constraints to ensure data integrity, such as valid customer IDs, product IDs, order statuses, and shipping details.

CUSTOMER: Stores customer information, including first name, last name, customer ID, email, and zip code. Enforces constraints for valid customer ID and zip code formats.
PRODUCTS: Stores product information, including product ID, quantity, name, and price. Enforces constraints for valid product ID, quantity, and price.
ORDERS: Stores order details, including order ID, customer ID, payment amount, order date, order status, and product ID. Enforces constraints for valid order ID, payment, 
and order status. Includes foreign keys to link orders to customers and products.
SHIPPING: Stores shipping information, including tracking ID, customer ID, delivery date, order ID, and delivery zip code. Enforces constraints for valid tracking ID and 
delivery zip code. Includes foreign keys to link shipping details to customers and orders.


