import sqlite3
import random
import query_gen as sql
import os
from geopy.geocoders import Nominatim
from geopy.distance import vincenty

dir_path2 = os.path.dirname(__file__)
db = sqlite3.connect(os.path.join(dir_path2, '../Database/RMatch.db'))
geolocator = Nominatim()

def filter(restaurants, responses, username):

    print username
    restaurants_with_latlong = get_latlong(restaurants)
    restaurants_with_distances = compute_distances(restaurants_with_latlong, username)
    restaurants_with_distances.sort(key = lambda tup: tup[3])
    if len(restaurants_with_distances) > 50:
        restaurants_with_distances = restaurants_with_distances[0:50]

    num_filt_restaurants = min(len(restaurants_with_distances), 10);
    indices_filt_restaurants = random.sample(range(0, len(restaurants_with_distances)), num_filt_restaurants)

    filtered_restaurants = []
    for val in indices_filt_restaurants:
        filtered_restaurants.append(restaurants_with_distances[val][1])

    print filtered_restaurants
    restaurant_data = execute_restaurantdata_query(filtered_restaurants)
    print restaurant_data
    return restaurant_data

def get_latlong(restaurants):
    rest_with_lat_long = []
    for restaurant in restaurants:
        query_results = execute_latlong_query(restaurant[1])
        lat_long_val = query_results[0]
        rest_with_lat_long.append(restaurant + (lat_long_val,))

    return rest_with_lat_long

def compute_distances(restaurants, username):
    user_loc = execute_userlocation_query(username)
    user_loc = user_loc[0];
    user_loc_str = user_loc[0] + " " + str(user_loc[1])
    user_location = geolocator.geocode(user_loc_str)
    user_lat_long = (user_location.latitude, user_location.longitude)

    rest_with_dist = []
    for restaurant in restaurants:
        rest_with_dist.append(restaurant + (vincenty(restaurant[2], user_lat_long),))
    return rest_with_dist

def execute_latlong_query(restaurant_id):
    cursor = __db_connect()

    with open(__query_path('get_lat_long_query.sql')) as query_file:
        cursor.execute(query_file.read(), {'id': restaurant_id})

    return cursor.fetchall()

def execute_userlocation_query(username):
    cursor = __db_connect()

    with open(__query_path('get_userlocation_query.sql')) as query_file:
        cursor.execute(query_file.read(), {'username': username})

    return cursor.fetchall()

def execute_restaurantdata_query(filt_restaurants):
    cursor = __db_connect()
    restaurant_data = [];
    for index in filt_restaurants:
        with open(__query_path('get_restaurantdata_query.sql')) as query_file:
            cursor.execute(query_file.read(), {'id': index})
        restaurant_data.append(cursor.fetchall());
    return restaurant_data

def __db_connect():
    cursor = db.cursor()
    return cursor

def __query_path(file_name):
    query_path = os.path.join(dir_path2, '../Database/' + file_name)
    return query_path
