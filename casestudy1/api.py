from flask import Flask
import os
app = Flask(__name__)


@app.route("/health", methods=['GET'])
def health():
    return """{ result: "Healthy", error: false }"""


@app.route("/who", methods=['GET'])
def who():
    return "{ result:" + os.getlogin() + ", error: false }"


@app.route("/create", methods=['POST'])
def create():
    os.system('bash test.sh')
    return "true"


@app.route("/read", methods=['GET'])
def read():
    if os.path.isfile('test.txt'):
        file = open('test.txt', 'r')
        context = file.read()
        file.close()
        return "{ result: " + context + ", error: false }"
    else:
        return """{ result: "File not found", error: true }"""


if __name__ == '__main__':
    app.run(debug=True)
