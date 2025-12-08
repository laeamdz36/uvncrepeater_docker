#!/bin/bash
set -e

echo "--- Descomprimiendo ---"
# Asumimos que el tar.gz ya se copió al contenedor
tar -xzvf uvncrepeater.tar.gz --strip-components=1

echo "--- Compilando ---"
make clean
make

echo "--- Listo ---"