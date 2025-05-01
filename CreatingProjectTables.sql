DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
CREATE TABLE CUSTOMER (
fname varchar2(15) not null,
lname varchar2(20) not null,
cusID number(8,0) primary key,
email varchar2(30) not null,
zip varchar2(5) not null,

CONSTRAINT CHK_cusID_8dig CHECK (cusID BETWEEN 10000000 AND 99999999),
CONSTRAINT CHK_zip_5dig CHECK (zip BETWEEN '10000' AND '99999')
);

DROP TABLE PRODUCT CASCADE CONSTRAINTS;
CREATE TABLE PRODUCT (
productID number(8,0) primary key,
quantity number(25,0) not null,
name varchar2(30) not null,
price number(7,2) not null,

CONSTRAINT CHK_productID_8dig CHECK (productID BETWEEN 10000000 AND 99999999),
CONSTRAINT CHK_quantity CHECK (quantity >= 0),
CONSTRAINT CHK_price CHECK (price > 0)
);

DROP TABLE ORDER CASCADE CONSTRAINTS;
CREATE TABLE ORDER (
orderID number(8,0) primary key,
customerID number(8,0) not null,
payment number(20,2) not null,
orderDate DATE not null,
orderStatus varchar(10) not null,
productID number(8,0) not null,

CONSTRAINT FK_order_customerID FOREIGN KEY (customerID) REFERENCES CUSTOMER(cusID) ON DELETE SET NULL,
CONSTRAINT FK_productID FOREIGN KEY (productID) REFERENCES PRODUCTS(productID) ON DELETE SET NULL,
CONSTRAINT CHK_orderStatus CHECK (orderStatus IN ('Pending', 'Shipped','Delivered', 'Canceled', 'Cancelled')),
CONSTRAINT CHK_payment CHECK (payment > 0)
);

DROP TABLE SHIPPING CASCADE CONSTRAINTS;
CREATE TABLE SHIPPING (
trackingID number(10,0) primary key,
customerID number(8,0) not null,
deliv_date DATE not null,
orderID number(8,0) not null,
deliv_zip varchar2(5) not null,

CONSTRAINT FK_ship_customerID FOREIGN KEY (customerID) REFERENCES CUSTOMER(cusID) ON DELETE SET NULL,
CONSTRAINT FK_orderID FOREIGN KEY (orderID) REFERENCES ORDERS(orderID) ON DELETE SET NULL,
CONSTRAINT CHK_trackingID_10dig CHECK (trackingID BETWEEN 1000000000 AND 9999999999),
CONSTRAINT CHK_delivZip_5dig CHECK (deliv_zip BETWEEN '10000' AND '99999')
);
