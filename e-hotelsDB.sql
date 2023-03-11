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
