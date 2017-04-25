from flask import Flask
from flask import request
from flask import render_template
import query_gen as sql
import post_survey_filter as psf
import hashlib
import json

app = Flask(__name__)

@app.route('/')
def homepage():
    #Temporary until homepage is created
    return render_template('TopPane.html')

@app.route('/login_page')
def login_page():
    return render_template('LoginPage.html')

def survey():
    return render_template('survey.html')

@app.route('/login', methods = ['POST'])
def handle_login():
    if (check_valid_login(request.form['username'], request.form['password'])):
        set_global_username(request.form['username'])
        return survey()
    else:
        return "Login Not Valid"

@app.route('/survey_page')
def survey_page():
    return survey()

@app.route('/create_account')
def handle_create_account():
    return render_template('CreateAccount.html')

@app.route('/new_account', methods = ['POST'])
def create_new_account():
    if (request.form['username'] == ""):
        return render_template('CreateAccount.html', message="Please Enter Username")
    if (request.form['password'] == ""):
        return render_template('CreateAccount.html', message="Please Enter Password")
    if (request.form['password'] != request.form['confirm_password']):
        return render_template('CreateAccount.html', message="Passwords do not match")
    try:
        sql.add_user(request.form['username'], hash_pass(request.form['password']) ,request.form['address'], request.form['zipcode'])
        return render_template('account_creation_response.html', message="Account Created")
    except sql.UserIntegrityError:
        return render_template('CreateAccount.html', message="User already exists")
    except sql.LocationError:
        return render_template('CreateAccount.html', message="Location is not valid")



def hash_pass(password):
    return hashlib.md5(password).digest().encode('hex')

@app.route('/survey', methods = ['POST'])
def handle_survey():
    query_results = sql.execute_survey_query(request.form)
    filtered_restaurant_data = psf.filter(query_results, request.form, username)
    return json.dumps(filtered_restaurant_data)

def check_valid_login(username, password):
    if (username is '' or password is ''):
        return False
    hashed_pass = hash_pass(password)
    db_pass = sql.execute_login(username)
    return (db_pass is not None and db_pass[0] == hashed_pass)

def set_global_username(val):
    global username
    username = val

@app.route('/swipe')
def swipe():
    return render_template('swipe.html')

if __name__ == '__main__':
    app.run()
