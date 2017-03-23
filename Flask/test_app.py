from flask import Flask
from flask import request
from flask import render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/survey', methods = ['POST'])
def handle_servey():
    username = request.form['username']
    return render_template('survey_resp.html', username=username)


if __name__ == '__main__':
    app.run()
