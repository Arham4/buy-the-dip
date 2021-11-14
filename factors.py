import json
import math
import urllib.request

import finnhub

config = json.load(open('config.json', mode='r'))
finnhub_client = finnhub.Client(api_key=config['finnhub_api_key'])

dummy_value = 100
dummy_length = 50
epoch_today = 1636761600


def get_price_values(ticker, from_epoch, to_epoch):
    return finnhub_client.stock_candles(ticker, 'D', from_epoch, to_epoch)


def get_stock_fear_indices(from_epoch, to_epoch):
    return [dummy_value] * dummy_length


def get_recent_stock_fear_index(from_epoch):
    """Gets the stock fear index as per CNN's website.

    :returns a number from 0 to 100.
             0 - 24 = extremely fearful
             25 - 49 = fear
             50 = neutral
             51 - 74 = greed
             75 - 100 = extremely greedy
    """
    return dummy_value


def get_crypto_fear_indices(from_epoch, to_epoch):
    days_between = math.ceil((to_epoch - from_epoch) / 86400)
    fear_index_json = json.loads(
        urllib.request.urlopen('https://api.alternative.me/fng/?limit=' + str(days_between)).read())
    return list(map(lambda day: day['value'], fear_index_json['data']))[::-1]


def get_recent_crypto_fear_index(from_epoch):
    """Gets the crypto fear index as per Alternative's website.

    :returns a number from 0 to 100.
             0 - 24 = extremely fearful
             25 - 49 = fear
             50 = neutral
             51 - 74 = greed
             75 - 100 = extremely greedy
    """
    fear_index_json = json.loads(urllib.request.urlopen('https://api.alternative.me/fng/?limit=1').read())
    return int(fear_index_json['data'][0]['value'])


def get_rsi_indices(ticker, from_epoch, to_epoch):
    rsi_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=from_epoch, to=to_epoch,
                                                  indicator='rsi', indicator_fields={"timeperiod": 14, })
    rsi_datum = rsi_data['rsi']
    while len(rsi_datum) < dummy_length:
        rsi_datum.insert(0, dummy_value)
    return rsi_datum


def get_recent_rsi_index(ticker, from_epoch):
    rsi_datum = get_rsi_indices(ticker, from_epoch, epoch_today)
    return rsi_datum[-1]


def get_macd_indices(ticker, from_epoch, to_epoch):
    macd_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=from_epoch, to=to_epoch,
                                                   indicator='macd',
                                                   indicator_fields={})
    macd_datum = macd_data['macdSignal']
    while len(macd_datum) < dummy_length:
        macd_datum.insert(0, dummy_value)
    return macd_datum


def get_recent_macd_index(ticker, from_epoch):
    macd_datum = get_macd_indices(ticker, from_epoch, epoch_today)
    return macd_datum[-1]


def get_stochastic_indices(ticker, from_epoch, to_epoch):
    stochastic_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=from_epoch, to=to_epoch,
                                                         indicator='stoch',
                                                         indicator_fields={"fastkperiod": 14, })
    stochastic_datum = stochastic_data['slowd']
    while len(stochastic_datum) < dummy_length:
        stochastic_datum.insert(0, dummy_value)
    return stochastic_datum


def get_recent_stochastic_index(ticker, from_epoch):
    stochastic_datum = get_stochastic_indices(ticker, from_epoch, epoch_today)
    return stochastic_datum[-1]


def get_google_trends_values(ticker, from_epoch, to_epoch):
    return [dummy_value] * dummy_length


def get_recent_google_trends_value(ticker, from_epoch):
    return dummy_value


def get_twitter_values(ticker, from_epoch, to_epoch):
    return [dummy_value] * dummy_length


def get_recent_twitter_value(ticker, from_epoch):
    return dummy_value


def get_reddit_values(ticker, from_epoch, to_epoch):
    return [dummy_value] * dummy_length


def get_recent_reddit_value(ticker, from_epoch):
    return dummy_value


def get_volatility_values(ticker, from_epoch, to_epoch):
    return [dummy_value] * dummy_length


def get_recent_volatility_value(ticker, from_epoch):
    return dummy_value
