

-- Hobbies
INSERT INTO Hobby VALUES(1, 'Bowling', 'http://www.stantonlanes.com/wp-content/uploads/2014/11/Dollarphotoclub_436926891-e1415924052303.jpg');
INSERT INTO Hobby VALUES(2, 'Cooking', 'http://i.huffpost.com/gen/1977217/images/o-COOKING-facebook.jpg');
INSERT INTO Hobby VALUES(3, 'Photography', 'https://static.bhphotovideo.com/explora/sites/default/files/TS-Night-Photography.jpg');
INSERT INTO Hobby VALUES(4, 'Hiking', 'http://photokaz.com/wp-content/uploads/2012/08/2012-08-18-Lions-Binkert-Hike-9867-MKH.jpg');
INSERT INTO Hobby VALUES(5, 'Snowboarding', 'http://www.snowboardingdays.com/wp-content/uploads/2013/10/snowboard-baby-grom-620x407-600x400.jpg');
INSERT INTO Hobby VALUES(6, 'Gaming', 'https://static5.gamespot.com/uploads/scale_super/1552/15524586/3012244-biggest-gaming-anniversaries-of-2016-promo.jpg');
INSERT INTO Hobby VALUES(7, 'Tennis', 'http://az616578.vo.msecnd.net/files/2016/02/26/635921175574540783-563300402_tennis%203.jpeg');
INSERT INTO Hobby VALUES(8, 'Basketball', 'http://www.sportspsychologybasketball.com/wp-content/uploads/2011/02/duke_600x300.jpg');
INSERT INTO Hobby VALUES(9, 'Swimming', 'https://cdn2.omidoo.com/sites/default/files/imagecache/full_width/images/bydate/201508/swimmingphoto1.jpg');
INSERT INTO Hobby VALUES(10, 'Calligraphy', 'https://scontent.xx.fbcdn.net/v/t34.0-0/s261x260/17496354_10208709432348464_1921088013_n.jpg?oh=dd9931ae41e16f2b1f16efaa43b444a4&oe=58FF6D43');


-- Equipment
INSERT INTO Equipment VALUES(1, 'Bowling Ball', 'https://static.giantbomb.com/uploads/scale_small/0/6413/349303-bowling_ball.jpg');
INSERT INTO Equipment VALUES(2, 'Bowling Shoes', 'https://images.bowling.com/7031.jpg');
INSERT INTO Equipment VALUES(3, 'Wok', 'https://st.hzcdn.com/simgs/06910df10373e7fe_4-3090/contemporary-woks-and-stirfry-pans.jpg');
INSERT INTO Equipment VALUES(4, 'Spiralizer', 'https://images-na.ssl-images-amazon.com/images/I/61ybvBm7eQL._SY355_.jpg');
INSERT INTO Equipment VALUES(5, 'Camera', 'https://pisces.bbystatic.com/BestBuy_US/images/products/1634/1634012le.jpg;maxHeight=460;maxWidth=460');
INSERT INTO Equipment VALUES(6, 'Tripod', 'https://www.bhphotovideo.com/images/images2500x2500/Magnus_PV_3310_Photo_Tripod_With_796298.jpg');
INSERT INTO Equipment VALUES(7, 'Backpack', 'https://adventurejunkies-theadventurejunk.netdna-ssl.com/wp-content/uploads/412BQ3ieTUrL.jpg');
INSERT INTO Equipment VALUES(8, 'Boots', 'http://trevormorrowtravel.com/wp-content/uploads/2015/07/hiking-boots-4.png');
INSERT INTO Equipment VALUES(9, 'Snowboard', 'https://www.rei.com/media/product/106957');
INSERT INTO Equipment VALUES(10, 'Winter Coat', 'https://www.piratesofpowder.com/wp-content/uploads/2016/02/Burton-Mens-Covert-Snowboarding-Jacket.jpg');
INSERT INTO Equipment VALUES(11, 'Mouse', 'https://images10.newegg.com/ProductImage/26-608-012-07.jpg');
INSERT INTO Equipment VALUES(12, 'Headset', 'http://bpc.h-cdn.co/assets/17/09/480x480/gallery-1488659545-hyperx-gaming-headset.jpg');
INSERT INTO Equipment VALUES(13, 'Tennis Ball', 'http://media.supercheapauto.com.au/sports/images/zooms/402321-zoom.jpg');
INSERT INTO Equipment VALUES(14, 'Racket', 'http://shop.wilson.com/media/catalog/product/cache/38/image/9df78eab33525d08d6e5fb8d27136e95/w/r/wrt72391u0.jpg');
INSERT INTO Equipment VALUES(15, 'Basketball', 'http://shop.wilson.com/media/catalog/product/cache/38/image/9df78eab33525d08d6e5fb8d27136e95/w/t/wtb0516r-1.jpg');
INSERT INTO Equipment VALUES(16, 'Goggles', 'https://photos.cdn-outlet.com/photos/SOResource/options/22394-26833-259x292-AUTO.jpg');
INSERT INTO Equipment VALUES(17, 'Swimming Cap', 'https://images-na.ssl-images-amazon.com/images/I/81A5NYfr1ZL._SL1500_.jpg');
INSERT INTO Equipment VALUES(18, 'Calligraphy Pen', 'https://www.thetbank.com/the-lowdown/wp-content/uploads/2016/10/Calligraphy-Pen.jpg');
INSERT INTO Equipment VALUES(19, 'Ink', 'http://cdn.dick-blick.com/items/211/28/21128-1069-2ww-m.jpg');



-- HobbyHasEquipment
INSERT INTO HobbyHasEquipment VALUES(1,1);
INSERT INTO HobbyHasEquipment VALUES(1,2);
INSERT INTO HobbyHasEquipment VALUES(2,3);
INSERT INTO HobbyHasEquipment VALUES(2,4);
INSERT INTO HobbyHasEquipment VALUES(3,5);
INSERT INTO HobbyHasEquipment VALUES(3,6);
INSERT INTO HobbyHasEquipment VALUES(4,7);
INSERT INTO HobbyHasEquipment VALUES(4,8);
INSERT INTO HobbyHasEquipment VALUES(5,9);
INSERT INTO HobbyHasEquipment VALUES(5,10);
INSERT INTO HobbyHasEquipment VALUES(6,11);
INSERT INTO HobbyHasEquipment VALUES(6,12);
INSERT INTO HobbyHasEquipment VALUES(7,13);
INSERT INTO HobbyHasEquipment VALUES(7,14);
INSERT INTO HobbyHasEquipment VALUES(8,15);
INSERT INTO HobbyHasEquipment VALUES(9,16);
INSERT INTO HobbyHasEquipment VALUES(9,17);
INSERT INTO HobbyHasEquipment VALUES(10,18);
INSERT INTO HobbyHasEquipment VALUES(10,19);


-- User
INSERT INTO User VALUES(1, 'Cerritos', 'mypassword', 'myemail@email.com', 'Niles', 'What is my student ID number?', '1996/04/09', null);
INSERT INTO User VALUES(2, 'Chino Hills', 'mypassword', 'myemail@email.com', 'Jon', 'Am I a derp?', '1996/01/24', null);
INSERT INTO User VALUES(3, 'San Gabriel', 'mypassword', 'myemail@email.com', 'Annie', 'Whos my favorite?', '1995/07/07', null);
INSERT INTO User VALUES(4, 'Monterey Park', 'mypassword', 'myemail@email.com', 'Yolie', 'Is this yours?', '1994/11/07', null);
INSERT INTO User VALUES(5, 'Kuala Lumpur', 'mypassword', 'myemail@email.com', 'Chris', '', '1996/05/10', null);
INSERT INTO User VALUES(6, 'Sunnyvale', 'mypassword', 'myemail@email.com', 'Johnny', 'What are your dinner plans?', '1996/06/26', null);


-- Borrowers
INSERT INTO Borrower VALUES(1);
INSERT INTO Borrower VALUES(2);
INSERT INTO Borrower VALUES(5);
INSERT INTO Borrower VALUES(6);


-- Owners
INSERT INTO Owner VALUES(3);
INSERT INTO Owner VALUES(4);
INSERT INTO Owner VALUES(5);
INSERT INTO Owner VALUES(6);


-- Listings
INSERT INTO Listing VALUES(1, 3, 4, 'https://images-na.ssl-images-amazon.com/images/I/61ybvBm7eQL._SY355_.jpg', 'Annies spiralizer', 100.00, 0, 0, TRUE, 'Pickup');
INSERT INTO Listing VALUES(2, 4, 18, 'https://www.thetbank.com/the-lowdown/wp-content/uploads/2016/10/Calligraphy-Pen.jpg', 'Yolies calligraphy pen', 99.00, 0, 5, TRUE, 'Pickup');
INSERT INTO Listing VALUES(3, 4, 19, 'http://cdn.dick-blick.com/items/211/28/21128-1069-2ww-m.jpg', 'Yolies calligraphy ink', 98.00, 0, 4, FALSE, 'Pickup');
INSERT INTO Listing VALUES(4, 5, 4, 'https://pisces.bbystatic.com/BestBuy_US/images/products/1634/1634012le.jpg;maxHeight=460;maxWidth=460', 'Chris camera', 97.00, 0, 5, FALSE, 'Pickup or Deliver');
INSERT INTO Listing VALUES(5, 6, 4, 'https://adventurejunkies-theadventurejunk.netdna-ssl.com/wp-content/uploads/412BQ3ieTUrL.jpg', 'Johnnys backpack', 96.00, 0, 3, TRUE, 'Pickup or Deliver');


-- Conversations
INSERT INTO Conversation VALUES(1, 1, 5, '2017/01/01');
INSERT INTO Conversation VALUES(2, 2, 4, '2017/02/02');
INSERT INTO Conversation VALUES(3, 5, 2, '2017/03/03');
INSERT INTO Conversation VALUES(4, 5, 3, '2017/04/04');
INSERT INTO Conversation VALUES(5, 6, 4, '2017/04/20');


-- Transactions
INSERT INTO Transaction VALUES(1, 6, 4, '2017/04/21', 7);
INSERT INTO Transaction VALUES(2, 1, 5, '2017/01/01', 14);
INSERT INTO Transaction VALUES(3, 5, 2, '2017/03/03', 21);
INSERT INTO Transaction VALUES(4, 5, 3, '2017/04/04', 30);



