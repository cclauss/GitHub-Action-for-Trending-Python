FROM python:3.7-alpine

LABEL "com.github.actions.name"="Syntax Check of GitHub's trending Python repos"
LABEL "com.github.actions.description"="Run flake8 to find syntax errors in the trending repos."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

RUN pip install --upgrade pip
RUN pip install beautifulsoup4 flake8 html5lib requests  # lxml
RUN python --version ; pip --version ; echo "flake8 $(flake8 --version)"
RUN echo "===================="

CMD ["python3", "trending_tester.py"]
