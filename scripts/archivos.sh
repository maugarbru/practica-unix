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

function cambiarPermisos() {
    echo "------------------------------------------------------"
    echo "---        CAMBIAR PERSMISOS DE UN USUARIO         ---"
    echo "------------------------------------------------------"
    ls -l
    echo "Ingrese el NOMBRE del archivo que quiere cambiar los permisos:"
    read nombre_archivo
    echo ""
    
    if [ ! -f $nombre_archivo ]; then
        echo "ERROR: Ingrese un nombre de archivo existente."
        return
    fi
    
    echo "0 PARA DEJAR SIN PERMISO"
    echo "1 PARA PERMITIR EJECUTAR"
    echo "2 PARA PERMITIR ESCRIBIR"
    echo "3 PARA PERMITIR EJECUTAR Y ESCRIBIR"
    echo "4 PARA PERMITIR LEER"
    echo "5 PARA PERMITIR LEER Y EJECUTAR"
    echo "6 PARA PERMITIR LEER Y ESCRIBIR"
    echo "7 PARA PERMITIR TODAS LAS ACCIONES AL ARCHIVO"
    
    while :; do
        echo "Ingrese el NUMERO del permiso para el USUARIO"
        read permiso_usuario
        
        [[ $permiso_usuario =~ ^[0-9]+$ ]] || {
            echo "ERROR: Ingrese un NUMERO valido."
            continue
        }
        
        if ((permiso_usuario >= 0 && permiso_usuario <= 7)); then
            break
        else
            echo "ERROR: El numero $permiso_usuario no es valido."
        fi
    done
    
    while :; do
        echo "Ingrese el NUMERO del permiso para el GRUPO"
        read permiso_grupo
        
        [[ $permiso_grupo =~ ^[0-9]+$ ]] || {
            echo "ERROR: Ingrese un NUMERO valido."
            continue
        }
        
        if ((permiso_grupo >= 0 && permiso_grupo <= 7)); then
            break
        else
            echo "ERROR: El numero $permiso_grupo no es valido."
        fi
    done
    
    while :; do
        echo "Ingrese el NUMERO del permiso para el OTROS usuarios"
        read permiso_otros
        
        [[ $permiso_otros =~ ^[0-9]+$ ]] || {
            echo -e "INGRESA UN NUMERO VALIDO \n"
            continue
        }
        
        if ((permiso_otros >= 0 && permiso_otros <= 7)); then
            break
        else
            echo "ERROR: El numero $permiso_otros no es valido."
        fi
    done
    
    chmod $permiso_usuario$permiso_grupo$permiso_otros $nombre_archivo
    
    echo "OK: Permisos modificados para el archivo $nombre_archivo"
    ls -l
    echo ""
}

while true; do
    echo "------------------------------------------------------"
    echo "---         MENU DE SISTEMA DE ARCHIVOS            ---"
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
            echo "OK: Directorio $nombre_directorio creado."
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
            echo "OK: Copiado $nombre_archivo al directorio $nombre_directorio"
            echo ""
        else
            echo "ERROR: El nombre del archivo y/o directorio no es valido."
            echo ""
        fi
    fi
    if [[ "$eleccion_usuario" -eq $MODIFICAR_PERMISOS ]]; then
        cambiarPermisos
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
            echo "OK: Archivo $nombre_archivo borrado."
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
            echo "OK: Nombre archivo $nombre_original cambiado a $nombre_nuevo"
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
            echo "OK: Directorio $nombre_directorio borrado."
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