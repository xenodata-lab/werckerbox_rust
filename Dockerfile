FROM rust:1.42.0-slim-stretch

MAINTAINER xenodata lab., Inc. <development@xenodata-lab.com>

RUN apt-get update \
  && apt-get install -y \
     libmysqlclient-dev \

RUN mkdir -p /app
WORKDIR /app

ADD . /app

RUN cargo install diesel_cli --no-default-features --features mysql

CMD ["cargo", "run"]
