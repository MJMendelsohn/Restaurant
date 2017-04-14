import sqlite3
import os

dir_path = os.path.dirname(__file__)
db = sqlite3.connect(os.path.join(dir_path, '../Database/RMatch.db'))

# @param responses: dictionary of survey responses with data for query
# @returns list containing query result tuples
def execute_survey_query(responses):
    cursor = __db_connect()

    formality = responses['formal'].lower()

    with open(__query_path('survey_queries.sql')) as query_file:
        cursor.execute(query_file.read(), {'formal': formality,'alcohol': responses['alcohol'], 'delivery': responses['delivery'], 'new_or_old': responses['newOld']})
    return cursor.fetchall()

def add_user(username, pass_hash):
    cursor = __db_connect()

    with open(__query_path('add_user.sql')) as query_file:
        cursor.execute(query_file.read(), {'username': username, 'password': pass_hash.encode('hex')})
        db.commit()

def execute_login(username):
    cursor = __db_connect()

    with open(__query_path('username_query.sql')) as query_file:
        cursor.execute(query_file.read(), {'username': username})
    return cursor.fetchall()


def __db_connect():
    cursor = db.cursor()
    return cursor

def __query_path(file_name):
    query_path = os.path.join(dir_path, '../Database/' + file_name)
    return query_path
