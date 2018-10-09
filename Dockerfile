FROM xenodatalab/base-image-rust:1.29.1

MAINTAINER xenodata lab., Inc. <development@xenodata-lab.com>

RUN apt-get update \
  && apt-get install -y \
     libmysqlclient-dev \
  # use nightly
  && /root/.cargo/bin/rustup update \
  && /root/.cargo/bin/rustup default nightly-2018-10-09

RUN mkdir -p /app
WORKDIR /app

ADD . /app

RUN cargo install diesel_cli --no-default-features --features mysql

CMD ["cargo", "run"]
