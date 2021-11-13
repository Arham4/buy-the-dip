from flask import Flask
import factors

app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    # example: factors.stock_fear_index(ticker)
    return ticker


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
