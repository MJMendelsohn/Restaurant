INSERT INTO Restaurant VALUES(7215, 'The Little Dipper','f','7214563789',4,'American/Brunch','f','f','t');
INSERT INTO Location VALUES('905 W Main St',27701,'Durham', 'NC');
INSERT INTO RestaurantAt VALUES(7215,'905 W Main St',27701);
INSERT INTO Food VALUES(212, 'Tuscan Fondue', 23.00 );
INSERT INTO Food VALUES(213, 'Scallops', 32.00 );
INSERT INTO Food VALUES(214, 'Chicken Medallions', 17.00 );
INSERT INTO Serves VALUES (7215,212);
INSERT INTO Serves VALUES (7215,213);
INSERT INTO Serves VALUES (7215,214);

INSERT INTO Restaurant VALUES(3214,'Beyu Caffe','t','6355557892',3,'American/Jazz','f','f','t');
INSERT INTO Location VALUES('341 W Main St',27701,'Durham', 'NC');
INSERT INTO RestaurantAt VALUES(3214,'341 W Main St',27701);
INSERT INTO Food VALUES(123, 'House Salad', 10.00 );
INSERT INTO Food VALUES(124, 'Breakfast Burrito', 12.00 );
INSERT INTO Food VALUES(125, 'Vegetable Medley', 10.00 );
INSERT INTO Serves VALUES (3214,123);
INSERT INTO Serves VALUES (3214,124);
INSERT INTO Serves VALUES (3214,125);

INSERT INTO Restaurant VALUES(3333, 'Dragon Gate','f','8234652222',2,'Chinese','t','f','t');
INSERT INTO Location VALUES('2000 Chapel Hill Rd # 42', 27707,'Durham', 'NC');
INSERT INTO RestaurantAt VALUES(3333,'2000 Chapel Hill Rd # 42',27707);
INSERT INTO Food VALUES(444, 'Cashew Chicken', 7.00 );
INSERT INTO Food VALUES(445, 'Fried Rice', 4.50 );
INSERT INTO Food VALUES(446, 'Pad Thai', 7.50 );
INSERT INTO Serves VALUES (3333,444);
INSERT INTO Serves VALUES (3333,445);
INSERT INTO Serves VALUES (3333,446);

INSERT INTO Users VALUES('foodeater27', 'Michael Mendelsohn', 'smallpotatoes45', '08011994');
INSERT INTO Location VALUES('420 Chapel Drive', 27701, 'Durham', 'NC');
INSERT INTO LivesAt VALUES('foodeater27', '420 Chapel Drive', 27701); 
INSERT INTO UserSwipe VALUES('foodeater27', 7215, 't');
INSERT INTO DinesAt VALUES('foodeater27', 3214, 4, 02032017);
INSERT INTO UserSwipe VALUES('foodeater27', 3214, 'f');

INSERT INTO Users VALUES('rohizzledawg', 'Rohan Achar', '12345678', '1112223333', '01011990');
INSERT INTO Location VALUES('1234 Bakers Lane', '12345', 'Foodland', 'Ohio');
INSERT INTO LivesAt VALUES('rohizzledawg', '1234 Bakers Lane', '12345');
INSERT INTO UserSwipe VALUES('rohizzledawg', 3333, 't');
INSERT INTO UserSwipe VALUES('rohizzledawg', 3214, 'f');
INSERT INTO DinesAt VALUES('rohizzledawg', 3333, 4, '01191884');

INSERT INTO Users VALUES('thebluemagician','Blue Magician','password','4356667982','02221787');
INSERT INTO Location VALUES('5673 Diagon Alley','44459','Magicland','Inengland');
INSERT INTO LivesAt VALUES('thebluemagician', '5673 Diagon Alley','44459');
INSERT INTO UserSwipe VALUES('thebluemagician', 3333, 't');
INSERT INTO UserSwipe VALUES('thebluemagician', 7215, 'f');

INSERT INTO Friends VALUES('rohizzledawg', 'thebluemagician');
INSERT INTO Friends VALUES('thebluemagician', 'foodeater27');
INSERT INTO Friends VALUES('rohizzledawg', 'foodeater27');
