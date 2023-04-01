---------------------------------------------------------------------------------------------------------------------------------------------
-- Database: Hotel Management System e-Hotels (e-Hotels)
---------------------------------------------------------------------------------------------------------------------------------------------
-- Employee table
CREATE TABLE Employee
(
    worker_ssn     VARCHAR(20) PRIMARY KEY,
    manager_ssn    VARCHAR(20),
    first_name     VARCHAR(50)  NOT NULL,
    middle_name    VARCHAR(50),
    last_name      VARCHAR(50)  NOT NULL,
    street_number  INTEGER      NOT NULL,
    street_name    VARCHAR(100) NOT NULL,
    apt_number     INTEGER,
    city           VARCHAR(100) NOT NULL,
    state_province VARCHAR(50)  NOT NULL,
    zip            VARCHAR(10)  NOT NULL
);

-- Customer table
CREATE TABLE Customer
(
    ssn               VARCHAR(20) PRIMARY KEY,
    first_name        VARCHAR(50)  NOT NULL,
    middle_name       VARCHAR(50),
    last_name         VARCHAR(50)  NOT NULL,
    street_number     INTEGER      NOT NULL,
    street_name       VARCHAR(100) NOT NULL,
    apt_number        INTEGER,
    city              VARCHAR(100) NOT NULL,
    state_province    VARCHAR(50)  NOT NULL,
    zip               VARCHAR(10)  NOT NULL,
    registration_date DATE         NOT NULL
);

-- Hotel Chain table
CREATE TABLE Hotel_Chain
(
    chain_name    VARCHAR(100) PRIMARY KEY,
    num_of_hotels INTEGER NOT NULL
);
-- Hotel table
CREATE TABLE Hotel
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    num_of_rooms   INTEGER      NOT NULL,
    contact_email  VARCHAR(100) NOT NULL,
    category       VARCHAR(50)  NOT NULL,
    chain_name     VARCHAR(100) NOT NULL,
    PRIMARY KEY (street_number, street_name, city, state_province, zip),
    FOREIGN KEY (chain_name) REFERENCES Hotel_Chain (chain_name)
);

-- Hotel Chain Email Address table
CREATE TABLE Hotel_Chain_Email_Address
(
    chain_name            VARCHAR(100),
    contact_email_address VARCHAR(100),
    PRIMARY KEY (chain_name, contact_email_address),
    FOREIGN KEY (chain_name) REFERENCES Hotel_Chain (chain_name)
);

-- Hotel Chain Phone Number table
CREATE TABLE Hotel_Chain_Phone_Num
(
    chain_name        VARCHAR(100),
    contact_phone_num VARCHAR(20),
    PRIMARY KEY (chain_name, contact_phone_num),
    FOREIGN KEY (chain_name) REFERENCES Hotel_Chain (chain_name)
);

-- Room table
CREATE TABLE Room
(
    street_number     INTEGER,
    street_name       VARCHAR(100),
    city              VARCHAR(100),
    state_province    VARCHAR(50),
    zip               VARCHAR(10),
    room_number       INTEGER,
    price             DECIMAL(10, 2) NOT NULL,
    capacity          INTEGER        NOT NULL,
    sea_mountain_view BOOLEAN        NOT NULL,
    problems_damages  TEXT,
    check_in_date     DATE,
    check_out_date    DATE,
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number),
    FOREIGN KEY (street_number, street_name, city, state_province, zip) REFERENCES Hotel (street_number, street_name, city, state_province, zip)
);

-- Room Booking table
CREATE TABLE Room_Booking
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    room_number    INTEGER,
    booking_date   DATE,
    check_in_date  DATE        NOT NULL,
    check_out_date DATE        NOT NULL,
    ssn            VARCHAR(20) NOT NULL,
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number, booking_date),
    FOREIGN KEY (ssn) REFERENCES Customer (ssn),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number) REFERENCES Room (street_number, street_name, city, state_province, zip, room_number)
);

-- Room Amenity table
CREATE TABLE Room_Amenity
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    room_number    INTEGER,
    amenity        VARCHAR(50),
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number, amenity),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number) REFERENCES Room (street_number, street_name, city, state_province, zip, room_number)
);

-- Room Extendable table
CREATE TABLE Room_Extendable
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    room_number    INTEGER,
    extendable     BOOLEAN,
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number, extendable),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number) REFERENCES Room (street_number, street_name, city, state_province, zip, room_number)
);

-- Room Renting table
CREATE TABLE Room_Renting
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    room_number    INTEGER,
    check_in_date  DATE,
    check_out_date DATE,
    worker_ssn     VARCHAR(20) NOT NULL,
    ssn            VARCHAR(20) NOT NULL,
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number, check_in_date, check_out_date),
    FOREIGN KEY (worker_ssn) REFERENCES Employee (worker_ssn),
    FOREIGN KEY (ssn) REFERENCES Customer (ssn),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number) REFERENCES Room (street_number, street_name, city, state_province, zip, room_number)
);

-- Becomes table
CREATE TABLE Becomes
(
    street_number  INTEGER,
    street_name    VARCHAR(100),
    city           VARCHAR(100),
    state_province VARCHAR(50),
    zip            VARCHAR(10),
    room_number    INTEGER,
    booking_date   DATE,
    check_in_date  DATE,
    check_out_date DATE,
    PRIMARY KEY (street_number, street_name, city, state_province, zip, room_number, booking_date, check_in_date,
                 check_out_date),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number,
                 booking_date) REFERENCES Room_Booking (street_number, street_name, city, state_province, zip,
                                                        room_number, booking_date),
    FOREIGN KEY (street_number, street_name, city, state_province, zip, room_number, check_in_date,
                 check_out_date) REFERENCES Room_Renting (street_number, street_name, city, state_province, zip,
                                                          room_number, check_in_date, check_out_date)

);


---------------------------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS AND FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------
-- validating the customer ssn
CREATE FUNCTION check_customer_ssn()
    RETURNS trigger AS
$$
BEGIN
    -- Check if SSN has 9 digits
    IF LENGTH(NEW.ssn) <> 9 THEN
        RAISE EXCEPTION 'The SSN must have exactly 9 digits';
    END IF;

    RETURN NEW;

END
$$ LANGUAGE plpgsql;
-- Trigger
CREATE TRIGGER validate_customer_ssn
    BEFORE INSERT OR UPDATE
    ON Customer
    FOR EACH ROW
EXECUTE FUNCTION check_customer_ssn();

------------------------------------------------------------------------------------------------------------

-- validating the employee and manager ssn
CREATE FUNCTION check_employee_ssn()
    RETURNS trigger AS
$$
BEGIN
    -- Check if worker_ssn has 9 digits
    IF LENGTH(NEW.worker_ssn) <> 9 THEN
        RAISE EXCEPTION 'The worker_ssn must have exactly 9 digits';
    END IF;

    -- Check if manager_ssn has 9 digits, if it is not NULL
    IF NEW.manager_ssn IS NOT NULL AND LENGTH(NEW.manager_ssn) <> 9 THEN
        RAISE EXCEPTION 'The manager_ssn must have exactly 9 digits';
    END IF;

    RETURN NEW;

END
$$ LANGUAGE plpgsql;
-- Trigger
CREATE TRIGGER validate_employee_ssn
    BEFORE INSERT OR UPDATE
    ON Employee
    FOR EACH ROW
EXECUTE FUNCTION check_employee_ssn();

------------------------------------------------------------------------------------------------------------

-- function to enforce the check-in and check-out date validation in Room_Booking table
CREATE FUNCTION validate_dates()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.check_in_date >= NEW.check_out_date THEN
        RAISE EXCEPTION 'Check-in date must be earlier than check-out date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Trigger
CREATE TRIGGER validate_dates
    BEFORE INSERT
    ON Room_Booking
    FOR EACH ROW
EXECUTE FUNCTION validate_dates();

---------------------------------------------------------------------------------------------------------------------------------------------
-- Views and Test Queries for the Views
---------------------------------------------------------------------------------------------------------------------------------------------
-- View 1: Number of available rooms per area
CREATE VIEW AvailableRoomsPerArea AS
SELECT
    R.city AS city,
    R.state_province AS state_province,
    COUNT(*) AS num_available_rooms
FROM
    Room AS R
        LEFT JOIN
    Room_Booking AS RB ON R.street_number = RB.street_number
        AND R.street_name = RB.street_name
        AND R.city = RB.city
        AND R.state_province = RB.state_province
        AND R.zip = RB.zip
        AND R.room_number = RB.room_number
        AND (RB.check_in_date <= CURRENT_DATE AND RB.check_out_date >= CURRENT_DATE)
WHERE
    RB.street_number IS NULL
GROUP BY
    R.city, R.state_province;
-- Query View 1: Fetch the number of available rooms per area
SELECT * FROM AvailableRoomsPerArea;


-- View 2: Capacity of all the rooms of a specific hotel
CREATE VIEW HotelRoomCapacity AS
SELECT
    R.street_number AS hotel_street_number,
    R.street_name AS hotel_street_name,
    R.city AS hotel_city,
    R.state_province AS hotel_state_province,
    R.zip AS hotel_zip,
    SUM(R.capacity) AS total_room_capacity
FROM
    Room AS R
GROUP BY
    R.street_number, R.street_name, R.city, R.state_province, R.zip;
-- Query View 2: Fetch the capacity of all the rooms of a specific hotel
SELECT *
FROM HotelRoomCapacity
WHERE hotel_street_number = 100
  AND hotel_street_name = 'Maple Street'
  AND hotel_city = 'Toronto'
  AND hotel_state_province = 'ON'
  AND hotel_zip = 'M5V 1M6';

---------------------------------------------------------------------------------------------------------------------------------------------
-- Indexes for the database
---------------------------------------------------------------------------------------------------------------------------------------------

-- Index 1: Index on the Room_Booking table for the check_in_date and check_out_date columns to speed up the search for available rooms
CREATE INDEX idx_room_booking_dates ON Room_Booking (check_in_date, check_out_date);

-- Index 2: Index on the Room table for the capacity column to speed up the search for available rooms by capacity
CREATE INDEX idx_room_capacity ON Room (capacity);

-- Index 3: Index on the Hotel table for the city and state_province columns to speed up the search for available rooms by area
CREATE INDEX idx_hotel_location ON Hotel (city, state_province);


---------------------------------------------------------------------------------------------------------------------------------------------
-- Populate the database with data
---------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into Hotel_Chain table
INSERT INTO Hotel_Chain (chain_name, num_of_hotels)
VALUES ('HotelChainA', 8),
       ('HotelChainB', 9),
       ('HotelChainC', 10),
       ('HotelChainD', 11),
       ('HotelChainE', 12);

-- Insert data into Hotel table for all hotel chains
INSERT INTO Hotel (street_number, street_name, city, state_province, zip, num_of_rooms, contact_email, category,
                   chain_name)
VALUES
-- HotelChainA
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 5, 'hotel1a@hotelchaina.com', 'Budget', 'HotelChainA'),
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 5, 'hotel2a@hotelchaina.com', 'Luxury', 'HotelChainA'),
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 5, 'hotel3a@hotelchaina.com', 'Budget', 'HotelChainA'),
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 5, 'hotel4a@hotelchaina.com', 'Mid-range', 'HotelChainA'),
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 5, 'hotel5a@hotelchaina.com', 'Mid-range', 'HotelChainA'),
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 5, 'hotel6a@hotelchaina.com', 'Luxury', 'HotelChainA'),
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 5, 'hotel7a@hotelchaina.com', 'Mid-range', 'HotelChainA'),
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 5, 'hotel8a@hotelchaina.com', 'Budget', 'HotelChainA'),

-- HotelChainB
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 5, 'hotel1b@hotelchainb.com', 'Mid-range', 'HotelChainB'),
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 5, 'hotel2b@hotelchainb.com', 'Luxury', 'HotelChainB'),
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 5, 'hotel3b@hotelchainb.com', 'Budget', 'HotelChainB'),
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 5, 'hotel4b@hotelchainb.com', 'Mid-range', 'HotelChainB'),
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 5, 'hotel5b@hotelchainb.com', 'Mid-range', 'HotelChainB'),
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 5, 'hotel6b@hotelchainb.com', 'Luxury', 'HotelChainB'),
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 5, 'hotel7b@hotelchainb.com', 'Mid-range', 'HotelChainB'),
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 5, 'hotel8b@hotelchainb.com', 'Budget', 'HotelChainB'),
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 5, 'hotel9b@hotelchainb.com', 'Luxury', 'HotelChainB'),

-- HotelChainC
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 5, 'hotel1c@hotelchainc.com', 'Budget', 'HotelChainC'),
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 5, 'hotel2c@hotelchainc.com', 'Luxury', 'HotelChainC'),
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 5, 'hotel3c@hotelchainc.com', 'Budget', 'HotelChainC'),
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 5, 'hotel4c@hotelchainc.com', 'Mid-range', 'HotelChainC'),
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 5, 'hotel5c@hotelchainc.com', 'Mid-range', 'HotelChainC'),
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 5, 'hotel6c@hotelchainc.com', 'Luxury', 'HotelChainC'),
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 5, 'hotel7c@hotelchainc.com', 'Mid-range', 'HotelChainC'),
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 5, 'hotel8c@hotelchainc.com', 'Budget', 'HotelChainC'),
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 5, 'hotel9c@hotelchainc.com', 'Luxury', 'HotelChainC'),
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 5, 'hotel10c@hotelchainc.com', 'Mid-range', 'HotelChainC'),

-- HotelChainD
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 5, 'hotel1d@hotelchaind.com', 'Mid-range', 'HotelChainD'),
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 5, 'hotel2d@hotelchaind.com', 'Luxury', 'HotelChainD'),
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 5, 'hotel3d@hotelchaind.com', 'Budget', 'HotelChainD'),
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 5, 'hotel4d@hotelchaind.com', 'Mid-range', 'HotelChainD'),
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 5, 'hotel5d@hotelchaind.com', 'Mid-range', 'HotelChainD'),
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 5, 'hotel6d@hotelchaind.com', 'Luxury', 'HotelChainD'),
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 5, 'hotel7d@hotelchaind.com', 'Mid-range', 'HotelChainD'),
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 5, 'hotel8d@hotelchaind.com', 'Budget', 'HotelChainD'),
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 5, 'hotel9d@hotelchaind.com', 'Luxury', 'HotelChainD'),
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 5, 'hotel10d@hotelchaind.com', 'Mid-range', 'HotelChainD'),
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 5, 'hotel11d@hotelchaind.com', 'Budget', 'HotelChainD'),

-- HotelChainE
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 5, 'hotel1e@hotelchaine.com', 'Mid-range', 'HotelChainE'),
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 5, 'hotel2e@hotelchaine.com', 'Luxury', 'HotelChainE'),
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 5, 'hotel3e@hotelchaine.com', 'Budget', 'HotelChainE'),
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 5, 'hotel4e@hotelchaine.com', 'Mid-range', 'HotelChainE'),
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 5, 'hotel5e@hotelchaine.com', 'Mid-range', 'HotelChainE'),
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 5, 'hotel6e@hotelchaine.com', 'Luxury', 'HotelChainE'),
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 5, 'hotel7e@hotelchaine.com', 'Mid-range', 'HotelChainE'),
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 5, 'hotel8e@hotelchaine.com', 'Budget', 'HotelChainE'),
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 5, 'hotel9e@hotelchaine.com', 'Luxury', 'HotelChainE'),
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 5, 'hotel10e@hotelchaine.com', 'Mid-range', 'HotelChainE');


-- Insert data into Room table for all hotels
INSERT INTO Room (street_number, street_name, city, state_province, zip, room_number, price, capacity,
                  sea_mountain_view, problems_damages, check_in_date, check_out_date)
VALUES
-- Hotel 1A
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 101, 80.00, 2, FALSE, NULL, NULL, NULL),
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 102, 100.00, 4, FALSE, NULL, NULL, NULL),
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 103, 120.00, 4, TRUE, NULL, NULL, NULL),
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 104, 150.00, 6, FALSE, NULL, NULL, NULL),
(100, 'Maple Street', 'Toronto', 'ON', 'M5V 1M6', 105, 180.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 2A
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 201, 200.00, 2, FALSE, NULL, NULL, NULL),
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 202, 250.00, 4, FALSE, NULL, NULL, NULL),
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 203, 300.00, 4, TRUE, NULL, NULL, NULL),
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 204, 350.00, 6, FALSE, NULL, NULL, NULL),
(200, 'Oak Street', 'Vancouver', 'BC', 'V5K 0A1', 205, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 3A
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 301, 80.00, 2, FALSE, NULL, NULL, NULL),
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 302, 100.00, 4, FALSE, NULL, NULL, NULL),
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 303, 120.00, 4, TRUE, NULL, NULL, NULL),
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 304, 150.00, 6, FALSE, NULL, NULL, NULL),
(300, 'Birch Street', 'Montreal', 'QC', 'H2Y 1C6', 305, 180.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 4A
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 401, 120.00, 2, FALSE, NULL, NULL, NULL),
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 402, 150.00, 4, FALSE, NULL, NULL, NULL),
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 403, 180.00, 4, TRUE, NULL, NULL, NULL),
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 404, 210.00, 6, FALSE, NULL, NULL, NULL),
(400, 'Pine Street', 'Calgary', 'AB', 'T2P 1J9', 405, 240.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 5A
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 501, 120.00, 2, FALSE, NULL, NULL, NULL),
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 502, 150.00, 4, FALSE, NULL, NULL, NULL),
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 503, 180.00, 4, TRUE, NULL, NULL, NULL),
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 504, 210.00, 6, FALSE, NULL, NULL, NULL),
(500, 'Cedar Street', 'Ottawa', 'ON', 'K1P 5G3', 505, 240.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 6A
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 601, 200.00, 2, FALSE, NULL, NULL, NULL),
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 602, 250.00, 4, FALSE, NULL, NULL, NULL),
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 603, 300.00, 4, TRUE, NULL, NULL, NULL),
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 604, 350.00, 6, FALSE, NULL, NULL, NULL),
(600, 'Spruce Street', 'Toronto', 'ON', 'M5V 1Z1', 605, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 7A
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 701, 150.00, 2, FALSE, NULL, NULL, NULL),
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 702, 180.00, 4, FALSE, NULL, NULL, NULL),
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 703, 210.00, 4, TRUE, NULL, NULL, NULL),
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 704, 240.00, 6, FALSE, NULL, NULL, NULL),
(700, 'Willow Street', 'Vancouver', 'BC', 'V6B 6H1', 705, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 8A
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 801, 80.00, 2, FALSE, NULL, NULL, NULL),
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 802, 100.00, 4, FALSE, NULL, NULL, NULL),
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 803, 120.00, 4, TRUE, NULL, NULL, NULL),
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 804, 150.00, 6, FALSE, NULL, NULL, NULL),
(800, 'Elm Street', 'Montreal', 'QC', 'H3C 5H7', 805, 180.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 1B
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 1001, 150.00, 2, FALSE, NULL, NULL, NULL),
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 1002, 180.00, 4, FALSE, NULL, NULL, NULL),
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 1003, 210.00, 4, TRUE, NULL, NULL, NULL),
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 1004, 240.00, 6, FALSE, NULL, NULL, NULL),
(1000, 'Fir Street', 'Edmonton', 'AB', 'T5J 1C3', 1005, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 2B
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 1101, 200.00, 2, FALSE, NULL, NULL, NULL),
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 1102, 250.00, 4, FALSE, NULL, NULL, NULL),
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 1103, 300.00, 4, TRUE, NULL, NULL, NULL),
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 1104, 350.00, 6, FALSE, NULL, NULL, NULL),
(1100, 'Cherry Street', 'Winnipeg', 'MB', 'R3C 3A5', 1105, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 3B
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 1201, 80.00, 2, FALSE, NULL, NULL, NULL),
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 1202, 100.00, 4, FALSE, NULL, NULL, NULL),
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 1203, 120.00, 4, TRUE, NULL, NULL, NULL),
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 1204, 140.00, 6, FALSE, NULL, NULL, NULL),
(1200, 'Aspen Street', 'Vancouver', 'BC', 'V5Y 1E6', 1205, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 4B
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 1301, 150.00, 2, FALSE, NULL, NULL, NULL),
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 1302, 180.00, 4, FALSE, NULL, NULL, NULL),
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 1303, 210.00, 4, TRUE, NULL, NULL, NULL),
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 1304, 240.00, 6, FALSE, NULL, NULL, NULL),
(1300, 'Holly Street', 'Calgary', 'AB', 'T2T 3Z6', 1305, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 5B
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 1401, 150.00, 2, FALSE, NULL, NULL, NULL),
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 1402, 180.00, 4, FALSE, NULL, NULL, NULL),
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 1403, 210.00, 4, TRUE, NULL, NULL, NULL),
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 1404, 240.00, 6, FALSE, NULL, NULL, NULL),
(1400, 'Walnut Street', 'Halifax', 'NS', 'B3J 1Z9', 1405, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 6B
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 1501, 200.00, 2, FALSE, NULL, NULL, NULL),
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 1502, 250.00, 4, FALSE, NULL, NULL, NULL),
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 1503, 300.00, 4, TRUE, NULL, NULL, NULL),
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 1504, 350.00, 6, FALSE, NULL, NULL, NULL),
(1500, 'Hickory Street', 'Toronto', 'ON', 'M4W 1G6', 1505, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 7B
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 1601, 150.00, 2, FALSE, NULL, NULL, NULL),
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 1602, 180.00, 4, FALSE, NULL, NULL, NULL),
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 1603, 210.00, 4, TRUE, NULL, NULL, NULL),
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 1604, 240.00, 6, FALSE, NULL, NULL, NULL),
(1600, 'Beech Street', 'Montreal', 'QC', 'H2Z 1A1', 1605, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 8B
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 1701, 100.00, 2, FALSE, NULL, NULL, NULL),
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 1702, 120.00, 4, FALSE, NULL, NULL, NULL),
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 1703, 140.00, 4, TRUE, NULL, NULL, NULL),
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 1704, 160.00, 6, FALSE, NULL, NULL, NULL),
(1700, 'Alder Street', 'Vancouver', 'BC', 'V6E 1S3', 1705, 180.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 9B
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 1801, 200.00, 2, FALSE, NULL, NULL, NULL),
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 1802, 250.00, 4, FALSE, NULL, NULL, NULL),
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 1803, 300.00, 4, TRUE, NULL, NULL, NULL),
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 1804, 350.00, 6, FALSE, NULL, NULL, NULL),
(1800, 'Juniper Street', 'Victoria', 'BC', 'V8W 1C4', 1805, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 1C
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 1901, 80.00, 2, FALSE, NULL, NULL, NULL),
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 1902, 100.00, 4, FALSE, NULL, NULL, NULL),
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 1903, 120.00, 4, TRUE, NULL, NULL, NULL),
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 1904, 140.00, 6, FALSE, NULL, NULL, NULL),
(1900, 'Cypress Street', 'Quebec City', 'QC', 'G1R 2W7', 1905, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 2C
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 2001, 200.00, 2, FALSE, NULL, NULL, NULL),
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 2002, 250.00, 4, FALSE, NULL, NULL, NULL),
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 2003, 300.00, 4, TRUE, NULL, NULL, NULL),
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 2004, 350.00, 6, FALSE, NULL, NULL, NULL),
(2000, 'Dogwood Street', 'Toronto', 'ON', 'M5A 1K9', 2005, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 3C
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 2101, 80.00, 2, FALSE, NULL, NULL, NULL),
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 2102, 100.00, 4, FALSE, NULL, NULL, NULL),
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 2103, 120.00, 4, TRUE, NULL, NULL, NULL),
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 2104, 140.00, 6, FALSE, NULL, NULL, NULL),
(2100, 'Hemlock Street', 'Ottawa', 'ON', 'K1A 0A9', 2105, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 4C
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 2201, 150.00, 2, FALSE, NULL, NULL, NULL),
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 2202, 180.00, 4, FALSE, NULL, NULL, NULL),
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 2203, 210.00, 4, TRUE, NULL, NULL, NULL),
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 2204, 240.00, 6, FALSE, NULL, NULL, NULL),
(2200, 'Sequoia Street', 'Halifax', 'NS', 'B3K 5M2', 2205, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 5C
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 2301, 150.00, 2, FALSE, NULL, NULL, NULL),
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 2302, 180.00, 4, FALSE, NULL, NULL, NULL),
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 2303, 210.00, 4, TRUE, NULL, NULL, NULL),
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 2304, 240.00, 6, FALSE, NULL, NULL, NULL),
(2300, 'Redwood Street', 'Vancouver', 'BC', 'V5Z 3X7', 2305, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 6C
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 2401, 200.00, 2, FALSE, NULL, NULL, NULL),
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 2402, 250.00, 4, FALSE, NULL, NULL, NULL),
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 2403, 300.00, 4, TRUE, NULL, NULL, NULL),
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 2404, 350.00, 6, FALSE, NULL, NULL, NULL),
(2400, 'Teak Street', 'Montreal', 'QC', 'H3B 4G7', 2405, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 7C
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 2501, 150.00, 2, FALSE, NULL, NULL, NULL),
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 2502, 180.00, 4, FALSE, NULL, NULL, NULL),
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 2503, 210.00, 4, TRUE, NULL, NULL, NULL),
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 2504, 240.00, 6, FALSE, NULL, NULL, NULL),
(2500, 'Mahogany Street', 'Toronto', 'ON', 'M5C 1K6', 2505, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 8C
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 2601, 80.00, 2, FALSE, NULL, NULL, NULL),
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 2602, 100.00, 4, FALSE, NULL, NULL, NULL),
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 2603, 120.00, 4, TRUE, NULL, NULL, NULL),
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 2604, 140.00, 6, FALSE, NULL, NULL, NULL),
(2600, 'Sandalwood Street', 'Edmonton', 'AB', 'T5J 4B7', 2605, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 9C
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 2701, 200.00, 2, FALSE, NULL, NULL, NULL),
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 2702, 250.00, 4, FALSE, NULL, NULL, NULL),
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 2703, 300.00, 4, TRUE, NULL, NULL, NULL),
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 2704, 350.00, 6, FALSE, NULL, NULL, NULL),
(2700, 'Chestnut Street', 'Calgary', 'AB', 'T2R 0S8', 2705, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 10C
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 2801, 150.00, 2, FALSE, NULL, NULL, NULL),
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 2802, 180.00, 4, FALSE, NULL, NULL, NULL),
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 2803, 210.00, 4, TRUE, NULL, NULL, NULL),
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 2804, 240.00, 6, FALSE, NULL, NULL, NULL),
(2800, 'Linden Street', 'Winnipeg', 'MB', 'R3B 1A6', 2805, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 1D
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 2901, 150.00, 2, FALSE, NULL, NULL, NULL),
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 2902, 180.00, 4, FALSE, NULL, NULL, NULL),
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 2903, 210.00, 4, TRUE, NULL, NULL, NULL),
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 2904, 240.00, 6, FALSE, NULL, NULL, NULL),
(2900, 'Cottonwood Street', 'Victoria', 'BC', 'V8V 1Z8', 2905, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 2D
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 3001, 200.00, 2, FALSE, NULL, NULL, NULL),
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 3002, 250.00, 4, FALSE, NULL, NULL, NULL),
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 3003, 300.00, 4, TRUE, NULL, NULL, NULL),
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 3004, 350.00, 6, FALSE, NULL, NULL, NULL),
(3000, 'Sycamore Street', 'Toronto', 'ON', 'M4E 1G3', 3005, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 3D
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 3101, 80.00, 2, FALSE, NULL, NULL, NULL),
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 3102, 100.00, 4, FALSE, NULL, NULL, NULL),
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 3103, 120.00, 4, TRUE, NULL, NULL, NULL),
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 3104, 140.00, 6, FALSE, NULL, NULL, NULL),
(3100, 'Poplar Street', 'Vancouver', 'BC', 'V6H 3Y5', 3105, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 4D
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 3201, 150.00, 2, FALSE, NULL, NULL, NULL),
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 3202, 180.00, 4, FALSE, NULL, NULL, NULL),
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 3203, 210.00, 4, TRUE, NULL, NULL, NULL),
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 3204, 240.00, 6, FALSE, NULL, NULL, NULL),
(3200, 'Willow Street', 'Montreal', 'QC', 'H2L 2X8', 3205, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 5D
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 3301, 150.00, 2, FALSE, NULL, NULL, NULL),
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 3302, 180.00, 4, FALSE, NULL, NULL, NULL),
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 3303, 210.00, 4, TRUE, NULL, NULL, NULL),
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 3304, 240.00, 6, FALSE, NULL, NULL, NULL),
(3300, 'Palm Street', 'Ottawa', 'ON', 'K1S 5J3', 3305, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 6D
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 3401, 200.00, 2, FALSE, NULL, NULL, NULL),
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 3402, 250.00, 4, FALSE, NULL, NULL, NULL),
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 3403, 300.00, 4, TRUE, NULL, NULL, NULL),
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 3404, 350.00, 6, FALSE, NULL, NULL, NULL),
(3400, 'Birch Street', 'Halifax', 'NS', 'B3H 0A3', 3405, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 7D
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 3501, 150.00, 2, FALSE, NULL, NULL, NULL),
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 3502, 180.00, 4, FALSE, NULL, NULL, NULL),
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 3503, 210.00, 4, TRUE, NULL, NULL, NULL),
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 3504, 240.00, 6, FALSE, NULL, NULL, NULL),
(3500, 'Pine Street', 'Edmonton', 'AB', 'T5K 2B1', 3505, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 8D
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 3601, 80.00, 2, FALSE, NULL, NULL, NULL),
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 3602, 100.00, 4, FALSE, NULL, NULL, NULL),
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 3603, 120.00, 4, TRUE, NULL, NULL, NULL),
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 3604, 140.00, 6, FALSE, NULL, NULL, NULL),
(3600, 'Spruce Street', 'Calgary', 'AB', 'T2R 1M5', 3605, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 9D
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 3701, 200.00, 2, FALSE, NULL, NULL, NULL),
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 3702, 250.00, 4, FALSE, NULL, NULL, NULL),
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 3703, 300.00, 4, TRUE, NULL, NULL, NULL),
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 3704, 350.00, 6, FALSE, NULL, NULL, NULL),
(3700, 'Cedar Street', 'Winnipeg', 'MB', 'R3B 2Z6', 3705, 400.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 10D
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 3801, 150.00, 2, FALSE, NULL, NULL, NULL),
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 3802, 180.00, 4, FALSE, NULL, NULL, NULL),
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 3803, 210.00, 4, TRUE, NULL, NULL, NULL),
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 3804, 240.00, 6, FALSE, NULL, NULL, NULL),
(3800, 'Maple Street', 'Victoria', 'BC', 'V8W 1W5', 3805, 270.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 11D
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 3901, 80.00, 2, FALSE, NULL, NULL, NULL),
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 3902, 100.00, 4, FALSE, NULL, NULL, NULL),
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 3903, 120.00, 4, TRUE, NULL, NULL, NULL),
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 3904, 140.00, 6, FALSE, NULL, NULL, NULL),
(3900, 'Oak Street', 'Toronto', 'ON', 'M5S 1Y5', 3905, 160.00, 6, TRUE, NULL, NULL, NULL),
-- Hotel 1E
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 4001, 150.00, 2, FALSE, NULL, NULL, NULL),
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 4002, 180.00, 4, FALSE, NULL, NULL, NULL),
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 4003, 200.00, 4, TRUE, NULL, NULL, NULL),
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 4004, 220.00, 6, FALSE, NULL, NULL, NULL),
(4000, 'Elm Street', 'Montreal', 'QC', 'H2X 3W9', 4005, 250.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 2E
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 4101, 250.00, 2, FALSE, NULL, NULL, NULL),
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 4102, 280.00, 4, FALSE, NULL, NULL, NULL),
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 4103, 300.00, 4, TRUE, NULL, NULL, NULL),
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 4104, 350.00, 6, FALSE, NULL, NULL, NULL),
(4100, 'Cherry Street', 'Vancouver', 'BC', 'V6J 4Y9', 4105, 380.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 3E
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 4201, 80.00, 2, FALSE, NULL, NULL, NULL),
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 4202, 100.00, 4, FALSE, NULL, NULL, NULL),
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 4203, 120.00, 4, TRUE, NULL, NULL, NULL),
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 4204, 140.00, 6, FALSE, NULL, NULL, NULL),
(4200, 'Walnut Street', 'Calgary', 'AB', 'T2P 5C5', 4205, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 4E
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 4301, 150.00, 2, FALSE, NULL, NULL, NULL),
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 4302, 180.00, 4, FALSE, NULL, NULL, NULL),
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 4303, 200.00, 4, TRUE, NULL, NULL, NULL),
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 4304, 220.00, 6, FALSE, NULL, NULL, NULL),
(4300, 'Hickory Street', 'Ottawa', 'ON', 'K1N 6Z6', 4305, 250.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 5E
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 4401, 150.00, 2, FALSE, NULL, NULL, NULL),
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 4402, 180.00, 4, FALSE, NULL, NULL, NULL),
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 4403, 200.00, 4, TRUE, NULL, NULL, NULL),
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 4404, 220.00, 6, FALSE, NULL, NULL, NULL),
(4400, 'Beech Street', 'Edmonton', 'AB', 'T5J 0N7', 4405, 250.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 6E
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 4501, 250.00, 2, FALSE, NULL, NULL, NULL),
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 4502, 280.00, 4, FALSE, NULL, NULL, NULL),
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 4503, 300.00, 4, TRUE, NULL, NULL, NULL),
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 4504, 350.00, 6, FALSE, NULL, NULL, NULL),
(4500, 'Alder Street', 'Winnipeg', 'MB', 'R3C 4T3', 4505, 380.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 7E
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 4601, 150.00, 2, FALSE, NULL, NULL, NULL),
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 4602, 180.00, 4, FALSE, NULL, NULL, NULL),
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 4603, 200.00, 4, TRUE, NULL, NULL, NULL),
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 4604, 220.00, 6, FALSE, NULL, NULL, NULL),
(4600, 'Chestnut Street', 'Halifax', 'NS', 'B3L 1A3', 4605, 250.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 8E
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 4701, 80.00, 2, FALSE, NULL, NULL, NULL),
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 4702, 100.00, 4, FALSE, NULL, NULL, NULL),
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 4703, 120.00, 4, TRUE, NULL, NULL, NULL),
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 4704, 140.00, 6, FALSE, NULL, NULL, NULL),
(4700, 'Linden Street', 'Toronto', 'ON', 'M5V 3T6', 4705, 160.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 9E
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 4801, 250.00, 2, FALSE, NULL, NULL, NULL),
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 4802, 280.00, 4, FALSE, NULL, NULL, NULL),
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 4803, 300.00, 4, TRUE, NULL, NULL, NULL),
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 4804, 350.00, 6, FALSE, NULL, NULL, NULL),
(4800, 'Sandalwood Street', 'Vancouver', 'BC', 'V6B 1R1', 4805, 380.00, 6, TRUE, NULL, NULL, NULL),

-- Hotel 10E
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 4901, 150.00, 2, FALSE, NULL, NULL, NULL),
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 4902, 180.00, 4, FALSE, NULL, NULL, NULL),
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 4903, 200.00, 4, TRUE, NULL, NULL, NULL),
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 4904, 220.00, 6, FALSE, NULL, NULL, NULL),
(4900, 'Mahogany Street', 'Montreal', 'QC', 'H3A 1Y2', 4905, 250.00, 6, TRUE, NULL, NULL, NULL);