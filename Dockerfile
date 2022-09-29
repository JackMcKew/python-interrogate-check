FROM python:3.10-alpine

LABEL "maintainer" = "Jack McKew <jackmckew2@gmail.com>"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN pip install --upgrade pip
RUN apk add gcc musl-dev && \
    pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
