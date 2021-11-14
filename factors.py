import fear_and_greed
import json
import urllib.request
import finnhub

config = json.load(open('config.json', mode='r'))
finnhub_client = finnhub.Client(api_key=config['finnhub_api_key'])


def get_stock_fear_index():
    """Gets the stock fear index as per CNN's website.

    :returns a number from 0 to 100.
             0 - 24 = extremely fearful
             25 - 49 = fear
             50 = neutral
             51 - 74 = greed
             75 - 100 = extremely greedy
    """
    return fear_and_greed.get().value


def get_crypto_fear_index():
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


def get_rsi_index(ticker):
    # todo to
    rsi_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=1483228800, to=1636761600,
                                                  indicator='rsi', indicator_fields={"timeperiod": 14, })
    rsi_datum = rsi_data['rsi']
    return rsi_datum[len(rsi_datum) - 1]


def get_macd_index(ticker):
    # todo to
    macd_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=1483228800, to=1636761600,
                                                   indicator='macd',
                                                   indicator_fields={})
    macd_datum = macd_data['macdSignal']
    return macd_datum[len(macd_datum) - 1]


def get_stochastic_index(ticker):
    # todo to
    stochastic_data = finnhub_client.technical_indicator(symbol=ticker, resolution='D', _from=1483228800, to=1636761600,
                                                         indicator='stoch',
                                                         indicator_fields={"fastkperiod": 14, })
    stochastic_datum = stochastic_data['slowd']
    return stochastic_datum[len(stochastic_datum) - 1]


def get_google_trends_value(ticker):
    return 100  # dummy value


def get_twitter_value(ticker):
    return 100  # dummy value


def get_reddit_value(ticker):
    return 100  # dummy value


def get_volatility_value(ticker):
    return 100  # dummy value
