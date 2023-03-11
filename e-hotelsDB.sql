-- ----------------------------
-- Table structure for Hotel Chain
-- ----------------------------

DROP TABLE IF EXISTS Hotel_Chain;
CREATE TABLE Hotel_Chain (
    chain_name varchar(100) PRIMARY KEY,
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
    chain_name varchar(100),
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
    chain_name varchar(100),
    contact_phone_number int PRIMARY KEY
    CONSTRAINT fk_Hotel_Chain_phone_number_chain_name
    FOREIGN KEY (chain_name)
    REFERENCES Hotel_Chain(chain_name)
);

-- ----------------------------
-- Table structure for Hotel
-- ----------------------------

DROP TABLE IF EXISTS Hotel;
CREATE TABLE Hotel_Chain (
    chain_name varchar(100),
    street_number int,
    street_name varchar(100),
    city varchar(100),
    "state/province" varchar(50) NOT NULL,
    zip varchar(50) NOT NULL,
    num_of_rooms int NOT NULL,
    contact_email varchar(100) CHECK (email LIKE '_%@_%._%'),
    category varchar(100)
    ADD CONSTRAINT fk_hotel_chain_phone_number
    FOREIGN KEY (street_number, street_name, city, "state/province", zip)
    REFERENCES Room(street_number, street_name, city, "state/province", zip);

);

-- ----------------------------
-- Table structure for Room
-- ----------------------------


