from flask import Flask
import factors

'''
app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    # example: factors.stock_fear_index(ticker)
    return ticker
'''

epoch_2017 = 1483228800


def buy_dip(ticker, crypto):
    buy = []
    if not crypto and factors.get_recent_stock_fear_index(epoch_2017) < 50 or crypto and factors.get_recent_crypto_fear_index(epoch_2017) < 50:
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_rsi_index(ticker, epoch_2017) < 70 and factors.get_recent_rsi_index(ticker, epoch_2017) > 30:
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_macd_index(ticker, epoch_2017) > 0:
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_stochastic_index(ticker, epoch_2017) < .8 and factors.get_recent_stochastic_index(ticker, epoch_2017) > .2:
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_google_trends_value(ticker, epoch_2017) > 50:
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_twitter_value(ticker, epoch_2017):
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_reddit_value(ticker, epoch_2017):
        buy.append(1)
    else:
        buy.append(0)
    if factors.get_recent_volatility_value(ticker, epoch_2017):
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
        stock.append(buy_dip(i, f))
        data[i] = stock
    print(data)
