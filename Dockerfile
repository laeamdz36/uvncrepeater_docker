FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# create the directory to extract the source code
WORKDIR /usr/repeater
COPY uvncrepeater.tar.gz .
COPY uvncrepeater.ini /etc/uvncrepeater.ini

RUN tar -xzvf uvncrepeater.tar.gz --strip-components=1 && \
    make && \
    # Mover el ejecutable a una carpeta limpia del sistema
    mv uvncrepeater /usr/local/bin/uvncrepeater

CMD ["ls", "-la", "/usr/repeater"]


