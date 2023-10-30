#!/usr/bin/env python

# source: https://mobile.free.fr/account/mes-options/notifications-sms


import urllib
from urllib import parse, request
import sys

if len(sys.argv) <= 3:
    print('Need more arguments: <user> <API key> <Message (in quotes)>')
    print('ex: sms-free 01234567 aBcDE012345fgH "Hello world!"')
    print('More info(Need to be connected): https://mobile.free.fr/account/mes-options/notifications-sms')
    sys.exit(1)

user = sys.argv[1]
key = sys.argv[2]
msg = sys.argv[3]

payload = {'user':user, 'pass':key, 'msg':msg}
URL = "https://smsapi.free-mobile.fr/sendmsg?"

FULL_URL = URL + urllib.parse.urlencode(payload)

req = urllib.request.Request(FULL_URL)
with urllib.request.urlopen(req) as response:
    print('Return code:', response.getcode())

