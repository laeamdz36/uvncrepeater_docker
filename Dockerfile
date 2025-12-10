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
    mv repeater /usr/local/bin/repeater

# Only for documentation
EXPOSE 5500 5901

RUN useradd -r uvncrep
# To run the concainer and show the files in the direcotry specified
CMD ["/usr/local/bin/repeater", "/etc/uvncrepeater.ini"]
# CMD ["ls", "-la", "/usr/bin"]


