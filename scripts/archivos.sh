CREAR_DIRECTORIO="1"
COPIAR_ARCHIVOS="2"
MODIFICAR_PERMISOS="3"
VER_CONTENIDO="4"
BORRAR_ARCHIVO="5"
CAMBIAR_NOMBRE="6"
BORRAR_DIRECTORIO="7"
REGRESAR="9"
OPCIONES=($CREAR_DIRECTORIO $COPIAR_ARCHIVOS $MODIFICAR_PERMISOS $VER_CONTENIDO $BORRAR_ARCHIVO $CAMBIAR_NOMBRE $BORRAR_DIRECTORIO $REGRESAR)

function verMenu() {
    echo "1. CREAR DIRECTORIO"
    echo "2. COPIAR ARCHIVOS"
    echo "3. MODIFICAR PERMISOS A UN ARCHIVO"
    echo "4. VISUALIZAR EL CONTENIDO DE UN ARCHIVO"
    echo "5. BORRAR UN ARCHIVO"
    echo "6. CAMBIAR EL NOMBRE DE UN ARCHIVO"
    echo "7. BORRAR UN DIRECTORIO"
    echo "------------"
    echo "9. REGRESAR"
}

while true; do
    echo "------------------------------------------------------"
    echo "---         MENU DE SISTEMA DE ARCHIVOS            ---"
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
    
    if [[ "$eleccion_usuario" -eq $CREAR_DIRECTORIO ]]; then
        echo "Archivos: "
        ls -R
        echo ""
        echo "Ingresa el NOMBRE del directorio a crear: "
        read nombre_directorio
        
        if test -d $nombre_directorio; then
            echo "ERROR: Ya existe un directorio con ese nombre."
            echo ""
        else
            mkdir -p "$nombre_directorio"
            echo "Directorio $nombre_directorio creado."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $COPIAR_ARCHIVOS ]]; then
        echo "Archivos: "
        ls -R
        echo ""
        echo "Ingresa el NOMBRE del archivo a copiar: "
        read nombre_archivo
        
        echo "Ingresa el NOMBRE de la carpeta donde se va a copiar el archivo: "
        read nombre_directorio
        
        if test -f $nombre_archivo && test -d $nombre_directorio; then
            cp $nombre_archivo $nombre_directorio
            echo "Copiado $nombre_archivo al directorio $nombre_directorio"
            echo ""
        else
            echo "ERROR: El nombre del archivo y/o directorio no es válido."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $MODIFICAR_PERMISOS ]]; then
        echo ""
    fi
    if [[ "$eleccion_usuario" -eq $VER_CONTENIDO ]]; then
        echo "Archivos: "
        ls -R
        echo ""
        echo "Ingrese el NOMBRE del archivo a VISUALIZAR: "
        read nombre_archivo
        
        if test -f $nombre_archivo; then
            cat $nombre_archivo
            echo ""
        else
            echo "ERROR: Ingrese un nombre de archivo existente."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $BORRAR_ARCHIVO ]]; then
        echo "Archivos: "
        ls -R
        echo ""
        echo "Ingrese el NOMBRE del archivo a BORRAR: "
        read nombre_archivo
        
        if test -f $nombre_archivo; then
            rm $nombre_archivo
            echo "Archivo $nombre_archivo borrado."
            echo ""
        else
            echo "ERROR: Ingrese un nombre de archivo existente."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $CAMBIAR_NOMBRE ]]; then
        echo "Archivos: "
        ls -R
        echo ""
        echo "Ingresa el nombre ORIGINAL del archivo: "
        read nombre_original
        
        echo "Ingresa el NUEVO nombre del archivo: "
        read nombre_nuevo
        
        if test -f $nombre_archivo; then
            mv $nombre_original $nombre_nuevo
            echo "Nombre archivo $nombre_original cambiado a $nombre_nuevo"
            echo ""
        else
            echo "ERROR: Ingrese un nombre de archivo existente."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $BORRAR_DIRECTORIO ]]; then
        echo "Archivos: "
        ls
        echo ""
        echo "Ingrese el NOMBRE del directorio a BORRAR: "
        read nombre_directorio
        
        if test -f $nombre_directorio; then
            rm -r $nombre_directorio
            echo "Directorio $nombre_directorio borrado."
            echo ""
        else
            echo "ERROR: Ingrese un nombre de directorio existente."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $REGRESAR ]]; then
        exit
    fi
    
    sleep 2
done