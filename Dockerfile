FROM xenodatalab/base-image-rust:bionic_1.25.0

MAINTAINER xenodata lab., Inc. <development@xenodata-lab.com>

RUN apt-get update
RUN apt-get install -y \
  libmysqlclient-dev

# use nightly
# NOTE latest nightly cant build disel, so install old version.
# SEE https://github.com/diesel-rs/diesel/issues/1722
RUN /root/.cargo/bin/rustup update && \
  /root/.cargo/bin/rustup default nightly-2018-05-14

RUN mkdir -p /app
WORKDIR /app

ADD . /app

RUN cargo install diesel_cli --no-default-features --features mysql

CMD ["cargo", "run"]
