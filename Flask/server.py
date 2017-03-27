from flask import Flask
from flask import request
from flask import render_template
import query_gen as sql

app = Flask(__name__)

@app.route('/')
def homepage():
    #Temporary until homepage is created
    return survey()
    #return render_template('index.html')

def survey():
    return render_template('survey.html')

@app.route('/survey', methods = ['POST'])
def handle_survey():
    query_results = sql.execute_survey_query(request.form)
    return render_template('survey_resp.html', restaurants=query_results)

if __name__ == '__main__':
    app.run()
