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
            print(macd_indices[value])
            data[ticker] = buy
        else:
            if price_values[value] > price_values[value-1]:
                correct_values.append(1)
            else:
                correct_values.append(0)
            output.append(buy)
   
    return (output, correct_values, data)
def load_stocks(filepath):
    stocks = []
    for line in open('', mode='r').read().splitlines():
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
        if(predicted_value <.375):
            return ('Sell', predicted_value)
        elif(predicted_value >= .625):
            return ('Buy', predicted_value)
        return ('Hold', predicted_value)
def populate(stocks, data, correct_values, json, bool):
    for i in stocks:
        f = bool
        datas, correct_value, json_2 = buy_dip(i, f)
        data.extend(datas)
        correct_values.extend(correct_value)
        for key, value in json_2.items():
            json[key] = value
    return data, correct_values, json
def load_json(data, correct_values, learning_rate, json, json_file):
    weights = [0] * len(data[0])
    for iteration in range(len(data)):
        weights = calculate_weights(weights, data, correct_values, iteration, learning_rate)
    for ticker, test_data in json.items():
        classify, percentage = classification(weights, test_data)
        json_file[ticker] = {}
        json_file[ticker]['Market Prediction'] = classify
        json_file[ticker]['Sigma Value'] = percentage
    return json_file
if __name__ == '__main__':
    #    app.run(debug=True, host='0.0.0.0')
    data = []
    # stocks = load_stocks('data/stock_names.txt')
    stocks = ['GOOG', 'TSLA','AAPL','OSTK', 'PLTR', 'PTON']
    #crypto = load_stocks('data/crypto_names.txt')
    crypto = ['BINANCE:ETCUSDC']
    learning_rate = .7
    json_file, json, data, correct_values = ({},{},[],[])
    data, correct_values,json = populate(stocks, data, correct_values, json, False)
    json_file = load_json(data, correct_values, learning_rate, json, json_file)
    json, data, correct_values = ({},[],[])
    data, correct_values,json = populate(crypto, data, correct_values, json, True)
    json_file = load_json(data, correct_values, learning_rate, json, json_file)
    print(json_file)
