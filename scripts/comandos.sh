VER_HORA="1"
VER_RUTA="2"
CAMBIAR_PASSWORD="3"
DISCO_LIBRE="4"
DISCO_UTILIZADO="5"
VER_PROCESOS="6"
REGRESAR="9"
OPCIONES=($VER_HORA $VER_RUTA $CAMBIAR_PASSWORD $DISCO_LIBRE $DISCO_UTILIZADO $VER_PROCESOS $REGRESAR)

function verMenu() {
    echo "1. VISUALIZAR HORA DEL SISTEMA"
    echo "2. PATH O RUTA ACTUAL"
    echo "3. CAMBIO DE PASSWORD"
    echo "4. MOSTRAR DISCO LIBRE"
    echo "5. MOSTRAR DISCO UTILIZADO"
    echo "6. VISUALIZAR PROCESOS ACTIVOS"
    echo "------------"
    echo "9. REGRESAR"
}

while true; do
    echo "------------------------------------------------------"
    echo "------------ MENU DE COMANDOS GENERALES --------------"
    echo "------------------------------------------------------"
    verMenu
    read eleccion_usuario
    
    while [[ ! " ${OPCIONES[@]} " =~ " ${eleccion_usuario} " ]]; do
        echo "------------------------------------------------------"
        echo "- La opción escogida $eleccion_usuario no es válida  -"
        echo "------------------------------------------------------"
        verMenu
        read eleccion_usuario
    done
    
    if [[ "$eleccion_usuario" -eq $VER_HORA ]]; then
        echo "Fecha:"
        date
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $VER_RUTA ]]; then
        echo "Ruta actual:"
        pwd
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $CAMBIAR_PASSWORD ]]; then
        passwd
    fi
    if [[ "$eleccion_usuario" -eq $DISCO_LIBRE ]]; then
        df -h | more
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $DISCO_UTILIZADO ]]; then
        du -h | more
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $VER_PROCESOS ]]; then
        ps -aux | more
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $REGRESAR ]]; then
        exit
    fi
    
    sleep 2
done