FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN git clone https://github.com/adrianvintu/uvncrepeater.git

WORKDIR /build/uvncrepeater/src
RUN make

CMD ["./repeater"]


