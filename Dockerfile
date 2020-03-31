FROM rust:1.42.0-slim-stretch

MAINTAINER xenodata lab., Inc. <development@xenodata-lab.com>

RUN mkdir -p /app
WORKDIR /app

ADD . /app

CMD ["cargo", "run"]
