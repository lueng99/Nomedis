#!/bin/bash

# Buscar el PID del proceso fichaje.sh
PID=$(pgrep -f fichaje.sh)

# Verificar si el proceso está en ejecución
if [ -z "$PID" ]; then
    echo "No se encontró el proceso fichaje.sh. ¿Está en ejecución?"
    exit 1
fi

# Guardar el PID en un archivo
echo "$PID" > /tmp/fichaje.pid
echo "PID de fichaje.sh guardado: $PID"

# Matar el proceso con kill -9
echo "Cerrando proceso fichaje.sh..."
kill -9 "$PID"

# Eliminar el archivo de PID
rm /tmp/fichaje.pid
echo "Proceso fichaje.sh eliminado."
