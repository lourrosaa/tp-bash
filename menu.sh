#!/bin/bash

if [ "$1" == "-d" ]; then 
    echo "Eliminando entorno y deteniendo procesos en backround"
    rm -rf "$HOME/EPNro1"
    pkill -f consolidar.sh
    exit 0
fi



ARCHIVO_SALIDA="${FILENAME:-datos}.txt"
DIR_BASE="$HOME/EPNro1"


while true; do   
    echo "---MENÚ TP1---"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Listar por padrón"
    echo "4) Ver las 10 notas más altas"
    echo "5) Buscar datos por número de padrón"
    echo "6) Salir"

    read -p "Elija una opcion: " opcion

    case $opcion in

        1)
            mkdir -p "$DIR_BASE"
            mkdir -p "$DIR_BASE/entrada"
            mkdir -p "$DIR_BASE/salida"
            mkdir -p "$DIR_BASE/procesado"
            echo "Entorno Creado"
            ;;

        2)
            if  [ -d "$DIR_BASE" ] && [ -f "$DIR_BASE/consolidar.sh" ]; then
                bash $DIR_BASE/consolidar.sh &
                echo "En proceso"
            else
                echo "Error: no existe consolidar.sh"
            fi
        ;;


        3)
            if [ -f "$DIR_BASE/salida/$ARCHIVO_SALIDA" ]; then 
                sort -n $DIR_BASE/salida/$ARCHIVO_SALIDA
            else
                echo "Error: no existe el archivo"
            fi
            ;;


        4)
            if [ -f "$DIR_BASE/salida/$ARCHIVO_SALIDA" ]; then
                sort -k4 -n -r $DIR_BASE/salida/$ARCHIVO_SALIDA | head -10
            else
                echo "Error: no existe un archivo con ese nombre"
            fi
            ;;


        5)
            if [ -f "$DIR_BASE/salida/$ARCHIVO_SALIDA" ]; then
                read -p "Ingrese el padron: " padron
                grep "^$padron" "$DIR_BASE/salida/$ARCHIVO_SALIDA"
            else
                echo "Error"
            fi
            ;;

        6)
            echo "Saliendo."
            exit 0
            ;;

        *)
            echo "Opción incorrecta"
            ;;

    esac

done
