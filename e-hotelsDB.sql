-- ----------------------------
-- Table structure for Hotel Chain
-- ----------------------------

DROP TABLE IF EXISTS Hotel_Chain;
CREATE TABLE Hotel_Chain (
    chain_name varchar(100) PRIMARY KEY NOT NULL,
    street_number int NOT NULL,
    street_name varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    "state/province" varchar(50) NOT NULL,
    zip varchar(50) NOT NULL,
    num_of_hotels int NOT NULL
);

-- ----------------------------
-- Table structure for Hotel Chain email_address
-- ----------------------------

DROP TABLE IF EXISTS Hotel_Chain_email_address;
CREATE TABLE Hotel_Chain_email_address (
    chain_name varchar(100) NOT NULL,
    contact_email_address varchar(100) NOT NULL CHECK (email LIKE '_%@_%._%') PRIMARY KEY
    CONSTRAINT fk_hotel_chain_email_address_chain_name
    FOREIGN KEY (chain_name)
    REFERENCES Hotel_Chain(chain_name)
);

-- ----------------------------
-- Table structure for Hotel Chain email_address
-- ----------------------------

DROP TABLE IF EXISTS Hotel_Chain_phone_number;
CREATE TABLE Hotel_Chain_phone_number (
    chain_name varchar(100) NOT NULL,
    contact_phone_number int PRIMARY KEY NOT NULL
    CONSTRAINT fk_Hotel_Chain_phone_number_chain_name
    FOREIGN KEY (chain_name)
    REFERENCES Hotel_Chain(chain_name)
);

-- ----------------------------
-- Table structure for Hotel
-- ----------------------------

DROP TABLE IF EXISTS Hotel;
CREATE TABLE Hotel_Chain (
    chain_name varchar(100) NOT NULL,
    street_number int NOT NULL ,
    street_name varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    "state/province" varchar(50) NOT NULL,
    zip varchar(50) NOT NULL,
    num_of_rooms int NOT NULL,
    contact_email varchar(100) CHECK (email LIKE '_%@_%._%'),
    category varchar(100) NOT NULL
    ADD CONSTRAINT fk_hotel_chain_phone_number
    FOREIGN KEY (street_number, street_name, city, "state/province", zip)
    REFERENCES Room(street_number, street_name, city, "state/province", zip);

);

-- ----------------------------
-- Table structure for Room
-- ----------------------------

DROP TABLE IF EXISTS Room;
CREATE TABLE Room (
    street_number int NOT NULL PRIMARY KEY,
    street_name varchar(100) NOT NULL PRIMARY KEY,
    city varchar(100) NOT NULL PRIMARY KEY,
    "state/province" varchar(50) NOT NULL PRIMARY KEY,
    zip varchar(50) NOT NULL PRIMARY KEY,
    room_number int NOT NULL PRIMARY KEY,
    price int NOT NULL,
    capacity int NOT NULL,
    "sea/mountain_view" varchar(50) NOT NULL,
    "problems/damages" varchar(50) NOT NULL
);

-- ----------------------------
-- Table structure for Room Extendable
-- ----------------------------

DROP TABLE IF EXISTS Room_extendable;
CREATE TABLE Room_extendable (
    street_number int NOT NULL,
    street_name varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    "state/province" varchar(50) NOT NULL,
    zip varchar(50) NOT NULL,
    room_number int NOT NULL,
    extendable int NOT NULL PRIMARY KEY
    ADD CONSTRAINT fk_room_extendable
    FOREIGN KEY (street_number, street_name, city, "state/province", zip, room_number)
    REFERENCES Room(street_number, street_name, city, "state/province", zip, room_number);
);

-- ----------------------------
-- Table structure for Room Amenity
-- ----------------------------

DROP TABLE IF EXISTS Room_amenity;
CREATE TABLE Room_amenity (
     street_number int NOT NULL,
     street_name varchar(100) NOT NULL,
     city varchar(100) NOT NULL,
     "state/province" varchar(50) NOT NULL,
     zip varchar(50) NOT NULL,
     room_number int NOT NULL,
     amenity int NOT NULL PRIMARY KEY
     ADD CONSTRAINT fk_room_amenity
     FOREIGN KEY (street_number, street_name, city, "state/province", zip, room_number)
     REFERENCES Room(street_number, street_name, city, "state/province", zip, room_number);
);

-- ----------------------------
-- Table structure for Room Renting
-- ----------------------------

DROP TABLE IF EXISTS Room_renting;
CREATE TABLE Room_renting (
      street_number int NOT NULL,
      street_name varchar(100) NOT NULL,
      city varchar(100) NOT NULL,
      "state/province" varchar(50) NOT NULL,
      zip varchar(50) NOT NULL,
      room_number int NOT NULL,
      booking_date date NOT NULL,
      check_in_date date NOT NULL,
      check_out_date date NOT NULL,
      "worker_SSN/SIN" varchar(9),
      "SSN/SIN" varchar(9)
);

-- ----------------------------
-- Insertion of data into Hotel Chain
-- ----------------------------
INSERT INTO Hotel_Chain(chain_name, street_number, street_name, city, "state/province", zip, num_of_hotels)
VALUES('Luxury Hotel Group', 100, 'Main Street', 'New York', 'NY', '10001', 20),
      ('Cozy Inns', 200, 'Elm Street', 'Los Angeles', 'CA', '90001', 15),
      ('City Stays', 300, 'Baker Street', 'Chicago', 'IL', '60601', 18),
      ('Grand Resorts', 400, 'Pine Avenue', 'San Francisco', 'CA', '94102', 22),
      ('Budget Hotels', 500, 'Willow Lane', 'Houston', 'TX', '77001', 25);

-- ----------------------------
-- Insertion of data into Hotel Chain email_address
-- ----------------------------
INSERT INTO Hotel_Chain_email_address(chain_name, contact_email_address)
VALUES('Luxury Hotel Group', 'contact@luxuryhotelgroup.com'),
      ('Cozy Inns', 'info@cozyinns.com'),
      ('City Stays', 'support@citystays.com'),
      ('Grand Resorts', 'booking@grandresorts.com'),
      ('Budget Hotels', 'help@budgethotels.com');

-- ----------------------------
-- Insertion of data into Hotel Chain phone_number
-- ----------------------------
INSERT INTO Hotel_Chain_phone_number(chain_name, contact_phone_number)
VALUES('Luxury Hotel Group', 1234567890),
      ('Cozy Inns', 2345678901),
      ('City Stays', 3456789012),
      ('Grand Resorts', 4567890123),
      ('Budget Hotels', 5678901234);

-- ----------------------------
-- Insertion of data into Hotel
-- ----------------------------
INSERT INTO Hotel(chain_name, street_number, street_name, city, "state/province", zip, num_of_rooms, contact_email, category)
VALUES('Luxury Hotel Group', 1001, 'Park Avenue', 'New York', 'NY', '10002', 150, 'ny@luxuryhotelgroup.com', '5-star'),
      ('Cozy Inns', 2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 80, 'la@cozyinns.com', '3-star'),
      ('City Stays', 3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 120, 'chi@citystays.com', '4-star'),
      ('Grand Resorts', 4001, 'Market Street', 'San Francisco', 'CA', '94103', 200, 'sf@grandresorts.com', '5-star'),
      ('Budget Hotels', 5001, 'Westheimer Road', 'Houston', 'TX', '77002', 50, 'hou@budgethotels.com', '2-star');

-- ----------------------------
-- Insertion of data into Room
-- ----------------------------
INSERT INTO Room(street_number, street_name, city, "state/province", zip, room_number, price, capacity, "sea/mountain_view", "problems/damages")
VALUES(1001, 'Park Avenue', 'New York', 'NY', '10002', 101, 500, 2, 'city_view', 'none'),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, 300, 2, 'sea_view', 'none'),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, 400, 2, 'city_view', 'none'),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, 600, 2, 'mountain_view', 'none'),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, 200, 2, 'city_view', 'none');

-- ----------------------------
-- Insertion of data into Room extendable
-- ----------------------------
INSERT INTO Room_extendable(street_number, street_name, city, "state/province", zip, room_number, extendable)
VALUES(1001, 'Park Avenue', 'New York', 'NY', '10002', 101, 1),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, 0),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, 1),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, 1),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, 0);

-- ----------------------------
-- Insertion of data into Room amenity
-- ----------------------------
INSERT INTO Room_amenity(street_number, street_name, city, "state/province", zip, room_number, amenity)
VALUES(1001, 'Park Avenue', 'New York', 'NY', '10002', 101, 'TV'),
      (1001, 'Park Avenue', 'New York', 'NY', '10002', 101, 'air_condition'),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, 'TV'),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, 'fridge'),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, 'air_condition'),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, 'fridge'),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, 'TV'),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, 'air_condition'),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, 'TV'),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, 'fridge');

-- ----------------------------
-- Insertion of data into Customer
-- ----------------------------
INSERT INTO Customer("SSN/SIN", first_name, middle_name, last_name, street_number, street_name, apt_number, city, "state/province", zip, registration_date)
VALUES(111223333, 'John', 'A', 'Doe', 1, 'Main Street', 10, 'New York', 'NY', '10001', '2023-01-01'),
      (222334444, 'Jane', 'B', 'Smith', 2, 'Oak Street', 20, 'Los Angeles', 'CA', '90001', '2023-01-02'),
      (333445555, 'Robert', 'C', 'Johnson', 3, 'Pine Street', 30, 'Chicago', 'IL', '60601', '2023-01-03'),
      (444556666, 'Emily', 'D', 'Brown', 4, 'Maple Street', 40, 'San Francisco', 'CA', '94102', '2023-01-04'),
      (555667777, 'Christopher', 'E', 'Wilson', 5, 'Willow Street', 50, 'Houston', 'TX', '77001', '2023-01-05');

-- ----------------------------
-- Insertion of data into Customer employee
-- ----------------------------
INSERT INTO Employee("worker_SSN/SIN", "manager_SSN/SIN", first_name, middle_name, last_name, street_number, street_name, apt_number, city, "state/province", zip)
VALUES(1111122333, NULL, 'Alice', 'F', 'White', 101, 'Cedar Street', 101, 'New York', 'NY', '10003'),
      (222223334, 1111122333, 'Bob', 'G', 'Green', 201, 'Birch Street', 201, 'Los Angeles', 'CA', '90003'),
      (333333445, 222223334, 'Carol', 'H', 'Black', 301, 'Elm Street', 301, 'Chicago', 'IL', '60603'),
      (444444556, 1111122333, 'David', 'I', 'Gray', 401, 'Hickory Street', 401, 'San Francisco', 'CA', '94104'),
      (555555667, 222223334, 'Eva', 'J', 'Blue', 501, 'Sycamore Street', 501, 'Houston', 'TX', '77003');

-- ----------------------------
-- Insertion of data into RoomBooking
-- ----------------------------
INSERT INTO RoomBooking(street_number, street_name, city, "state/province", zip, room_number, booking_date, check_in_date, check_out_date, "SSN/SIN")
VALUES(1001, 'Park Avenue', 'New York', 'NY', '10002', 101, '2023-01-10', '2023-01-15', '2023-01-20', 111223333),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, '2023-01-11', '2023-01-16', '2023-01-21', 222334444),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, '2023-01-12', '2023-01-17', '2023-01-22', 333445555),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, '2023-01-13', '2023-01-18', '2023-01-23', 444556666),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, '2023-01-14', '2023-01-19', '2023-01-24', 555667777);

-- ----------------------------
-- Insertion of data into Room_renting
-- ----------------------------
INSERT INTO Room_renting(street_number, street_name, city, "state/province", zip, room_number, booking_date, check_in_date, check_out_date, "worker_SSN/SIN", "SSN/SIN")
VALUES(1001, 'Park Avenue', 'New York', 'NY', '10002', 101, '2023-01-10', '2023-01-15', '2023-01-20', 1111122333, 111223333),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', '90002', 102, '2023-01-11', '2023-01-16', '2023-01-21', 222223334, 222334444),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', '60602', 103, '2023-01-12', '2023-01-17', '2023-01-22', 333333445, 333445555),
      (4001, 'Market Street', 'San Francisco', 'CA', '94103', 104, '2023-01-13', '2023-01-18', '2023-01-23', 444444556, 444556666),
      (5001, 'Westheimer Road', 'Houston', 'TX', '77002', 105, '2023-01-14', '2023-01-19', '2023-01-24', 555555667, 555667777);

-- ----------------------------
-- Insertion of data into becomes
-- ----------------------------
INSERT INTO becomes(street_number, street_name, city, "state/province", room_number, booking_date, check_in_date, check_out_date)
VALUES(1001, 'Park Avenue', 'New York', 'NY', 101, '2023-01-10', '2023-01-15', '2023-01-20'),
      (2001, 'Beach Boulevard', 'Los Angeles', 'CA', 102, '2023-01-11', '2023-01-16', '2023-01-21'),
      (3001, 'Michigan Avenue', 'Chicago', 'IL', 103, '2023-01-12', '2023-01-17', '2023-01-22'),
      (4001, 'Market Street', 'San Francisco', 'CA', 104, '2023-01-13', '2023-01-18', '2023-01-23'),
      (5001, 'Westheimer Road', 'Houston', 'TX', 105, '2023-01-14', '2023-01-19', '2023-01-24');