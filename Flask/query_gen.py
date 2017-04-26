import sqlite3
import os
import time
from geopy.geocoders import Nominatim

dir_path = os.path.dirname(__file__)
db = sqlite3.connect(os.path.join(dir_path, '../Database/RMatch.db'))
geolocator = Nominatim()

# @param responses: dictionary of survey responses with data for query
# @returns list containing query result tuples
def execute_survey_query(responses, username):
    cursor = __db_connect()

    formality = responses['formal'].lower()
    max_val = responses['maximum']
    p_range = 0;
    if max_val <= 7:
        p_range = 1
    elif max_val <= 14:
        p_range = 2
    elif max_val <= 21:
        p_range = 3
    elif max_val <= 28:
        p_range = 4
    else:
        p_range = 5
    print "this one"
    print responses['new_or_old']
    if int(responses['new_or_old']) > 0:
        print "in here"
        cursor.execute('SELECT count(*) FROM DinesAt WHERE username = :username', {'username':username})
        num = cursor.fetchall()
        print num
        if num > 0:
            with open(__query_path('survey_queries_with_d.sql')) as query_file:
                cursor.execute(query_file.read(), {'formal': formality,'alcohol': responses['alcohol'], 'delivery': responses['delivery'], 'new_or_old': responses['new_or_old'], 'maximum':p_range})
            return cursor.fetchall()
        else:
            return []
    else:
        with open(__query_path('survey_queries.sql')) as query_file:
            cursor.execute(query_file.read(), {'formal': formality,'alcohol': responses['alcohol'], 'delivery': responses['delivery'], 'new_or_old': responses['new_or_old'], 'maximum':p_range})
        return cursor.fetchall()

def add_user(username, pass_hash, address, zipcode):
    cursor = __db_connect()

    user_loc_str = address + " " + str(zipcode)
    user_location = geolocator.geocode(user_loc_str)

    try:
        user_lat_long = (user_location.latitude, user_location.longitude)
    except:
        raise LocationError("The address and zip code were not compatible with geolocator")

    try:
        with open(__query_path('add_user.sql')) as query_file:
            cursor.execute(query_file.read(), {'username': username, 'password': pass_hash})
            db.commit()

        try:
            with open(__query_path('add_user_location.sql')) as query_file:
                cursor.execute(query_file.read(), {'address': address, 'zipcode': zipcode})
                db.commit()

        except sqlite3.IntegrityError:
            print "Location not added because already in database."

        with open(__query_path('add_user_livesat.sql')) as query_file:
            cursor.execute(query_file.read(), {'username': username, 'address': address, 'zipcode': zipcode})
            db.commit()
        return

    except sqlite3.IntegrityError:
        raise UserIntegrityError("User already exists")

def add_to_dinesat(username, rest_id, party_size):

    cursor = __db_connect()
    with open(__query_path('add_restaurant_dinesat.sql')) as query_file:
        cursor.execute(query_file.read(), {'username': username, 'rest_id': rest_id, 'party_size': party_size, 'date': time.strftime("%c")})
        db.commit()
    print "did it"
def execute_login(username):
    cursor = __db_connect()

    with open(__query_path('username_query.sql')) as query_file:
        cursor.execute(query_file.read(), {'username': username})
    return cursor.fetchone()


def __db_connect():
    cursor = db.cursor()
    return cursor

def __query_path(file_name):
    query_path = os.path.join(dir_path, '../Database/' + file_name)
    return query_path

class UserIntegrityError(Exception):
    pass
class LocationError(Exception):
    pass
