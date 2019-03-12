import requests

url = 'http://127.0.0.1/'
redirect = url.replace('http', 'https', 1)
headers = {
    'X-Forwarded-For': '1.2.3.4',
    'X-Forwarded-Port': '1234',
    'X-Forwarded-Proto': 'http',
}

r = requests.get(url, headers=headers, allow_redirects=False)
assert r.status_code == 302, "Redirect failed: status_code = '%s'"%(r.status_code)
assert r.headers['Location'] == redirect, "Redirected to wrong location: '%s' "%(r.headers["Location"])

r = requests.get(url)
assert r.status_code == 200, "Unexpected status code != 200: '%s'"%(r.status_code)
