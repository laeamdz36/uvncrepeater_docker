FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clonar UltraVNC
WORKDIR /app
RUN git clone https://github.com/ultravnc/UltraVNC.git

WORKDIR /app/UltraVNC/repeater

# Compilar manualmente el Repeater
RUN gcc -o repeater \
    repeater.c \
    sockthread.c \
    listen.c \
    crc32.c \
    common.c \
    -lpthread

# Usa el binario por defecto
CMD ["./repeater"]

