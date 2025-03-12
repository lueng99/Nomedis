#!/bin/bash

total_time=28800
pause_time=5400
pause_at=14400
start_time=$(date +%s)
paused=false

echo "Iniciando fichaje. Ya puedes trabajar, en 4 horas tendrás tu descanso para comer."

while true; do
    current_time=$(date +%s)
    elapsed=$((current_time - start_time))

    if [[ "$paused" == false && $elapsed -ge $pause_at ]]; then
        echo "Pausa para comer de 1 hora y media iniciado. Tras ese periodo, el tiempo volverá a contar."
        sleep $pause_time
        start_time=$((start_time + pause_time))
        paused=true
        echo "Fin del descanso"
    fi

    remaining=$((total_time - (current_time - start_time)))
    if [[ $remaining -le 0 ]]; then
        break
    fi

    echo -ne "Tiempo restante: $(date -u -d @$remaining +%H:%M:%S) \r"
    sleep 1
done

echo -e "\nTrabajo completado. ¿Quieres seguir trabajando? (S/n)"
overtime_start=$(date +%s)
while true; do
    read -rsn1 key
    if [[ "$key" == "N" || "$key" == "n" ]]; then
        break
    fi
    sleep 1
    overtime_end=$(date +%s)
done

overtime_end=$(date +%s)
overtime=$((overtime_end - overtime_start))

if [[ $overtime -gt 2700 ]]; then
    day=$(date +"%d")
    filename="horasextradia_${day}.txt"
    echo "$overtime segundos de horas extra." > "$filename"
    echo "Has hecho horas extra, felicidades. Se ha creado un archivo con un tiempo extra de $overtime segundos."
fi

echo "Trabajo finalizado"
