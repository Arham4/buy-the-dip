from flask import Flask

app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    return ticker


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
