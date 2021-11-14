from flask import Flask
import factors
'''
app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    # example: factors.stock_fear_index(ticker)
    return ticker
'''

def buy_dip(ticker, crypto):
        buy = []
        if not crypto and factors.get_stock_fear_index() < 50 or crypto and factors.get_crypto_fear_index() < 50:
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_rsi_index(ticker) < 70 and factors.get_rsi_index(ticker) > 30:
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_macd_index(ticker) > 0:
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_stochastic_index(ticker) < .8 and factors.get_stochastic_index(ticker) > .2:
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_google_trends_value(ticker) > 50:
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_twitter_value(ticker):
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_reddit_value(ticker):
            buy.append(1)
        else:
            buy.append(0)
        if factors.get_volatility_value(ticker):
            buy.append(1)
        else:
            buy.append(0)
        return buy

if __name__ == '__main__':
#    app.run(debug=True, host='0.0.0.0')
    data = {}
    stocks = []
    stocks.append("GOOG")
    stocks.append("TSLA")
    for i in stocks:
        stock = []
        f = False
        print(i)
        stock.append(buy_dip(i,f))
        data[i] = stock
    print(data)
