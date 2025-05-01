-- Drop existing tables
DROP TABLE SHIPPING CASCADE CONSTRAINTS;
DROP TABLE PURCHASE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    fname varchar2(15) not null,
    lname varchar2(20) not null,
    cusID number(8,0) primary key,
    email varchar2(30) not null,
    zip varchar2(5) not null,

    CONSTRAINT CHK_cusID_8dig CHECK (cusID BETWEEN 10000000 AND 99999999),
    CONSTRAINT chk_zip_length CHECK (REGEXP_LIKE(zip, '^\d{5}$'))
);

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    productID number(8,0) primary key,
    quantity number(25,0) not null,
    name varchar2(30) not null,
    price number(7,2) not null,

    CONSTRAINT CHK_productID_8dig CHECK (productID BETWEEN 10000000 AND 99999999),
    CONSTRAINT CHK_quantity CHECK (quantity >= 0),
    CONSTRAINT CHK_price CHECK (price > 0)
);

-- Create PURCHASE table 
CREATE TABLE PURCHASE (
    purchaseID number(8,0) primary key,
    customerID number(8,0) not null,
    payment number(20,2) not null,
    purchaseDate DATE not null,
    orderStatus varchar(10) not null,
    productID number(8,0) not null,

    CONSTRAINT FK_purchase_customerID FOREIGN KEY (customerID) REFERENCES CUSTOMER(cusID) ON DELETE SET NULL,
    CONSTRAINT FK_purchase_productID FOREIGN KEY (productID) REFERENCES PRODUCT(productID) ON DELETE SET NULL,
    CONSTRAINT CHK_orderStatus CHECK (orderStatus IN ('Pending', 'Shipped','Delivered', 'Canceled', 'Cancelled')),
    CONSTRAINT CHK_payment CHECK (payment > 0)
);

-- Create SHIPPING table
CREATE TABLE SHIPPING (
    trackingID number(10,0),
    customerID number(8,0) not null,
    deliv_date DATE not null,
    purchaseID number(8,0) not null,
    deliv_zip varchar2(5) not null,

    CONSTRAINT FK_ship_customerID FOREIGN KEY (customerID) REFERENCES CUSTOMER(cusID) ON DELETE SET NULL,
    CONSTRAINT FK_purchaseID FOREIGN KEY (purchaseID) REFERENCES PURCHASE(purchaseID) ON DELETE SET NULL,
    CONSTRAINT CHK_trackingID_10dig CHECK (trackingID BETWEEN 1000000000 AND 9999999999),
    CONSTRAINT chk_delivzip_length CHECK (REGEXP_LIKE(deliv_zip, '^\d{5}$'))
);
