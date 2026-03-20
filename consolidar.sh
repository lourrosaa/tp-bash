#!/bin/bash

ARCHIVO_SALIDA="${FILENAME:-datos}.txt"
DIR_BASE="$HOME/EPNro1"

mkdir -p "$DIR_BASE/salida"
mkdir -p "$DIR_BASE/procesado"

while true; do
    for archivo in "$DIR_BASE/entrada"/*.txt; do

        [ -e "$archivo" ] || continue

         echo "Procesando: $archivo"

       
        cat "$archivo" >> "$DIR_BASE/salida/$ARCHIVO_SALIDA"

      
        mv "$archivo" "$DIR_BASE/procesado/"

    done

    sleep 3
done

