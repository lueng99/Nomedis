#!/bin/bash

# Verificar si se proporciona un término de búsqueda
if [ -z "$1" ]; then
    echo "Por favor, proporcione un término de búsqueda."
    exit 1
fi

# Capitalizar la primera letra de la búsqueda
search_term=$(echo "$1" | sed 's/^\(.\)/\U\1/')

# Realizar la solicitud GET a la API de Wikipedia
url="https://en.wikipedia.org/api/rest_v1/page/summary/$search_term"
response=$(curl -s "$url")

# Extraer el primer enlace que comience con https://en.wikipedia.org/wiki/
link=$(echo "$response" | jq -r '.content_urls.desktop.page' | grep -oP 'https://en.wikipedia.org/wiki/\S+')

# Verificar si se encontró un enlace
if [ -z "$link" ]; then
    echo "No se encontró un enlace válido en la respuesta."
    exit 1
fi

# Descargar la página HTML
curl -s "$link" -o "$search_term.html"

# Convertir el archivo HTML a PDF (requiere wkhtmltopdf)
if command -v wkhtmltopdf &> /dev/null; then
    wkhtmltopdf "$search_term.html" "$search_term.pdf"
    echo "El archivo PDF se ha generado como $search_term.pdf"
else
    echo "Error: wkhtmltopdf no está instalado. No se puede convertir a PDF."
fi
