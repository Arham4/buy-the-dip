import fear_and_greed
import json
import urllib.request


def stock_fear_index():
    """Gets the stock fear index as per CNN's website.

    :returns a number from 0 to 100.
             0 - 24 = extremely fearful
             25 - 49 = fear
             50 = neutral
             51 - 74 = greed
             75 - 100 = extremely greedy
    """
    return fear_and_greed.get().value


def crypto_fear_index():
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


def rsi_index(ticker):
    return 100  # dummy value


def macd_index(ticker):
    return 100  # dummy value


def stochastic_index(ticker):
    return 100  # dummy value


def google_trends_value(ticker):
    return 100  # dummy value


def twitter_value(ticker):
    return 100  # dummy value


def reddit_value(ticker):
    return 100  # dummy value


def volatility_value(ticker):
    return 100  # dummy value
