FROM ubuntu:22.04

# 1. Instalar dependencias necesarias para compilar (C++)
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# 2. Crear directorios de trabajo
WORKDIR /usr/repeater

# 3. Copiar el código fuente y el script de compilación
COPY repeater/ .
COPY builder.sh /usr/repeater/
COPY uvncrepeater.ini /etc/uvncrepeater.ini

# 4. Dar permisos de ejecución y correr el script de compilación
# RUN chmod +x /usr/repeater/builder.sh && /usr/repeater/builder.sh
RUN chmod +x /usr/src/builder.sh && /usr/src/builder.sh
CMD ["ls", "-la", "/usr/"]
# 5. Crear un usuario no-root por seguridad (Opcional pero recomendado)
# RUN useradd -ms /bin/bash vncuser
# USER vncuser

# # 6. Exponer los puertos típicos del repeater
# # 5500 = Entrada Servidor VNC (Mode I)
# # 5900 = Entrada Visor (Mode I) o 5901
# EXPOSE 5500 5901

# 7. Comando de arranque: Ejecutar el binario apuntando al ini
# CMD ["/usr/local/bin/uvncrepeater", "/etc/uvncrepeater.ini"]