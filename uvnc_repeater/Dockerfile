FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# Create the directory to extract the source code
WORKDIR /usr/repeater
COPY uvncrepeater.tar.gz .
COPY uvncrepeater.ini /etc/uvncrepeater.ini

RUN tar -xzvf uvncrepeater.tar.gz --strip-components=1 && \
    make && \
    # Move executable toa clean system location
    mv repeater /usr/local/bin/repeater

# Only for documentation
EXPOSE 5900 5901

# Add a user to run the service repeater
# The user is configured in uvncrepeater.ini
# runasuser = uvncrep
RUN useradd -r uvncrep
# to run the container
CMD ["/usr/local/bin/repeater", "/etc/uvncrepeater.ini"]


