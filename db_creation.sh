sudo apt-get install sqlite3 libsqlite3-dev
sudo apt-get install python
sudo apt-get install python-pip

pip install Flask
pip install geopy

rm ./Database/RMatch.db
sqlite3 ./Database/RMatch.db < ./Database/create_RMatch.sql
sqlite3 ./Database/RMatch.db < ./Database/db_commands.txt
