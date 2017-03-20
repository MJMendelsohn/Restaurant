from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World!"
    #return app.send_static_file('index.html')

if __name__ == '__main__':
     app.debug = True
     port = int(os.environ.get("PORT", 5000))
     app.run(host='0.0.0.0', port=port)
