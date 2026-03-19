#!/bin/bash

ARCHIVO_SALIDA="${FILENAME:-datos}.txt"
DIR_BASE="$HOME/EPNro1"

while true; do
    for archivo in "$DIR_BASE/entrada"/*.txt; do

        if [ ! -f "$archivo" ]; then
            continue
        fi

       
        cat "$archivo" >> "$DIR_BASE/salida/$ARCHIVO_SALIDA"

      
        mv "$archivo" "$DIR_BASE/procesado/"

    done

    sleep 3
done


Codigo Lour ----------------------------------------------------------------


