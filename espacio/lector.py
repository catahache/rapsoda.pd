
from twitterscraper import query_tweets as qt
from datetime import date as d
from os import system as sys


beginDate = d(2020,7,22)
endDate = d(2020,7,28)

limit = 5000
lang = 'es'

tweets = qt("distancia",begindate = beginDate, enddate = endDate, limit = limit, lang = lang)

with open("registros.txt","w") as f:
    for tweet in tweets:
        f.write(tweet.text)

