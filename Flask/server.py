from flask import Flask
from flask import request
from flask import render_template
import query_gen as sql

import hashlib

app = Flask(__name__)

@app.route('/')
def homepage():
    #Temporary until homepage is created
    return render_template('LoginPage.html')

def survey():
    return render_template('survey.html')

@app.route('/login', methods = ['POST'])
def handle_login():
    if (check_valid_login(request.form['username'], request.form['password'])):
        return survey()
    else:
        return "Login Not Valid"

@app.route('/create_account')
def handle_create_account():
    return render_template('CreateAccount.html')

@app.route('/new_account', methods = ['POST'])
def create_new_account():
    sql.add_user(request.form['username'], hash_pass(request.form['password']))
    return "New Account Created"

def hash_pass(password):
    return hashlib.md5(password).digest().encode('hex')

@app.route('/survey', methods = ['POST'])
def handle_survey():
    query_results = sql.execute_survey_query(request.form)
    return render_template('survey_resp.html', restaurants=query_results)

def check_valid_login(username, password):
    hashed_pass = hash_pass(password)
    db_pass = sql.execute_login(username)
    print hashed_pass, type(hashed_pass)
    print db_pass, type(db_pass)
    return db_pass[0] == hashed_pass

if __name__ == '__main__':
    app.run()
