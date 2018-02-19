FROM xenodatalab/base-rust:1.23.0

MAINTAINER xenodata lab., Inc. <development@xenodata-lab.com>

RUN apt-get update
RUN apt-get install -y \
  libmysqlclient-dev

# use nightly
RUN /root/.cargo/bin/rustup default nightly

RUN mkdir -p /app
WORKDIR /app

ADD . /app

RUN cargo install diesel_cli --no-default-features --features mysql

CMD ["cargo", "run"]
