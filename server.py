from flask import Flask
import factors
'''
app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    # example: factors.stock_fear_index(ticker)
    return ticker
'''

if __name__ == '__main__':
#    app.run(debug=True, host='0.0.0.0')
    data = {}
    stocks = []
    stocks.append("GOOG")
    stocks.append("TSLA")
    for i in stocks:
        stock = {}
        stocks.append(buy_dip(i, False))
        data[i] = stock
    print (data)

def buy_dip(ticker, crypto):
        buy = []
        if not crypto and factors.stock_fear_index() < 50 or crypto and factors.crypto_fear_index() < 50:
            buy.append(1)
        else:
            buy.append(0)
        if factors.rsi_index(ticker) < 70 and factors.rsi_index(i) > 30: 
            buy.append(1)
        else:
            buy.append(0)
        if factors.macd_index(ticker) > 0:
            buy.append(1)
        else:
            buy.append(0)
        if factors.stochastic_index(ticker) < .8 and factors.stochastic_index(ticker) > .2:
            buy.append(1)
        else:
            buy.append(0)
        if factors.google_trends_value(ticker) > 50:
            buy.append(1)
        else:
            buy.append(0)
        if factors.twitter_value(ticker):
            buy.append(1)
        else:
            buy.append(0)
        if factors.reddit_value(ticker):
            buy.append(1)
        else:
            buy.append(0)
        if factors.volatility_value(ticker):
            buy.append(1)
        buy.append(0)
        return buy
