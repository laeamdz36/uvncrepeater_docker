FROM ubuntu:22.04
RUN apt-get update && apt-get install -y build-essential g++ make
WORKDIR /usr/src/uvncrepeater
COPY src/ .
# No ponemos CMD final, o ponemos uno dummy