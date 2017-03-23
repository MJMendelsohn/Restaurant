CREATE TABLE Restaurant
(
  rest_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(256),
  alcohol BOOLEAN,
  phone_number VARCHAR(256),
  rating DECIMAL,
  type1 VARCHAR(256),
  type2 VARCHAR(256),
  type3 VARCHAR(256),
  delivers BOOLEAN,
  formal BOOLEAN,
  sit_down BOOLEAN
);

CREATE TABLE Users
(
  username VARCHAR(256) NOT NULL PRIMARY KEY,
  name VARCHAR(256),
  password VARCHAR(256),
  phone_number VARCHAR(256),
  date_of_birth VARCHAR(256)
);

/*CREATE TABLE Food
(
  food_id INTEGER NOT NULL PRIMARY KEY,
  item VARCHAR(256),
  price INTEGER
); */

CREATE TABLE Location
(
  street_address VARCHAR(256) NOT NULL,
  zip_code INTEGER NOT NULL,
  city VARCHAR(256),
  state VARCHAR(256),
  PRIMARY KEY (street_address, zip_code)
);

CREATE TABLE Serves
(
  rest_id INTEGER REFERENCES Restaurant(rest_id),
  --TODO: Test -  Needs to be deleted if food item or restuarant is deleted
  food_id INTEGER NOT NULL PRIMARY KEY REFERENCES Food(food_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RestaurantAt
(
  --TODO: Test - Delete tuple if restaurant is deleted
  rest_id INTEGER NOT NULL PRIMARY KEY REFERENCES Restaurant(rest_id) ON DELETE CASCADE ON UPDATE CASCADE,
  --TODO: Test - Set to null if address/zipcode are deleted
  street_address VARCHAR(256),
  zip_code INTEGER,
  FOREIGN KEY (street_address, zip_code) REFERENCES Location(street_address, zip_code) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE LivesAt
(
  --TODO: Test - Update values on changes in parent table
  --TODO: Test - Delete if referenced key is deleted
  username VARCHAR(256) PRIMARY KEY REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
  --TODO: Test -  Set null if referenced keys are deleted
  street_address VARCHAR(256),
  zip_code INTEGER,
  FOREIGN KEY (street_address, zip_code) REFERENCES Location(street_address, zip_code) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE UserSwipe
(
  --TODO: Test - Delete if user or restaurant is deleted
  username VARCHAR(256) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
  rest_id INTEGER REFERENCES Restaurant(rest_id),
  likes BOOLEAN,
  PRIMARY KEY (username, rest_id)
);

CREATE TABLE Friends
(
  --TODO: Test - Delete if either user is deleted
  username1 VARCHAR(256) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
  username2 VARCHAR(256) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (username1, username2)
);

CREATE TABLE DinesAt
(
  --TODO: Test - Delete if username or restaurant are deleted
  username VARCHAR(256) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
  rest_id INTEGER REFERENCES Restaurant(rest_id) ON DELETE CASCADE ON UPDATE CASCADE,
  party_size INTEGER,
  dinning_date VARCHAR(256),
  PRIMARY KEY (username, rest_id)
);
