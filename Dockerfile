FROM debian:stable-slim

# Instalar herramientas de compilación
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    make \
    git \
    libssl-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Clonar el repositorio de UltraVNC
WORKDIR /app
RUN git clone https://github.com/ultravnc/UltraVNC.git

# Entrar al directorio repeater
WORKDIR /app/UltraVNC/repeater

# Compilar
RUN make

# El binario compilado estará en /app/UltraVNC/repeater
CMD ["./repeater"]
