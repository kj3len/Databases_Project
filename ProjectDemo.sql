
--Inserting customer demo cases
INSERT INTO CUSTOMER VALUES ('Mary', 'Johnson', 80123456, null, '13015');
INSERT INTO CUSTOMER VALUES ('Mary', 'Johnson', 50987654, 'mary.johnson@example.com', '19104');
INSERT INTO CUSTOMER VALUES ('George', 'Shroder', 5, 'george.shroder@example.com', '19011');
INSERT INTO CUSTOMER VALUES ('George', 'Shroder', 50324646, 'george.shroder@example.com', '0124');
INSERT INTO CUSTOMER VALUES ('George', 'Shroder', 50324646, 'george.shroder@example.com', '01234');

DELETE FROM CUSTOMER WHERE fname = 'George' and lname = 'Shroder';


--Inserting products demo cases
INSERT INTO PRODUCT VALUES (80000001, -10, 'Wired Mouse', 22.49);
INSERT INTO PRODUCT VALUES (80000001, 5, 'Wired Mouse', -1.5);
INSERT INTO PRODUCT VALUES (80000001, 50, 'Wired Mouse That Has A Bunch Of Special Accessories And Cool Things On It That Are Unnecessary', 25.00);
INSERT INTO PRODUCT VALUES (80000001, 50, 'Wired Mouse', 22.49);

DELETE FROM PRODUCT WHERE name = 'Wired Mouse';

--Inserting purchase demo cases
INSERT INTO PURCHASE VALUES (30000011, 50324646, 25.99, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Pending', 20000001);
INSERT INTO PURCHASE VALUES (30000012, 50324646, 79.99, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Pending', 20000005);

DELETE FROM PURCHASE WHERE purchaseID = 30000012;

--Inserting shipping demo cases
INSERT INTO SHIPPING VALUES (4000000019, 50324646, TO_DATE('2025-04-05', 'YYYY-MM-DD'), 30000011, '19104');
INSERT INTO SHIPPING VALUES (4000000019, 50324646, TO_DATE('2025-04-05', 'YYYY-MM-DD'), 30000012, '19104');

DELETE FROM SHIPPING WHERE trackingID = 4000000019;

SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'SHIPPING';