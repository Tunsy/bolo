DROP TABLE IF EXISTS HobbyHasEquipment;
DROP TABLE IF EXISTS Conversation;
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Listing;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Hobby;
DROP TABLE IF EXISTS Borrower;
DROP TABLE IF EXISTS Owner;

CREATE TABLE Borrower (
	`bid` 				INT UNSIGNED NOT NULL,
    `location` 			VARCHAR(100) NOT NULL,
    `password` 			VARCHAR(100) NOT NULL,
    `email` 			VARCHAR(100) NOT NULL,
    `name` 				VARCHAR(100) NOT NULL,
    `security_question` VARCHAR(200) NOT NULL,
    `birthday` 			DATE NOT NULL,
    `rating` 			INT NULL,
    PRIMARY KEY			(`bid`)
);

CREATE TABLE Owner (
	`oid` 				INT UNSIGNED NOT NULL,
    `location` 			VARCHAR(100) NOT NULL,
    `password` 			VARCHAR(100) NOT NULL,
    `email` 			VARCHAR(100) NOT NULL,
    `name` 				VARCHAR(100) NOT NULL,
    `security_question` VARCHAR(200) NOT NULL,
    `birthday` 			DATE NOT NULL,
    `rating` 			INT NULL,
    PRIMARY KEY			(`oid`)
);

CREATE TABLE Hobby (
	`hid` 				INT UNSIGNED NOT NULL,
	`name` 				VARCHAR(100) NOT NULL,
    `photo` 			VARCHAR(200) NOT NULL,
    PRIMARY KEY			(`hid`)
);

CREATE TABLE Equipment (
	`eid` 				INT UNSIGNED NOT NULL,
    `photo` 			VARCHAR(200) NOT NULL,
    `name`				VARCHAR(100) NOT NULL,
    PRIMARY KEY			(`eid`)
);

CREATE TABLE Listing (
	`lid`				INT UNSIGNED NOT NULL,
	`oid`				INT UNSIGNED NOT NULL,
    `eid`				INT UNSIGNED NOT NULL,
    `photo`				VARCHAR(200) NOT NULL,
    `item_name`			VARCHAR(100) NOT NULL,
    `price`				DECIMAL(10,2) NOT NULL,
    `rating`			INT, #not sure
    `condition`			INT NOT NULL, #or VARCHAR?
    `availability`		VARCHAR(100) NOT NULL,	#or DATE, if derived from date
    `pickupOrDelivery`	VARCHAR(100) NOT NULL, 
    PRIMARY KEY			(`lid`),
    FOREIGN KEY			(`oid`) REFERENCES Owner(`oid`) ON DELETE CASCADE,
    FOREIGN KEY			(`eid`) REFERENCES Equipment(`eid`) ON DELETE CASCADE
);

CREATE TABLE Conversation (
	`cid`				INT UNSIGNED NOT NULL,
    `bid`				INT UNSIGNED NOT NULL,
    `lid`				INT UNSIGNED NOT NULL,
    `datetime`			DATETIME NOT NULL,
    PRIMARY KEY			(`cid`),
    FOREIGN KEY			(`bid`) REFERENCES Borrower(`bid`) ON DELETE NO ACTION,
    FOREIGN KEY			(`lid`) REFERENCES Listing(`lid`) ON DELETE NO ACTION
);

CREATE TABLE Transaction (
	`tid`				INT UNSIGNED NOT NULL,
    `bid`				INT UNSIGNED NOT NULL,
    `lid`				INT UNSIGNED NOT NULL,
    `date`				DATE NOT NULL,
    `numberOfDays`		INT NOT NULL,
    PRIMARY KEY			(`tid`),
    FOREIGN KEY			(`bid`) REFERENCES Borrower(`bid`) ON DELETE NO ACTION,
    FOREIGN KEY			(`lid`) REFERENCES Listing(`lid`) ON DELETE NO ACTION
);

CREATE TABLE HobbyHasEquipment (
	`hid`				INT UNSIGNED NOT NULL,
    `eid`				INT UNSIGNED NOT NULL,
    PRIMARY KEY			(`hid`,`eid`),
    FOREIGN KEY			(`hid`) REFERENCES Hobby(`hid`) ON DELETE CASCADE,
    FOREIGN KEY			(`eid`) REFERENCES Equipment(`eid`) ON DELETE CASCADE
);