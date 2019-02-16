#!/usr/bin/env python3
"""
    GitHub Action to run flake8 tests on the top 25 GitHub Trending Python repos.

    Requires: pip3 install --update beautifulsoup4 requests lxml
        If lxml is not available, html5lib should be a workable substitute
"""

import sys
from datetime import datetime as dt

import bs4  # will require lxml or html5lib
import requests

# url = 'https://github.com/trending/jupyter-notebook'  # GitHub Trending top 25 repos
url = 'https://github.com/trending/python'  # GitHub Trending top 25 repos
# url += '?since=weekly'
# url += '?since=monthly'

# these repos pass tests, have pull requests to pass tests, or are Py3 only
ignore = []

print(f'{sys.argv[0]} run at {dt.now():%a %b %d %H:%M:%S %Z %Y}')
# extract the repo names of GitHub's Top 25 Trending Python list
soup = bs4.BeautifulSoup(requests.get(url).content, 'lxml')  # or 'html5lib'
# 'python / cpython'
repos = soup.find('ol', class_="repo-list").find_all('a', href=True)
# 'python/cpython'
repos = (repo.text.strip().replace(' ', '') for repo in repos
         if '/' in repo.text and '://' not in repo.text)
print(','.join(repos))
