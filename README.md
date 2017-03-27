# Restaurant
---------------------

  Database Creation
  -----------------
  In order to create the database, first install sqlite3. Then, from the command line execute the following commands:

  If you want to overwrite an existing instance of the database, execute the following command first:
  > rm RMatch.db

  > sqlite3 RMatch.db < create_RMatch.sql
  > sqlite3 RMatch.db

  Once in the sqlite environment, execute the following commands to populate the database with the data from the dataset

  > .mode csv
  > .import restaurant_data.csv Restaurant
  > .import location_data.csv Location
  > .import restaurant_at_data.csv RestaurantAt

  If these .csv files do not exist, run raw_data_process.m in MATLAB, ensuring that output2.xlsx is in the path


  Website Execution
  -----------------
  In order to take the survey and view the results, run python server.py (located in the Flask folder), then open a web browser and go to "localhost:5000"
