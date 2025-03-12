#!/bin/bash

# Solicitar entrada del usuario
read -p "Ingrese el término de búsqueda: " search

# Codificar el término de búsqueda para URL
encoded_search=$(echo "$search" | jq -sRr @uri)

# Reemplazar espacios por guiones bajos en el nombre del archivo
file_name=$(echo "$search" | tr ' ' '_').html

# Obtener los datos de Wikipedia en formato JSON
inp=$(curl -s -H "Accept:application/json" "https://en.wikipedia.org/w/api.php?action=opensearch&format=json&redirects=return&search=$encoded_search")

# Obtener el número de resultados disponibles
length=$(jq '.[1] | length' <<< "$inp")

echo -e "\nTop $length resultados relevantes:\n"

# Iterar sobre los resultados
for i in $(seq 0 $((length-1))); do
    title=$(jq -r --argjson i "$i" '.[1][$i]' <<< "$inp")
    about=$(jq -r --argjson i "$i" '.[2][$i]' <<< "$inp")
    link=$(jq -r --argjson i "$i" '.[3][$i]' <<< "$inp")

    echo -e "\033[0;32m Title: \033[0;36m $title"
    echo -e "\033[0;32m About: \033[0;36m $about"
    echo -e "\033[0;32m Wiki Link: \033[0;36m $link\n"

    # Guardar el primer link
    if [[ $i -eq 0 ]]; then
        first_link=$link
    fi
done

echo -e "\033[0m"

# Descargar el contenido de la primera página en un archivo con el nombre personalizado
if [[ -n "$first_link" ]]; then
    echo "Descargando la página web en $file_name..."
    curl -s "$first_link" > "$file_name"
    echo "Descarga completada. Archivo guardado como $file_name"

    # Mostrar el contenido del archivo con cat
    echo -e "\nMostrando contenido del archivo $file_name:\n"
    lynx "$file_name"
else
    echo "No se encontró un enlace válido para descargar."
fi
