#!/bin/sh

# Función para pedir y validar el DNI
pedir_dni() {
    while true; do
        echo "Pon el IDN (sin letras)"
        read number

        # Asegurarse de que el DNI sea numérico y tenga 7 u 8 dígitos
        if [[ "$number" =~ ^[0-9]+$ ]] && { [ ${#number} -eq 7 ] || [ ${#number} -eq 8 ]; }; then
            return 0  # Si es válido, sale de la función
        else
            echo "El DNI no es válido. Debe ser un número de 7 u 8 dígitos."
        fi
    done
}

# Preguntar al usuario si quiere ver una carpeta o crear un documento
echo "¿Qué deseas hacer? (responde con a o b)"
echo "a) Ver un documento"
echo "b) Crear un documento"

read -r choice

case $choice in
    a)
        echo "Elegiste ver un documento."
        # Pedir el DNI y validarlo
        pedir_dni

        # Confirmar ubicación
        echo "Confirma el DNI, por favor"
        read numberIDN

        # Mostrar la lista de consultas si la carpeta existe
        if [ -d "$numberIDN" ]; then
            echo "Informes y fechas del paciente $numberID"
            ls "$numberIDN"
        else
            echo "No se encontraron registros para el paciente con DNI $numberIDN."
            exit 1
        fi

        # Preguntar qué informe desea ver
        echo "¿Qué informe deseas ver? (escribe la fecha del archivo, formato: YYYY-MM-DD.txt)"
        read day

        # Ruta del archivo
        file_path="$numberIDN/$day.txt"

        # Verificar si el archivo existe y mostrarlo
        if [ -f "$file_path" ]; then
            cat "$file_path"
        else
            echo "El archivo para el día $day no se encontró."
        fi
        ;;
    b)
        echo "Elegiste crear un documento."
        # Pedir el DNI y validarlo
        pedir_dni

        # Confirmar ubicación
        echo "Confirma el DNI, por favor"
        read numberDNI

        # Crear carpeta personal del paciente si no existe
        if [ ! -d "$numberDNI" ]; then
            mkdir "$numberDNI"
        fi

        # Obtener la fecha actual
        today=$(date +%Y-%m-%d)

        # Crear el archivo dentro de la carpeta del paciente
        file_path="$numberDNI/$today.txt"
        nano "$file_path"

        # Confirmar la creación del archivo
        echo "Archivo creado: $file_path"
        ;;
    *)
        echo "Opción inválida. Por favor ingresa a o b."
        ;;
esac

