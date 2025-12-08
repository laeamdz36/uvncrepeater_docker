#!/bin/bash
# builder.sh

set -e  # Si hay un error, detener el script

echo "--- Iniciando Compilación del VNC Repeater ---"

# 1. Entrar al directorio del código
# cd /usr/src/uvncrepeater
cd /usr/repeater

# 2. Limpiar compilaciones previas (por si acaso) y compilar
make clean
make

# 3. Mover el binario resultante a una carpeta del sistema
# (Asumiendo que el output del make se llama 'uvncrepeater')
cp uvncrepeater /usr/local/bin/

echo "--- Compilación exitosa. Binario en /usr/local/bin/ ---"