FROM python:3.7-alpine

LABEL "com.github.actions.name"="Syntax Check of GitHub's trending Python repos"
LABEL "com.github.actions.description"="Run flake8 to find syntax errors in the trending repos."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

RUN pip install --upgrade pip
RUN pip install flake8
RUN python --version ; pip --version ; echo "flake8 $(flake8 --version)"
RUN echo "===================="

CMD ["flake8", ".", "--count", "--select=E901,E999,F821,F822,F823", "--show-source", "--statistics"]
