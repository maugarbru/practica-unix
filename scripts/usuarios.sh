NOMBRE_USUARIOS="1"
NUMERO_USUARIOS="2"
AVERIGUAR_USUARIO="3"
ENVIAR_MENSAJE="4"
REGRESAR="9"
OPCIONES=($NOMBRE_USUARIOS $NUMERO_USUARIOS $AVERIGUAR_USUARIO $ENVIAR_MENSAJE $REGRESAR)

function verMenu() {
    echo "1. MOSTRAR NOMBRE DE USUARIOS CONECTADOS"
    echo "2. MOSTRAR NUMERO DE USUARIOS CONECTADOS"
    echo "3. AVERIGUAR SI UN USUARIO ESTA CONECTADO"
    echo "4. ENVIAR MENSAJE A UN USUARIO"
    echo "------------"
    echo "9. REGRESAR"
}

while true; do
    echo "------------------------------------------------------"
    echo "---              MENU DE USUARIOS                  ---"
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
    
    if [[ "$eleccion_usuario" -eq $NOMBRE_USUARIOS ]]; then
        echo "OK: NOMBRES de usuarios conectados actualmente: "
        who -us
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $NUMERO_USUARIOS ]]; then
        echo "OK: NUMERO de usuarios conectados actualmente: "
        who -q
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $AVERIGUAR_USUARIO ]]; then
        echo "Ingrese el NOMBRE del usuario que quiere averiguar: "
        read nombre_usuario
        who | grep $nombre_usuario
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $ENVIAR_MENSAJE ]]; then
        echo "Usuarios:"
        who -us
        echo ""
        echo "Ingrese el NOMBRE del usuario al que quiere enviar el mensaje: "
        read nombre_usuario
        write $nombre_usuario 
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $REGRESAR ]]; then
        exit
    fi
    
    sleep 2
done