from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>This is a Hello World application, build and run as CI/CD pipeline with Jenkins </p>"

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)