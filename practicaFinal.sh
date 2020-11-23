COMANDOS="1"
USUARIOS="2"
ARCHIVOS="3"
TERMINAR="9"
OPCIONES=($COMANDOS $USUARIOS $ARCHIVOS $TERMINAR)

function verMenu() {
    echo "Menu principal. Seleccione una de las opciones:"
    echo "1: COMANDOS GENERALES"
    echo "2: USUARIOS"
    echo "3: SISTEMA DE ARCHIVOS"
    echo "-----------"
    echo "9: TERMINAR"
}

while true; do
    echo "------------------------------------------------------"
    echo "---      Practica final de Sistemas Operativos     ---"
    echo "---      Hecho por Mauricio Garzon Brunal          ---"
    echo "------------------------------------------------------"
    verMenu
    read eleccion_usuario
    
    while [[ ! " ${OPCIONES[@]} " =~ " ${eleccion_usuario} " ]]; do
        echo "------------------------------------------------------"
        echo "- La opcion escogida $eleccion_usuario no es valida  -"
        echo "------------------------------------------------------"
        verMenu
        read eleccion_usuario
    done
    
    if [[ "$eleccion_usuario" -eq $COMANDOS ]]; then
        bash scripts/comandos.sh
    fi
    if [[ "$eleccion_usuario" -eq $USUARIOS ]]; then
        bash scripts/usuarios.sh
    fi
    if [[ "$eleccion_usuario" -eq $ARCHIVOS ]]; then
        bash scripts/archivos.sh
    fi
    if [[ "$eleccion_usuario" -eq $TERMINAR ]]; then
        exit
    fi
done