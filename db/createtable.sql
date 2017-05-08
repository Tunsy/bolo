DROP TABLE IF EXISTS CustomerRentsBooking;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Availability;
DROP TABLE IF EXISTS Room_Photo;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Owner;
DROP TABLE IF EXISTS User;

CREATE TABLE User (
	`uid`				INT UNSIGNED NOT NULL,
    `password` 			VARCHAR(100) NOT NULL,
    `email` 			VARCHAR(100) NOT NULL,
    `first_name` 		VARCHAR(100) NOT NULL,
    `last_name`			VARCHAR(100) NOT NULL,
    `rating` 			INT NULL,
	PRIMARY KEY(`uid`)
);

CREATE TABLE Customer (
	`cid` 				INT UNSIGNED NOT NULL,
    PRIMARY KEY			(`cid`),
	FOREIGN KEY 		(`cid`) REFERENCES User(`uid`) ON DELETE CASCADE
);

CREATE TABLE Owner (
	`oid` 				INT UNSIGNED NOT NULL,
    PRIMARY KEY			(`oid`),
    FOREIGN KEY 		(`oid`) REFERENCES User(`uid`) ON DELETE CASCADE
);

CREATE TABLE Room (
	`rid`               INT UNSIGNED NOT NULL,
    `oid`               INT UNSIGNED NOT NULL,
    `name`              VARCHAR (200) NOT NULL,
    `location`          VARCHAR (200) NOT NULL, -- Might use open-source thingie
    `price`             DECIMAL (10,2) NOT NULL,
    PRIMARY KEY			(`rid`),
    FOREIGN KEY         (`oid`) REFERENCES Owner(`oid`) ON DELETE NO ACTION
);

CREATE TABLE Room_Photo (
    `rid`               INT UNSIGNED NOT NULL,
    `photo_url`         VARCHAR(300) NOT NULL,
    PRIMARY KEY         (`rid`),
    FOREIGN KEY         (`rid`) REFERENCES Room(`rid`) ON DELETE NO ACTION
);

CREATE TABLE Availability (
    `rid`               INT UNSIGNED NOT NULL,
    `start_datetime`    DATETIME NOT NULL,
    `end_datetime`      DATETIME NOT NULL,
    PRIMARY KEY         (`rid`),
    FOREIGN KEY         (`rid`) REFERENCES Room(`rid`) ON DELETE NO ACTION
);

CREATE TABLE Booking (
	`bid`				INT UNSIGNED NOT NULL,
	`cid`				INT UNSIGNED,
    `rid`				INT UNSIGNED NOT NULL,
    `grand_total_price`	DECIMAL(10,2) NOT NULL,
    `subtotal_price`    DECIMAL(10,2) NOT NULL,
    `start_datetime`    DATETIME NOT NULL,
    `end_datetime`      DATETIME NOT NULL, 
    PRIMARY KEY			(`bid`),
    FOREIGN KEY			(`cid`) REFERENCES Customer(`cid`) ON DELETE CASCADE,
    FOREIGN KEY			(`rid`) REFERENCES Room(`rid`) ON DELETE NO ACTION
);

CREATE TABLE CustomerRentsBooking (
    `bid`               INT UNSIGNED NOT NULL,
	`cid`               INT UNSIGNED NOT NULL,
    PRIMARY KEY         (`bid`, `cid`),
    FOREIGN KEY         (`bid`) REFERENCES Booking(`bid`),
    FOREIGN KEY         (`cid`) REFERENCES Customer(`cid`)
);

