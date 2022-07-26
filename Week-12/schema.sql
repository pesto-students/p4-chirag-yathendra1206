-- CITY 
CREATE TABLE CITY (
    CITY_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    CITY CHAR(20),
    STATE CHAR(20)
);

-- WAREHOUSES
CREATE TABLE WAREHOUSES (
    WID INTEGER AUTO_INCREMENT PRIMARY KEY,
    WNAME CHAR(30),
    LOCATION CHAR(20),
    -- EXTRACONTEXT JSON,
    CITY_ID INTEGER,
    FOREIGN KEY (CITY_ID) REFERENCES CITY(CITY_ID)
);

--  STORES
CREATE TABLE STORES (
    SID INTEGER AUTO_INCREMENT PRIMARY KEY,
    STORE_NAME CHAR(20),
    LOCATION_CITY CHAR(20),
    WID INTEGER,
    FOREIGN KEY (WID) REFERENCES WAREHOUSES(WID)
);

-- CUSTOMERS
CREATE TABLE CUSTOMER (
    CNO INTEGER AUTO_INCREMENT PRIMARY KEY,
    CNAME CHAR(50),
    ADDR VARCHAR(50),
    CU_CITY CHAR(20)
);

-- ORDERS
CREATE TABLE ORDERS (
    ONO INTEGER AUTO_INCREMENT PRIMARY KEY,
    ODATE DATE,
    CNO INTEGER,
    FOREIGN KEY (CNO) REFERENCES CUSTOMER(CNO)
);

-- ITEMS
CREATE TABLE ITEMS (
    ITEMNO INTEGER AUTO_INCREMENT PRIMARY KEY,
    DESCRIPTION TEXT,
    WEIGHT DECIMAL(5,2),
    COST DECIMAL(5, 2)
);

-- ITEMS_ORDERS 
CREATE TABLE ITEMS_ORDERS(
    ITEM_ORDER_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    ORDERED_QUANTITY INTEGER,
    ONO INTEGER,
    ITEMNO INTEGER,
    FOREIGN KEY (ONO) REFERENCES ORDERS(ONO),
    FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);

-- STORES_ITEMS
CREATE TABLE IF NOT EXISTS STORES_ITEMS(
    STORE_ITEM_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    QUANTITY INTEGER,
    SID INTEGER,
    ITEMNO INTEGER,
    FOREIGN KEY (SID) REFERENCES STORES(SID),
    FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);

-- CITY
INSERT INTO CITY(CITY, STATE) VALUES ('HYDERABAD', 'TELANGANA');
INSERT INTO CITY(CITY, STATE) VALUES ('VIZAG', 'ANDHRA PRADESH');
INSERT INTO CITY(CITY, STATE) VALUES ('PUNE', 'MAHARASHTRA');

-- WAREHOUSES
INSERT INTO WAREHOUSES(WNAME, LOCATION, CITY_ID) VALUES ('WN1', 'LOC1' ,1);
INSERT INTO WAREHOUSES(WNAME, LOCATION, CITY_ID) VALUES ('WN2', 'LOC2' ,2);
INSERT INTO WAREHOUSES(WNAME, LOCATION, CITY_ID) VALUES ('WN3', 'LOC3' ,3);
INSERT INTO WAREHOUSES(WNAME, LOCATION, CITY_ID) VALUES ('WN4', 'LOC4' ,3);


INSERT INTO STORES(STORE_NAME, LOCATION_CITY, WID ) VALUES('STORE1', 'NANDYAL', 1);
INSERT INTO STORES(STORE_NAME, LOCATION_CITY, WID ) VALUES('STORE2', 'KURNOOL', 2);
INSERT INTO STORES(STORE_NAME, LOCATION_CITY, WID ) VALUES('STORE3', 'KUR', 1);

INSERT INTO CUSTOMER(CNAME, ADDR, CU_CITY) VALUES('YATHI', 'ADDR1', 'PRODDATUR');
INSERT INTO CUSTOMER(CNAME, ADDR, CU_CITY) VALUES('PATIL', 'ADDR2', 'KADAPA');

INSERT INTO ORDERS(ODATE,CNO) VALUES('2022-08-20', 1);
INSERT INTO ORDERS(ODATE,CNO) VALUES('2021-04-18', 2);

INSERT INTO ITEMS(DESCRIPTION, WEIGHT, COST) VALUES('RICE', 2.50, 4.50);
INSERT INTO ITEMS(DESCRIPTION, WEIGHT, COST) VALUES('DALL', 3.50, 2.50);

INSERT INTO ITEMS_ORDERS(ORDERED_QUANTITY, ONO, ITEMNO) VALUES(5, 1, 1);
INSERT INTO ITEMS_ORDERS(ORDERED_QUANTITY, ONO, ITEMNO) VALUES(10, 2, 2);
INSERT INTO ITEMS_ORDERS(ORDERED_QUANTITY, ONO, ITEMNO) VALUES(10, 1, 2);

INSERT INTO STORES_ITEMS(QUANTITY, SID, ITEMNO) VALUES(15, 1, 1);
INSERT INTO STORES_ITEMS(QUANTITY, SID, ITEMNO) VALUES(20, 2, 2);

SELECT * FROM CITY;
SELECT * FROM WAREHOUSES;
SELECT * FROM STORES;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
SELECT * FROM ITEMS;
SELECT * FROM ITEMS_ORDERS;
SELECT * FROM STORES_ITEMS;



