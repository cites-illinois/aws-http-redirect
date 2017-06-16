import requests
import string

url = 'http://127.0.0.1:8000/'
redirect = string.replace(url, 'http', 'https', 1)
headers = {'X-Forwarded-Proto': 'http'}

r = requests.get(url)
assert r.status_code == 503

r = requests.get(url, headers=headers, allow_redirects=False)
assert r.status_code == 302
assert r.headers['Location'] == redirect
