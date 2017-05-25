USE bolo;

-- User
INSERT INTO User VALUES(1, 'mypassword1', 'myemail1@email.com', 'Niles', 'Boriboon',  5);
INSERT INTO User VALUES(2, 'mypassword2', 'myemail2@email.com', 'Jon', 'Desiderio', 1);
INSERT INTO User VALUES(3, 'mypassword3', 'myemail3@email.com', 'Annie', 'Wong', 3);
INSERT INTO User VALUES(4, 'mypassword4', 'myemail4@email.com', 'Yolie', 'Saepung', null);
INSERT INTO User VALUES(5, 'mypassword5', 'myemail5@email.com', 'Chris', 'Wong', null);
INSERT INTO User VALUES(6, 'mypassword6', 'myemail6@email.com', 'Johnny', 'Nguyen', null);


-- Customers
INSERT INTO Customer VALUES(1);
INSERT INTO Customer VALUES(2);
INSERT INTO Customer VALUES(5);
INSERT INTO Customer VALUES(6);


-- Owners
INSERT INTO Owner VALUES(3);
INSERT INTO Owner VALUES(4);
INSERT INTO Owner VALUES(5);
INSERT INTO Owner VALUES(6);

-- Rooms
INSERT INTO Room VALUES(1, 3, 'Howard Schneiderman Lecture Hall', 'Irvine', 15.00, 20, 'HSLH is a big lecture room', 'hslh@email.com', '9491234455', 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, null, 12.3456789, 123.4567890);
INSERT INTO Room VALUES(2, 4, 'Engineering Hall', 'San Diego', 100.00, 30, 'EH lecture room', 'eh@email.com', '9496657788', 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, null, 23.4567891, 132.4567890);
INSERT INTO Room VALUES(3, 5, 'Biological Sciences III', 'Los Angeles', 600.00, 15, 'BS3 room', 'bs3@email.com', '9492445678', 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, null, 34.5678910, 15.2346789);
INSERT INTO Room VALUES(4, 3, 'Rowland Hall', 'San Francisco', 70.00, 25,'RH room', 'rh@email.com', '9490989657', 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, null, 80.4687592, 67.4895321);
INSERT INTO Room VALUES(5, 4, 'Humanities Instructional Building', 'Sacramento', 49.99, 30, 'HIB room', 'hib@email.com', '9496483434', 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, null, 68.9761355, 96.1248579);

-- Room_Photo
INSERT INTO Room_Photo VALUES(1, 'http://www.classrooms.uci.edu/gac/images/HSLH100A-2.jpg');
INSERT INTO Room_Photo VALUES(2, 'http://www.classrooms.uci.edu/gac/images/EH1200-2.jpg');
INSERT INTO Room_Photo VALUES(3, 'http://www.classrooms.uci.edu/gac/images/BS32130-1.jpg');
INSERT INTO Room_Photo VALUES(4, 'http://www.classrooms.uci.edu/gac/images/RH108-3.jpg');
INSERT INTO Room_Photo VALUES(5, 'http://www.classrooms.uci.edu/gac/images/HIB100-2.jpg');

-- Room_Rating
INSERT INTO Room_Rating VALUES(1, 1, 5, 'It was great');
INSERT INTO Room_Rating VALUES(2, 2, 1, 'Pretty bad');
INSERT INTO Room_Rating VALUES(3, 3, 2, 'Not so great');
INSERT INTO Room_Rating VALUES(4, 4, 3, 'Pretty average');
INSERT INTO Room_Rating VALUES(5, 5, 4, 'Pretty good');
INSERT INTO Room_Rating VALUES(6, 5, 2, 'Not really great');


-- Availability
INSERT INTO Availability VALUES (1, '2017-05-26 09:00:00', '2017-05-29 18:00:00');
INSERT INTO Availability VALUES (2, '2017-05-20 10:00:00', '2017-05-26 12:00:00');
INSERT INTO Availability VALUES (3, '2017-05-21 10:00:00', '2017-05-25 20:00:00');
INSERT INTO Availability VALUES (4, '2017-05-22 08:00:00', '2017-05-27 11:30:00');
INSERT INTO Availability VALUES (5, '2017-05-24 13:00:00', '2017-05-30 13:50:00');

-- Booking
INSERT INTO Booking VALUES(1, 1, 5, 100.00, 90.00, '2016-07-01 15:00:00', '2016-07-01 18:00:00');
INSERT INTO Booking VALUES(2, 2, 4, 99.00, 89.00, '2017-12-18 10:00:00', '2017-12-18 12:00:00');
INSERT INTO Booking VALUES(3, 5, 3, 98.00, 88.00, '2018-05-17 10:00:00', '2018-05-17 12:00:00');
INSERT INTO Booking VALUES(4, 6, 2, 97.00, 87.00, '2016-01-01 08:00:00', '2016-01-01 11:30:00');
INSERT INTO Booking VALUES(5, 1, 1, 96.00, 86.00, '2016-8-11 13:00:00', '2016-8-11 13:50:00');

-- CustomerRentsBooking
INSERT INTO CustomerRentsBooking VALUES(1,1);
INSERT INTO CustomerRentsBooking VALUES(2,2);
INSERT INTO CustomerRentsBooking VALUES(1,5);
INSERT INTO CustomerRentsBooking VALUES(6,4);