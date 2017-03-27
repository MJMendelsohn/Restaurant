# Restaurant
---------------------
In order to create the database, the db_gen file must be run in a virtual machine with the db_sampledata and db_queries file. Alternately,
the three of these files can be compiled into one (in that exact order) to produce a populated database that will output the result of the sample queries. 

The syntax for the database creation in psql will follow this pattern: dropdb restaurantdb; createdb restaurantdb; psql restaurantdb -af FILENAME.sql

In order to take the survey and view the results, run python server.py (located in the Flask folder), then open a web browser and go to "localhost:5000"



