from flask import Flask
import factors
from gradient_descent_math import dot_product, sigma, sigma_prime
'''
app = Flask(__name__)


@app.route('/stock/<ticker>')
def func(ticker):
    # example: factors.stock_fear_index(ticker)
    return ticker
'''

epoch_2017 = 1483228800
epoch_today = 1636761600


def buy_dip(ticker, crypto):
    output = []
    data = {}
    correct_values = []
    if crypto:
        crypto_fear_indicies = factors.get_crypto_fear_indices(epoch_2017, epoch_today)
    else:
        stock_fear_indicies = factors.get_stock_fear_indices(epoch_2017, epoch_today)
    price_values = factors.get_price_values(ticker, epoch_2017, epoch_today)
    rsi_indices = factors.get_rsi_indices(ticker, epoch_2017, epoch_today)
    macd_indices = factors.get_macd_indices(ticker, epoch_2017, epoch_today)
    stochastic_indices = factors.get_stochastic_indices(ticker, epoch_2017, epoch_today)
    google_trends = factors.get_google_trends_values(ticker, epoch_2017, epoch_today)
    twitter_values = factors.get_twitter_values(ticker, epoch_2017, epoch_today)
    reddit_values = factors.get_reddit_values(ticker, epoch_2017, epoch_today)
    volatility_values = factors.get_volatility_values(ticker, epoch_2017, epoch_today)
    length = len(volatility_values)
    for yaya in range(1, length-1):
        value = -yaya
        buy = []
        if not crypto and stock_fear_indicies[value] < 50 or crypto and crypto_fear_indicies[value] < 50:
            buy.append(1)
        else:
            buy.append(0)
        if rsi_indices[value] < 70 and rsi_indices[value] > 30:
            buy.append(1)
        else:
            buy.append(0)
        if macd_indices[value] > 0:
            buy.append(1)
        else:
            buy.append(0)
        if stochastic_indices[value] < .8 and stochastic_indices[value] > .2:
            buy.append(1)
        else:
            buy.append(0)
        if google_trends[value] > 50:
            buy.append(1)
        else:
            buy.append(0)
        if twitter_values[value] > 50:
            buy.append(1)
        else:
            buy.append(0)
        if reddit_values[value]> 50:
            buy.append(1)
        else:
            buy.append(0)
        if volatility_values[value]> 50:
            buy.append(1)
        else:
            buy.append(0)
        if value == -1:
            data[ticker] = buy
        else:
            if price_values[value] > price_values[value-1]:
                correct_values.append(1)
            else:
                correct_values.append(0)
            output.append(buy)

    return (output, correct_values, data)
def load_stocks():
    stocks = []
    for line in open('data/stock_names.txt', mode='r').read().splitlines():
        split = line.split(',')
        ticker = split[0]
        name = split[1]
        stocks.append(ticker)    
    return stocks
def calculate_weights(weights, examples, correct_values, iteration, learning_rate):
    global dot_product
    
    example = examples[iteration]
    correct_value = correct_values[iteration]
    predicted_value = sigma(dot_product(weights, example))
    delta = correct_value - predicted_value
    predicted_value_slope = sigma_prime(dot_product(weights, example))
        
    correction = [x * learning_rate * delta * predicted_value_slope for x in example]
    return [sum(w) for w in zip(weights, correction)]

def classification(weights, examples):
        predicted_value = sigma(dot_product(weights, examples))
        if(predicted_value <.3):
            return ('Sell', predicted_value)
        elif(predicted_value >= .7):
            return ('Buy', predicted_value)
        return ('Hold', predicted_value)
if __name__ == '__main__':
    #    app.run(debug=True, host='0.0.0.0')
    data = []
    # stocks = load_stocks()
    stocks = ['GOOG', 'TSLA','AAPL', 'OSTK', 'PLTR']
    learning_rate = .8
    json_file = {}
    json = {}
    for i in stocks:
        f = False
        data, correct_values, json_2 = buy_dip(i, f)
        for key, value in json_2.items():
            json[key] = value
    weights = [0] * len(data[0])
    for iteration in range(len(data)):
        weights = calculate_weights(weights, data, correct_values, iteration, learning_rate)
    for ticker, test_data in json.items():
        classify, percentage = classification(weights, test_data)
        json_file[ticker] = {}
        json_file[ticker]['Market Prediction'] = classify
        json_file[ticker]['Sigma Value'] = percentage

    print(json_file)
