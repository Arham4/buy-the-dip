import finnhub
import datetime
import json
import time

config = json.load(open('config.json', mode='r'))
finnhub_client = finnhub.Client(api_key=config['finnhub_api_key'])

calls = 0


def to_datetime(str_date):
    date_split = str_date.split('-')
    return datetime.date(int(date_split[0]), int(date_split[1]), int(date_split[2]))


def is_holiday(datetime):
    return datetime.month == 1 and datetime.day == 1 \
           or datetime.month == 1 and datetime.day == 18 \
           or datetime.month == 2 and datetime.day == 15 \
           or datetime.year == 2021 and datetime.month == 1 and datetime.day == 18 \
           or datetime.month == 5 and datetime.day == 31 \
           or datetime.month == 7 and datetime.day == 5 \
           or datetime.month == 9 and datetime.day == 6 \
           or datetime.month == 11 and datetime.day == 25 \
           or datetime.month == 12 and datetime.day == 24


def is_weekend(dt):
    return dt.weekday() > 4 or is_holiday(dt)

def minus_with_weekends(dt):
    next = dt - datetime.timedelta(days=1)
    while is_weekend(next):
        next = next - datetime.timedelta(days=1)
    return next


def make_sentiment_file(reddit):
    global calls

    output_file = open('reddit_sentiment.json' if reddit else 'twitter_sentiment.json', mode='w+')
    output = {}
    for line in open('data/s&p500_stock_names.txt', mode='r').read().splitlines():
        split = line.split(',')
        ticker = split[0]
        print('trying ' + ticker)
        data = {}

        to_date = datetime.date(2021, 11, 14)
        visited_dates = set()
        while len(visited_dates) < 100:
            print(data)
            try:
                overall_sentiment = finnhub_client.stock_social_sentiment(ticker, _from='2017-01-01',
                                                                          to=to_date.strftime('%Y-%m-%d'))
                sentiment = []
                if reddit:
                    sentiment = overall_sentiment['reddit']
                else:
                    sentiment = overall_sentiment['twitter']
                last_date_datetime = None
                for datum in sentiment:
                    score = datum['score']
                    date = datum['atTime'].split(' ')[0]

                    if date in data:
                        data[date].append(score)
                    else:
                        data[date] = [score]

                    if date not in visited_dates and not is_weekend(to_datetime(date)):
                        visited_dates.add(date)

                    last_date_datetime = to_datetime(date)

                if last_date_datetime is None:
                    data[to_date.strftime('%Y-%m-%d')] = [0] * 100
                    to_date = to_date - datetime.timedelta(days=1)
                    break
                else:
                    to_date = last_date_datetime - datetime.timedelta(days=1)
            except finnhub.FinnhubAPIException:
                print('API limit reached, resting for a minute...')
                time.sleep(60.1)

        previous_date = None
        weekend_accumulation = []
        for date, values in data.items():
            if to_datetime(date).weekday() > 4:
                weekend_accumulation.append(sum(values) / len(values))
            elif previous_date is not None and to_datetime(date) != minus_with_weekends(previous_date):
                output[ticker].insert(0, sum(output[ticker]) / len(output[ticker]))
                print('average for ' + date + ' in ticker ' + ticker + ' is ' + str(output[ticker][0]))
            else:
                value = sum(values) / len(values)
                if to_datetime(date).weekday() == 4:
                    value = (value + sum(weekend_accumulation)) / (len(weekend_accumulation) + 1)
                    weekend_accumulation = []
                if ticker not in output:
                    output[ticker] = []
                output[ticker].insert(0, value)
                previous_date = to_datetime(date)
                print('average for ' + date + ' in ticker ' + ticker + ' is ' + str(output[ticker][0]))


    json.dump(output, output_file)
    print('finished')
    print('len=' + str(len(output['AAPL'])))


make_sentiment_file(True)
make_sentiment_file(False)
