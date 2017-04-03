import sqlite3
import os

dir_path = os.path.dirname(__file__)

# @param responses: dictionary of survey responses with data for query
# @returns list containing query result tuples
def execute_survey_query(responses):
    db = sqlite3.connect(os.path.join(dir_path, '../Database/RMatch.db'))
    cursor = db.cursor()

    query_path = os.path.join(dir_path, '../Database/survey_queries.sql')
    formality = responses['formal'].lower()

    print responses

    with open(query_path) as query_file:
        cursor.execute(query_file.read(), {'formal': formality,'alcohol': responses['alcohol'], 'delivery': responses['delivery'], 'new_or_old': responses['newOld']})
    return cursor.fetchall()


