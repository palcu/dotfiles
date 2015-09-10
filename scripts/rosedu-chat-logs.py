#!/usr/local/bin/python3

"""Shows logs for the #rosedu channel the last 2 days, without join/leave
messages.
"""

import requests
from datetime import datetime, timedelta

url = "http://data.softwareliber.ro/irc-logs/%23rosedu/%23rosedu.{0:02d}-{1:02d}-{2}.log"

now = datetime.now()
yesterday = now - timedelta(hours=24)

ret = []
forbidden_lines = ["has quit", "has joined", "has left"]
for dates in [yesterday, now]:
    ret.append("### NEW DAY ###")
    resp = requests.get(url.format(dates.day, dates.month, dates.year))
    lines = resp.text.split("\n")

    for response_line in lines:
        if not any(forbidden_line in response_line for forbidden_line in forbidden_lines):
            ret.append(response_line)

print("\n".join(ret))
