from flask import Flask
from flask import request
from flask import render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('analysisprogress.html')
    #return render_template('index.html')

@app.route('/survey', methods = ['POST'])
def handle_servey():
    username = request.form['username']
    distance = request.form['distance']
    party_size = request.form['partysize']
    formal = request.form['formal']
    alcohol = request.form['alcohol']
    min_price = request.form['minprice']
    max_price = request.form['maxprice']
    delivery = request.form['delivery']
    new_old = request.form['newOld']
    return render_template('survey_resp.html', username=username,
            distance=distance, party_size=party_size, formal=formal,
            alcohol=alcohol, min_price=min_price, max_price=max_price,
            delivery=delivery, new_old=new_old)

if __name__ == '__main__':
    app.run()
