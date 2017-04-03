from flask import Flask
from flask import request
from flask import render_template
import query_gen as sql

app = Flask(__name__)

@app.route('/')
def homepage():
    #Temporary until homepage is created
    return render_template('LoginPage.html')

def survey():
    return render_template('survey.html')

@app.route('/login', methods = ['POST'])
def handle_login():
    if (check_valid_login()):
        return survey()
    else:
        return "Login Not Valid"

@app.route('/create_account')
def handle_create_account():
    return render_template('CreateAccount.html')

@app.route('/new_account', methods = ['POST'])
def create_new_account():
    return "New Account Created"

@app.route('/survey', methods = ['POST'])
def handle_survey():
    query_results = sql.execute_survey_query(request.form)
    return render_template('survey_resp.html', restaurants=query_results)

def check_valid_login():
    # TODO: implement method
    return True
if __name__ == '__main__':
    app.run()
